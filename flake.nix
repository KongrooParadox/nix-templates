{
  description = "Flake templates for my programming languages of choice";

  outputs = { self }: {
    templates = {
      cpp = {
        description = "C++ flake using CMake, Ninja and clang";
        path = ./cpp;
        welcomeText = ''
          # Getting Started
          - run `nix develop` to enter the development environment
          - run `nix build` to build the app

          # To enable direnv usage
          - run `direnv allow`
        '';
      };
      default = self.templates.cpp;
    };
  };

}
