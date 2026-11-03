{ pkgs, ... }:
let
  claude-code-wrapped = pkgs.writeShellApplication {
    name = "claude";

    runtimeInputs = with pkgs; [
      claude-code
      bubblewrap
      git
    ];

    text = ''
      CLAUDE_ARGS=()
      EXTRA_MOUNTS=()
      MOUNT_PATHS=()

      while [[ $# -gt 0 ]]; do
        case "$1" in
          --mount)
            EXTRA_MOUNTS+=(--ro-bind "''${2%/}" "''${2%/}")
            MOUNT_PATHS+=("''${2%/}")
            shift 2
            ;;
          *) CLAUDE_ARGS+=("$1"); shift ;;
        esac
      done

      CREDS_FILE="$HOME/.claude/.credentials.json"

      mkdir -p "$HOME/.claude"
      touch "$HOME/.claude.json"
      touch "$CREDS_FILE"

      hide_gitignored() {
        local dir="$1"
        if git -C "$dir" rev-parse --git-dir > /dev/null 2>&1; then
          while IFS= read -r -d "" file; do
            [[ "$file" =~ ^\.claude(/|$) ]] && continue
            [[ "$file" =~ (^|/)CLAUDE\.md$ ]] && continue
            [[ "$file" =~ (^|/)node_modules(/|$) ]] && continue
            [[ "$file" =~ (^|/)vendor(/|$) ]] && continue
            [[ "$file" =~ (^|/)build(/|$) ]] && continue
            [[ "$file" =~ (^|/)target(/|$) ]] && continue
            [[ "$file" =~ (^|/)\.venv(/|$) ]] && continue
            if [[ -L "$dir/$file" ]]; then
              continue
            elif [[ -d "$dir/$file" ]]; then
              HIDE_BINDS+=(--tmpfs "$dir/$file")
            elif [[ -f "$dir/$file" ]]; then
              HIDE_BINDS+=(--ro-bind /dev/null "$dir/$file")
            fi
          done < <(git -C "$dir" ls-files -z --ignored --exclude-standard --others --directory)
        fi
      }

      HIDE_BINDS=()
      hide_gitignored "$PWD"
      for mpath in "''${MOUNT_PATHS[@]}"; do
        hide_gitignored "$mpath"
      done

      bwrap \
        --clearenv \
        --ro-bind /usr /usr \
        --ro-bind /bin /bin \
        --ro-bind-try /lib /lib \
        --ro-bind-try /lib64 /lib64 \
        --ro-bind-try /nix /nix \
        --ro-bind-try /etc/nix /etc/nix \
        --ro-bind-try /etc/profiles /etc/profiles \
        --ro-bind-try /etc/static/profiles /etc/static/profiles \
        --ro-bind-try /run/current-system /run/current-system \
        --ro-bind-try "$HOME/.cargo" "$HOME/.cargo" \
        --ro-bind-try "$HOME/.mix" "$HOME/.mix" \
        --ro-bind /etc/resolv.conf /etc/resolv.conf \
        --ro-bind /etc/hosts /etc/hosts \
        --ro-bind /etc/passwd /etc/passwd \
        --ro-bind /etc/group /etc/group \
        --ro-bind /etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-bundle.crt \
        --bind "$PWD" "$PWD" \
        --ro-bind-try "$PWD/.git/hooks" "$PWD/.git/hooks" \
        --ro-bind-try "$PWD/.git/config" "$PWD/.git/config" \
        --bind "$HOME/.claude" "$HOME/.claude" \
        --bind "$CREDS_FILE" "$HOME/.claude/.credentials.json" \
        --bind "$HOME/.claude.json" "$HOME/.claude.json" \
        --setenv HOME "$HOME" \
        --setenv USER "$USER" \
        --setenv PATH "$PATH" \
        --setenv TERM "''${TERM:-xterm-256color}" \
        --setenv COLORTERM "''${COLORTERM:-}" \
        --setenv LANG "''${LANG:-C.UTF-8}" \
        --setenv SSL_CERT_FILE /etc/ssl/certs/ca-bundle.crt \
        --tmpfs /tmp \
        --proc /proc \
        --dev /dev \
        --share-net \
        --unshare-pid \
        --die-with-parent \
        --chdir "$PWD" \
        "''${EXTRA_MOUNTS[@]}" \
        "''${HIDE_BINDS[@]}" \
        claude "''${CLAUDE_ARGS[@]}"
    '';
  };
in
{
  programs.claude-code = {
    enable = true;
    package = claude-code-wrapped;
    settings = {
      model = "opus";
      outputStyle = "Learning";
      disableAutoMode = "disable";
      theme = "auto";
      feedbackSurveyRate = 0;
      env = {
        CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
        DISABLE_TELEMETRY = "1";
      };
    };
    context = ''
      You run inside a minimal bubblewrap sandbox. The current working directory
      is mounted read-write, but gitignored files in it are masked — 
      don't assume secrets or local env files are present. Most of the 
      host filesystem, other dotfiles, sibling repos, and host processes are not 
      visible. If a task needs something outside the sandbox, stop and ask 
      — suggest re-running with `--mount <path>` or have the user run the command 
      themselves.

      Be concise/terse. I have ADHD, so I need to focus on the relevant things.
      If uncertain, say so. Never invent APIs, types, or file paths.
      Ask before acting on ambiguous requests.
      Don't add dependencies without asking.
      Don't overexplain comments, keep them simple and concise! Only add comments if necessary!
      Don't delete comments that are still relevant.
      Make minimal, focused changes. Ask before refactoring unrelated code.
      Match existing style and patterns in the file.
      Prefer small, composable functions. No premature abstraction.

      I'm learning to code. Pair-program with me. Language and level vary by project; ask if they aren't stated.
      - Before non-trivial code, give 2-3 options with tradeoffs and a recommendation. I choose.
      - Ask one question at a time and work in small steps. Tell me how to check each one.
      - When I'm stuck, give a hint first and the solution only if I ask.
      - Correct my misunderstandings directly.

      Before writing any code, stop at the first rung that holds:
      - Does this need to be built at all? (YAGNI)
      - Does the standard library already do this? Use it.
      - Does a native platform feature cover it? Use it.
      - Does an already-installed dependency solve it? Use it.
      - Only then: write the minimum code that works.
      - Pick the edge-case-correct option when two stdlib approaches are the same size, lazy means less code, not the flimsier algorithm.

      Don't use the `gh` cli, use the http api directly.
      Don't run `nix` commands.
      Use `git` only for diffs. Don't commit.
    '';
  };
}
