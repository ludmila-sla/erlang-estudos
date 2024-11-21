-module(document_validator).
-compile([export_all]).


start_validation(Document) ->

    Pid = spawn(job_worker, validate_document, [Document]),
    io:format("Validação iniciada com PID ~p~n", [Pid]),
    {ok, Pid}.