{ writeShellScriptBin, txt ? "World!", cowsay }:

writeShellScriptBin "cow" ''
  echo "Hello, ${txt}" | ${cowsay}/bin/cowsay
''
