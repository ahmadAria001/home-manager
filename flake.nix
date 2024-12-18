{
  description = "Home Manager configuration of tereza";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pyprland.url = "github:hyprland-community/pyprland";

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { 
    self,
    nixpkgs, 
    home-manager, 
    nixvim, 
    spicetify-nix,
    pyprland,
    ... 
  }@inputs:
    let
      system = "x86_64-linux";
      config = {
      	allowUnfree = true;
	allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
            "intelephense"
	    "nvidia-x11"
        ];
	intelephense.accept_license = true;
      	android_sdk.accept_license = true;
	nvidia-x11.unfreeRedistributable = true;
      };
      pkgs = import nixpkgs {
	inherit system;
	config = {
		allowUnfree = true;
		allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
		  "intelephense"
		  "nvidia-x11"
		];
		intelephense.accept_license = true;
		android_sdk.accept_license = true;
		nvidia-x11.unfreeRedistributable = true;
	};
      };
    in {
      homeConfigurations."tereza" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
	extraSpecialArgs = {
	  inherit inputs;
	  inherit nixvim;

	  inherit spicetify-nix;
	  inherit pyprland;
	  overlays = [
	   inputs.hyprpanel.overlay.${system}
	  ];
	};
      };
    };
}
