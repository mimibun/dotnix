{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        vscodevim.vim
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        bbenoist.nix
        fill-labs.dependi
        bradlc.vscode-tailwindcss
        # cordx56.rustowl-vscode - isnt there yet i think  
      ];

      userSettings = {
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "catppuccin-macchiato";
        "editor.fontFamily" = "Maple Mono NF";
        "editor.fontLigatures" = false;
        "editor.fontWeight" = "600";
        "editor.inlayHints.enabled" = "off";
        "editor.minimap.enabled" = false;
        "editor.stickyScroll.enabled" = false;
        "explorer.confirmDelete" = false;
        "terminal.integrated.cursorStyle" = "line";
        "github.copilot.editor.enableAutoCompletions" = false;
        "files.exclude" = {
        "**/.DS_Store" = false;
        "**/.git" = false;
        "**/.hg" = false;
        "**/.svn" = false;
        "**/CVS" = false;
        "**/Thumbs.db" = false;
        };
        "terminal.integrated.fontFamily" = "Maple Mono NF";
        "terminal.integrated.fontWeight" = "600";
        "terminal.integrated.fontWeightBold" = "800";
        "terminal.integrated.fontLigatures.featureSettings" = "\"calt\" on";
        "terminal.integrated.initialHint" = false;
        "terminal.integrated.stickyScroll.enabled" = false;
        "window.commandCenter" = false;
        "window.customTitleBarVisibility" = "never";
        "window.menuBarVisibility" = "toggle";
        "window.titleBarStyle" = "native";
        "rust-analyzer.lens.implementations.enable" = false;
        "rust-analyzer.hover.actions.implementations.enable" = false;
        "rust-analyzer.lens.debug.enable" = false;
        "rust-analyzer.lens.run.enable" = false;
        "editor.allowVariableFonts" = false;
        "chat.agent.enabled" = false;
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
        "explorer.compactFolders" = false;
      };

      keybindings = [
        {
          key = "up";
          command = "-cursorUp";
          when = "textInputFocus";
        }
        {
          key = "down";
          command = "-cursorDown";
          when = "textInputFocus";
        }
        {
          key = "left";
          command = "-cursorLeft";
          when = "textInputFocus";
        }
        {
          key = "right";
          command = "-cursorRight";
          when = "textInputFocus";
        }
        {
          key = "ctrl+shift+end";
          command = "-cursorBottomSelect";
          when = "textInputFocus";
        }
        {
          key = "alt+k";
          command = "selectPrevSuggestion";
          when = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
        }
        {
          key = "alt+j";
          command = "selectNextSuggestion";
          when = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
        }
      ];
    };
  };
}