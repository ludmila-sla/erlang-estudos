-module(cadastro).
-export([criar_conta/4, start_validate/1]).
-compile([validate]).

-record(conta, {nome, email, telefone, endereco}).

criar_conta(Nome, Email, Telefone, Endereco) ->
    #conta{nome = Nome, email = Email, telefone = Telefone, endereco = Endereco},
    start_validate(Email).

start_validate(Email) ->
    Pid = spawn(validate, do_validate, [Email]),
    io:format("Job iniciada PID: ~p~n", [Pid]),
    {ok, Pid}.
