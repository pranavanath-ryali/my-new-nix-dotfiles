{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "cloudy-gtk-theme";

  src = fetchFromGitHub {
    owner = "i-mint";
    repo = "Cloudy";
    rev = "0856aeeac97bb0608e1661f7d1adb0d132b80b22";
    sha256 = "sha256-025TjKalvdw0pxGSpDeiK23bXhu5oui5ZCWZ6j2OC1I=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes

    # Copy all individual theme directories into the standard Nix theme path
    # (Adjust the glob pattern if the repo structure changes)
    cp -a Cloudy-* $out/share/themes/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Cloudy GTK Theme collection";
    homepage = "https://github.com/i-mint/Cloudy";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
  };
}
