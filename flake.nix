{
  description = "Flake for managing templates";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in {
      packages.aarch64-darwin.hello = pkgs.hello;

      devShell.aarch64-darwin =
        pkgs.mkShell { buildInputs = [ self.packages.aarch64-darwin.hello pkgs.cowsay ]; };

      templates.go = {
        path = ./templates/go;
        description = "A simple go template";
        welcomeText = ''
          # Using kimera/go
        '';
      };

      templates.default = self.templates.go;
    };
}