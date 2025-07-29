{
  description = "My NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    };

    # Add Home-Manager input
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs"; # Crucial to use the same nixpkgs
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }: {
    nixosConfigurations."ThinkPad-x250" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nix.registry.nixpkgs.flake = nixpkgs; }
        ./configuration.nix
        nixos-wsl.nixosModules.wsl

        # Integrate Home-Manager as a NixOS module
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true; # Recommended for NixOS
          home-manager.useUserPackages = true;
          home-manager.users."aaditya" = { # Replace 'yourusername'
            imports = [ ./home.nix ]; # Points to your user-specific config
	  home.stateVersion = "24.11";
          };
        }
      ];
    };
  };
}
