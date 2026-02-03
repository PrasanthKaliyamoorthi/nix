{ stdenv, lib }:
let
  fs = lib.fileset;
  # sourceFiles = fs.difference ./. (fs.unions [
  #   (fs.maybeMissing ./result)
  #   (fs.fileFilter (file: file.hasExt "nix") ./.)
  #   ./npins
  # ]);
  sourceFiles = fs.intersection
    (fs.gitTracked ./.)
    (fs.unions [
      (fs.fileFilter (file: file.hasExt "txt") ./.)
    ]);
in
  fs.trace sourceFiles
  stdenv.mkDerivation {
    name = "fileset";
    src = fs.toSource {
      root = ./.;
      fileset = sourceFiles;
    };

    postInstall = ''
      mkdir $out
      cp -vr . $out
    '';
  }


