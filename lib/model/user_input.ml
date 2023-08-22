(* user_response is just a list where can dump the prompt and answer which
   will eventually be formatted and placed in the output file *)
let get_user_input =
    let rec aux prompt_list user_response =
        (match prompt_list with
        | [] -> user_response
        | h :: t ->
                let prompt_contents = Data.get_contents_from_prompt h in
                let user_input = prompt_contents |> Helpers.prompt in
                let cur_response = { Data.prompt = prompt_contents; answer = user_input} in
                aux t (cur_response :: user_response)) in
    List.rev (aux Data.prompts [])
