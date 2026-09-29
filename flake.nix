{
  description = "Flake templates for my programming languages of choice";

  outputs =
    { self }:
    let
      mkWelcomeText = ''
        # Getting Started
        - run `nix develop` to enter the development environment
        - run `nix build` to build the app

        # To enable direnv usage
        - run `direnv allow`
      '';
    in
    {
      templates = {
        cpp = {
          description = "C++ flake using CMake, Ninja and clang";
          path = ./cpp;
          welcomeText = mkWelcomeText;
        };
        python = {
          description = "Python bare flake (nixpkgs libs no pip/poetry/uv)";
          path = ./python;
          welcomeText = mkWelcomeText;
        };
        default = self.templates.cpp;
      };
    };

}
