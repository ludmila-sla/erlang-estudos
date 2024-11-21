-module(multiplicar_Test).
-compile([export_all]).


-include_lib("eunit/include/eunit.hrl").


validate_test() ->
    ?assertEqual({"Resultado: 5 Resultado: 10 Resultado: 15 Resultado: 20 Resultado: 25"}, multiplicar:mult(5)).