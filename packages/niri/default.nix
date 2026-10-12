{
  niri,
  makeWrapper,
  symlinkJoin,
}:
symlinkJoin {
  name = "niri-wrapped";
  paths = [ niri ];
  nativeBuildInputs = [ makeWrapper ];
  passthru = niri.passthru;
  postBuild = ''
    cp -r ${./config} $out/config
    wrapProgram $out/bin/niri-session \
    --set NIRI_CONFIG "$out/config/config.kdl"
    '';
  meta.mainProgram = "niri";
}
