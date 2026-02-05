{ lib, ... }:
{
  options = {
    name = lib.mkOption { type = lib.types.str; };
    age  = lib.mkOption { type = lib.types.int; };
    lesons = lib.mkOption { type = lib.types.attrsOf (lib.types.anything); };
  };
}
