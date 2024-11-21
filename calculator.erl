-module(calculator).
-export([somar/2, subtrair/2, multiplicar/2, dividir/2]).

%comentários

somar(X, Y) when is_number(X), is_number(Y) ->
    X + Y;
somar(_, _) ->
    {error, "Ambos os parâmetros devem ser números"}.

subtrair(X, Y) ->
    X - Y.

multiplicar(X, Y) ->
    X * Y.

dividir(X, Y) when Y /= 0 ->
    X / Y;
dividir(_, 0) ->
    {error, "Divisão por zero não permitida"}.
