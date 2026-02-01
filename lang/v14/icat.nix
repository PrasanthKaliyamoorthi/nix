{ stdenv, fetchFromGitHub, xorg, imlib2 }:

stdenv.mkDerivation {
  pname = "icat";
  version = "v0.5";

  src = fetchFromGitHub {
    owner = "atextor";
    repo = "icat";
    rev = "v0.5";
    hash = "sha256-aiLPVdKSppT/PWPW0Ue475WG61pBLh8OtLuk2/UU3nM=
";
  };

  buildInputs = [
    imlib2
    xorg.libX11
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp icat $out/bin

    runHook postInstall
  '';
}
