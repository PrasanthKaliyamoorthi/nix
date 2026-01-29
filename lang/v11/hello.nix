
{ stdenv, fetchzip }:

stdenv.mkDerivation {
  pname = "hello";
  version = "2.12.1";

  src = fetchzip {
    url = "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz";
    sha256 = "sha256-4GQeKLIxoWfYiOraJub5RsHNVQBr2H+3bfPP22PegdU=";
  };
}
