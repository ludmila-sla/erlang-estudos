-module(validacao).
-export([valor_valido/1]).

valor_valido(Valor) when Valor > 0 -> true;
valor_valido(_) -> false.