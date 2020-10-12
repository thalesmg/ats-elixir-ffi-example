let
  sources = import ./nix/sources.nix;
  nixpkgs = import sources.nixpkgs {};
  elixir = nixpkgs.beam.packages.erlangR23.elixir;
in
nixpkgs.mkShell {
  buildInputs = [
    elixir
    nixpkgs.ats2
  ];
}
