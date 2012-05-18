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
        "post"  ->
            Req = wf_context:request_bridge(),
            [
            #h1{text="Restful form results"},
            #table{rows=[
                #tablerow{cells=[
                    #tablecell{text="text_input"},
                    #tablecell{text=wf:q(text_input)}]},
                #tablerow{cells=[
                    #tablecell{text="password_input"},
                    #tablecell{text=wf:q(password_input)}]},
                #tablerow{cells=[
                    #tablecell{text="radio_group"},
                    #tablecell{text=wf:q(radio_group)}]},
                #tablerow{cells=[
                    #tablecell{text="check_box"},
                    #tablecell{text=wf:q(check_box)}]},
                #tablerow{cells=[
                    #tablecell{text="option_box"},
                    #tablecell{text=wf:q(option_box)}]},
                #tablerow{cells=[
                    #tablecell{text="text_area"},
                    #tablecell{text=wf:q(text_area)}]},
                #tablerow{cells=[
                    #tablecell{text="file_upload"},
                    #tablecell{text=wf:f("~p", [Req:post_files()])}]}
            ]}
        ];
        _else -> [
            #h1{text="Restful form"},
            #restful_form{id=restful_form, method=post,
                enctype="multipart/form-data", body=[
                    #table{rows=[
                    #tablerow{cells=[
                        #tablecell{text="text_input"},
                        #tablecell{body=[#textbox{id=text_input}]}]},
                    #tablerow{cells=[
                        #tablecell{text="password_input"},
                        #tablecell{body=[#password{id=password_input}]}]},
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
                                checked=false}]},
                        #tablerow{cells=[
                            #tablecell{text="check_box"},
                            #tablecell{body=[
                                #checkbox{id=check_box, text="state"}
                            ]}]},
                        #tablerow{cells=[
                            #tablecell{text="drop_down"},
                            #tablecell{body=[
                                #dropdown{html_name=option_box,
                                    options=[
                                        #option{text="Dropdown"},
                                        #option{text="Option 1"},
                                        #option{text="Option 2"},
                                        #option{text="Option 3"}]}]}]},
                        #tablerow{cells=[
                            #tablecell{text="text_area"},
                            #tablecell{body=[
                                #textarea{id=text_area}]}]},
                        #tablerow{cells=[
                            #tablecell{text="file_upload"},
                            #tablecell{body=[
                                #restful_upload{id=file_upload}]}]}
                            ]}]},
                #restful_reset{},
                #restful_submit{}]}
        ]
    end.
