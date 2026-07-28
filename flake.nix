{
  description = "Neovim configuration";

  # Standalone:
  #   nix run github:alexisquintero/nvim
  #   Uses NVIM_APPNAME=nvim-flake, isolated from any existing nvim install.
  #   Plugins are fetched by lazy.nvim on first run into ~/.local/share/nvim-flake/
  #
  # As a home-manager module:
  #   inputs.nvim-config.url = "github:alexisquintero/nvim";
  #
  #   imports = [ inputs.nvim-config.homeManagerModules.default ];

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

      deps = pkgs: with pkgs; [
        nixd
        cmake
        gcc
        lua-language-server
        imagemagick
        curl
        tree-sitter
      ];
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.writeShellApplication {
            name = "nvim";
            runtimeInputs = [ pkgs.neovim ] ++ deps pkgs;
            text = ''
              config_parent=$(mktemp -d)
              trap 'rm -rf "$config_parent"' EXIT
              ln -s ${self} "$config_parent/nvim-flake"
              NVIM_APPNAME=nvim-flake XDG_CONFIG_HOME="$config_parent" exec nvim "$@"
            '';
          };
        });

      homeManagerModules.default = { pkgs, ... }: {
        xdg.configFile."nvim" = {
          recursive = true;
          source = self;
        };

        programs.neovim = {
          enable = true;
          extraPackages = deps pkgs;
          vimAlias = true;
          vimdiffAlias = true;
        };
      };
    };
}
