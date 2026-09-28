# My flake templates

Collection of basic templates for programming languages I use.

## Usage

To list the available templates use :

```shell
nix flake show github:KongrooParadox/nix-templates
```

Then to init a new project :

```shell
mkdir myApp && cd myApp
nix flake init -t github:KongrooParadox/nix-templates#<lang>
```

> Replace `<lang>` with the template for the language you need

## Thanks

[flake-parts](https://github.com/hercules-ci/flake-parts) for letting me reduce the boilerplate.
