{
  description = "mimi's nix flakes :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-fonts = {
      url= "github:Lyndeno/apple-fonts.nix";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
  };

  outputs = 
    {
      nixpkgs,
      home-manager,
      stylix,
      apple-fonts,
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
            stylix.nixosModules.stylix
            
            {
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
      };

  };
}
