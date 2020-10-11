%{^
#include "erl_nif.h"
%}

typedef ErlNifEnv = $extype "ErlNifEnv"
typedef ERL_NIF_TERM = $extype "ERL_NIF_TERM"

extern fun enif_make_int: (ptr, int) -> ERL_NIF_TERM = "mac#enif_make_int"

extern fun bah_nif: (ptr, int, ptr) -> ERL_NIF_TERM = "ext#bah_nifao"

(* implement bah_nif(env, argc, argv) = bah_val where { *)
(*   val bah_val = enif_make_int (env, 17) *)
(* } *)

implement bah_nif(env, argc, argv) = enif_make_int (env, 17)

(* extern fun bah_nif(env: ErlNifEnv, argc: int, argv: ERL_NIF_TERM): ERL_NIF_TERM = enif_make_int (env, 17) *)

%{$
static ErlNifFunc nif_funcs[] = {
  {"bah", 0, bah_nifao}
};

ERL_NIF_INIT(Elixir.Bah, nif_funcs, NULL, NULL, NULL, NULL)
%}

implement main0() = ()
