-module(loop_exemplo).
-export([imprimir_numeros/1]).


imprimir_numeros(N) when N > 0 ->
    imprimir_numeros(N, 1).


imprimir_numeros(0, _) ->
    ok;
imprimir_numeros(N, Contador) ->
    io:format("Número: ~p~n", [Contador]),
    imprimir_numeros(N - 1, Contador + 1).