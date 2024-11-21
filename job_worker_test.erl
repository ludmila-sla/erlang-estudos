-module(job_worker_test).
-compile([export_all]).


-include_lib("eunit/include/eunit.hrl").


validate_document_test() ->

    ?assertEqual({valid, "12345678901"}, job_worker:validate_document("12345678901")),

    ?assertEqual({invalid, "1234AB567"}, job_worker:validate_document("1234AB567")),

    ?assertEqual({invalid, "     "}, job_worker:validate_document("     ")),

    ?assertEqual({invalid, ""}, job_worker:validate_document("")),
   
    ?assertEqual({invalid, "1234@567"}, job_worker:validate_document("1234@567")).
