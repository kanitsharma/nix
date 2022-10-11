{
  description = "Flake for managing templates";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.bashInteractive ];
          buildInputs = [ pkgs.hello ];
        };

        templates.go = {
          path = ./templates/go;
          description = "A simple go template";
          welcomeText = ''
            # Using kimera/go
          '';
        };

        templates.default = self.templates.go;
      }
    );
}