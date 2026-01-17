let
  name = "Nix";
  x = "$1";
in
{
  greeting = "hello ${name}";
  value = "${x}";
}
