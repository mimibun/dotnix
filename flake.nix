{
  description = "mimi's nix flakes :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:epireyn/niri-flake?rev=ec2063483ea6d98c71d0e7467b5c065f3ba1ecb8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
    affinity-nix = {
      url = "github:mrshmllow/affinity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  outputs =
    {
      nixpkgs,
      niri,
      apple-fonts,
      home-manager,
      affinity-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        bunnypad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            username = "mimi";
          };
          modules = [
            home-manager.nixosModules.home-manager
            niri.nixosModules.niri

            {
              nixpkgs.overlays = [ affinity-nix.overlays.default ];

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "backup";
              };
            }

            ./hosts/bunnypad
          ];
        };

        bunnystation = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            username = "mimi";
          };
          modules = [
            home-manager.nixosModules.home-manager
            niri.nixosModules.niri

            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "backup";
              };
            }

            ./hosts/bunnystation
          ];
        };
      };
    };
}
