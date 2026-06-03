# {
#   lib,
#   stdenv,
#   fetchFromGitHub,
# }:
# stdenv.mkDerivation rec {
#   pname = "cloudy-gtk-theme";
#
#   src = fetchFromGitHub {
#     owner = "i-mint";
#     repo = "Cloudy";
#     rev = "0856aeeac97bb0608e1661f7d1adb0d132b80b22";
#     sha256 = "sha256-025TjKalvdw0pxGSpDeiK23bXhu5oui5ZCWZ6j2OC1I=";
#   };
#
#   dontBuild = true;
#
#   installPhase = ''
#     runHook preInstall
#
#     mkdir -p $out/share/themes
#
#     # Copy all individual theme directories into the standard Nix theme path
#     # (Adjust the glob pattern if the repo structure changes)
#     cp -a Cloudy-* $out/share/themes/
#
#     runHook postInstall
#   '';
#
#   meta = with lib; {
#     description = "Cloudy GTK Theme collection";
#     homepage = "https://github.com/i-mint/Cloudy";
#     license = licenses.gpl3Only;
#     platforms = platforms.linux;
#   };
# }

{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "cloudy-gtk-theme";
  version = "unstable-2024";

  src = fetchFromGitHub {
    owner = "i-mint";
    repo = "Cloudy";
    rev = "0856aeeac97bb0608e1661f7d1adb0d132b80b22";
    sha256 = "sha256-025TjKalvdw0pxGSpDeiK23bXhu5oui5ZCWZ6j2OC1I=";
  };

  # No build step needed – the repo is pre-built CSS
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    themeDir="$out/share/themes"
    mkdir -p "$themeDir"

    # Install only the requested variant
    cp -r Cloudy-Grey-Dark "$themeDir/"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Cloudy GTK theme (Grey Dark variant) – based on Arc Theme";
    homepage    = "https://github.com/i-mint/Cloudy";
    license     = licenses.gpl3Only;
    platforms   = platforms.linux;
  };
}
