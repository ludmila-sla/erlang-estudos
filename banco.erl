-module(banco).
-export([criar_conta/2, consultar_saldo/1, depositar/2, retirar/2, fechar_conta/1]).


-record(conta, {id, saldo = 0}).


criar_conta(Id, SaldoInicial) ->
    #conta{id = Id, saldo = SaldoInicial}.

consultar_saldo(#conta{saldo = Saldo}) ->
    Saldo.


depositar(#conta{id = Id, saldo = Saldo} = Conta, Valor) ->

    case validacao:valor_valido(Valor) of
        true ->
            Conta#conta{saldo = Saldo + Valor};
        false ->
            {error, "Valor inválido para depósito"}
    end.


retirar(#conta{id = Id, saldo = Saldo} = Conta, Valor) ->

    case validacao:valor_valido(Valor) of
        true when Valor =< Saldo ->
            Conta#conta{saldo = Saldo - Valor};
        true ->
            {error, "Saldo insuficiente"};
        false ->
            {error, "Valor inválido para retirada"}
    end.

fechar_conta(#conta{id = Id, saldo = 0}) ->
    {ok, "Conta fechada com sucesso"};
fechar_conta(_) ->
    {error, "A conta deve ter saldo zero para ser fechada"}.
