{ writeShellScriptBin, cowsay, audience ? {txt="world";} }:
writeShellScriptBin "hello" ''
  echo "hello, ${audience.txt}!" | ${cowsay}/bin/cowthink

''
