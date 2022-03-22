{
  description = ''Bindings for the CFITSIO library'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimcfitsio-master.flake = false;
  inputs.src-nimcfitsio-master.owner = "ziotom78";
  inputs.src-nimcfitsio-master.ref   = "master";
  inputs.src-nimcfitsio-master.repo  = "nimcfitsio.git";
  inputs.src-nimcfitsio-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimcfitsio-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimcfitsio-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}