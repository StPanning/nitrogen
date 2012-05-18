%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Welcome to Nitrogen".

body() ->
    #container_12 { body=[
        #grid_8 { alpha=true, prefix=2, suffix=2, omega=true, body=inner_body() }
    ]}.

inner_body() -> 
    [
	#h1{text="Overview"},
	#list{body=[
	    #listitem{body=[#link{text="restful_form", url="restful_form"}]}
%	    #listitem{body[]},
%	    #listitem{body[]},
%	    #listitem{body[]},
	]}
	

    ].
	

