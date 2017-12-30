{ nixpkgs ? <nixpkgs>
, system ? builtins.currentSystem
}:

let
  pkgs = import nixpkgs { inherit system; };
in
pkgs.mc.overrideDerivation (args: {
  preConfigure = ''
    # Copy syntax file
    cp ${./nix.syntax} misc/syntax/nix.syntax

    # Add syntax file to the list of data files to be installed
    sed -i -e "s|yxx.syntax|yxx.syntax nix.syntax|" misc/syntax/Makefile.am

    # Add Nix syntax to the syntax configuration
    sed -i -e '/unknown$/i \
    file ..\\*\\\\.nix$ Nix\\sExpression\
    include nix.syntax\
    ' misc/syntax/Syntax.in

    # Regenerate configure script
    autoreconf -f -v -i
  '';

  buildInputs = args.buildInputs ++ [ pkgs.autoconf pkgs.automake pkgs.libtool ];
})
