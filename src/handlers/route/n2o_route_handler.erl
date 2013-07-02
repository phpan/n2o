-module (n2o_route_handler).
-author('Maxim Sokhatsky').
-behaviour (route_handler).
-include_lib("n2o/include/wf.hrl").
-export([init/2, finish/2]).

finish(State, Ctx) -> {ok, State, Ctx}.
init(State, Ctx) -> 
    Path = wf:path(Ctx#context.req),
    {Module, PathInfo} = route(Path),
%    error_logger:info_msg("Route Ctx: ~p",[Ctx]),
    {ok, State, Ctx#context{path=PathInfo,module=Module}}.

route(<<"/">>) -> {index, []};
route(<<"/index">>) -> {index, []};
route(<<"/login">>) -> {login, []};
route(<<"/ws/">>) -> {index, []};
route(<<"/ws/index">>) -> {index, []};
route(<<"/ws/login">>) -> {login, []};
route(<<"/favicon.ico">>) -> {static_file, []};
route(_) -> {index, []}.
