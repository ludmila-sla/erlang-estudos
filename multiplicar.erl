-module(multiplicar).
-export([mult/1]).

mult(N) when N > 0 ->
    X = N,
    mult(N, 1, X).

mult(0, _, _) ->
    ok;

mult(N, Contador, X) ->
    io:format("Resultado: ~p~n", [Contador * X]),
    mult(N - 1, Contador + 1, X).
