{
  description = "C++ flake using CMake, Ninja and clang";

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
          buildInputs = [ ];
          clang21Stdenv = pkgs.llvmPackages_21.stdenv;
          nativeBuildInputs = with pkgs; [
            cmakeMinimal
            ninja
          ];
        in
        {
          devShells.default = pkgs.mkShell.override { stdenv = clang21Stdenv; } {
            inherit buildInputs nativeBuildInputs;
          };

          packages.default = clang21Stdenv.mkDerivation {
            inherit buildInputs nativeBuildInputs;
            pname = "myapp";
            src = ./.;
            version = "0.0.1";
          };
        };
    };
}
