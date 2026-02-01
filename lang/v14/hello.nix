{ stdenv, fetchzip, }:

stdenv.mkDerivation {
  pname = "hello";
  version = "v0.1";

  src = fetchzip {
    url = "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz";
    hash = "sha256-4GQeKLIxoWfYiOraJub5RsHNVQBr2H+3bfPP2
2PegdU=
";
  };
}
