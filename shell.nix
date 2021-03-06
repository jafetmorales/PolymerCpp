with import <nixpkgs> {};

( let

    PolymerCpp = pkgs.python35Packages.buildPythonPackage rec {
      name = "PolymerCpp-${version}";
      version = "0.1.3";

      src = ./.;

      propagatedBuildInputs = [ pkgs.python35Packages.numpy
                                pkgs.python35Packages.tkinter
      			        pkgs.python35Packages.matplotlib ];
      
    };

  in pkgs.python35.withPackages (ps: [ ps.sphinx
				       pkgs.ncurses
				       pkgs.netbeans
				       ps.ipython
				       PolymerCpp])
).env