-module(job_manager).
-compile([export_all]).

start_job(Job) ->
    Pid = spawn(job_worker, do_job, [Job]),
    io:format("Job started with PID ~p~n", [Pid]),
    {ok, Pid}.
