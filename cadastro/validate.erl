-module(validate).
-export([do_validate/1]).

do_validate(Email) ->
    case string:contains(Email, "@") andalso string:endswith(Email, ".com") of
        true -> 
            io:format("Email ~p é válido!~n", [Email]),
            {valid, Email};
        false -> 
            io:format("Email ~p é inválido!~n", [Email]),
            {invalid, Email}
    end.