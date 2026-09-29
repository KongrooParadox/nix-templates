{
  description = "Python bare flake (nixpkgs libs no pip/poetry/uv)";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        let
          # used by both the package build & the devShell
          pythonLibs = ps: [ ];
        in
        {
          devShells.default = pkgs.mkShell {
            packages = [
              (pkgs.python3.withPackages pythonLibs)
              pkgs.pyright
              pkgs.ruff
            ];
          };
          packages.default = pkgs.writers.writePython3Bin "myapp" {
            libraries = pythonLibs;
            doCheck = false;
          } ./main.py;
        };
    };
}
