{ pkgs, ... }:
{
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium.fhs;

    profiles.default = {
      extensions =
        with pkgs.vscode-extensions;
        [
          bbenoist.nix
          jnoortheen.nix-ide
          rust-lang.rust-analyzer
          tamasfe.even-better-toml
          vscodevim.vim
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons
          fill-labs.dependi
          bradlc.vscode-tailwindcss
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "rustowl-vscode";
            publisher = "cordx56";
            version = "0.4.0";
            sha256 = "9c183110877a994eff763fdaa0f6aabd53e118f72116a6741d44325781e38bc3";
          }
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
        "editor.formatOnSave" = true;
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
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings" = {
          "nil" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
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
