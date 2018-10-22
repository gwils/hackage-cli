{ nixpkgs ? import <nixpkgs> {}
, compiler ? "default"
}:
let
  inherit (nixpkgs) pkgs;

  haskellPackages =
    if compiler == "default"
    then pkgs.haskellPackages
    else pkgs.haskell.packages.${compiler};

  modifiedHaskellPackages =
    haskellPackages.override {
      overrides = self: super: {
        netrc = pkgs.haskell.lib.dontCheck super.netrc;
      };
    };

  drv = modifiedHaskellPackages.callPackage ./hackage-cli.nix {};

in
  drv
  # if pkgs.lib.inNixShell then drv.env else drv
