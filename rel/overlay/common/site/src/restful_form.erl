%% -*- mode: nitrogen -*-
-module (restful_form).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Welcome to Nitrogen".

body() ->
    #container_12 { body=[
        #grid_8 { alpha=true, prefix=2, suffix=2, omega=true, body=inner_body() }
    ]}.

inner_body() -> 
    case wf:q(restful_method) of
        "post"  -> [
            #h1{text="Restful form results"},
	    #table{rows=[
		#tablerow{cells=[
		    #tablecell{text="text_input"},
		    #tablecell{text=wf:q(text_input)}]},
		#tablerow{cells=[
		    #tablecell{text="radio_group"},
		    #tablecell{text=wf:q(radio_group)}]}
	    ]}
	];
        _else -> [
            #h1{text="Restful form"},
	    #restful_form{id=restful_form, method=post, body=[
		#table{rows=[
		    #tablerow{cells=[
			#tablecell{text="text_input"},
			#tablecell{body=[#textbox{id=text_input}]}]},
		    #tablerow{cells=[
			#tablecell{text="radio_group"},
			#tablecell{body=[
			    #radio{html_name=radio_group,
				text=true,
				value=true,
				checked=true},
			    #radio{html_name=radio_group, 
				text=false,
				value=false, 
				checked=false}]}
		    ]}]},
                #restful_submit{}]}
        ]
    end.
