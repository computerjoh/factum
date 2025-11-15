{
  description = "Dev shell with Bun, Node.js, and Biome installed globally";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          bun
          nodejs_22
          biome
        ];

        shellHook = ''
          echo "🧰 Dev shell ready!"
          echo "bun $(bun --version)"
          echo "node $(node -v)"
          echo "biome $(biome --version)"
        '';
      };
    });
}
