-module(job_worker).
-compile([export_all]).


do_job(Job) ->
    io:format("Job started: ~p~n", [Job]),
    timer:sleep(3000),
    io:format("Job finished: ~p~n", [Job]),
    {done, Job}.

validate_document(Document) ->

    CleanedDocument = string:strip(Document),
    
    case CleanedDocument of
        [] -> 
            io:format("Documento ~p é inválido! Está vazio ou contém apenas espaços.~n", [Document]),
            {invalid, Document};
        _ -> case is_numeric(CleanedDocument) of
                true -> 
                    io:format("Documento ~p é válido!~n", [CleanedDocument]),
                    {valid, CleanedDocument};
                false -> 
                    io:format("Documento ~p é inválido! Contém caracteres não numéricos.~n", [CleanedDocument]),
                    {invalid, CleanedDocument}
            end
    end.

is_numeric(Document) ->
    lists:all(fun(Char) -> is_digit(Char) end, Document).

is_digit(Char) ->
    Char >= $0, Char =< $9.