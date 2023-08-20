type prompt =
    | LongResponse of string
    | ScaleResponse of string

type response = { prompt: string; answer: string}

let prompts = [
    LongResponse "What are you currently doing?";
    LongResponse "Are you currently working or relaxing?";
    LongResponse "Is it focused work?";
    LongResponse "Are there any distractions? If so, what?";
    LongResponse "Do you wish you were working on something else? If so, what?";
    ScaleResponse "How stressed are you (0-10)?";
    ScaleResponse "How comfortable are you (0-10)?";
    ScaleResponse "How focused are you (0-10)?";
]

let print_response response =
    Printf.printf "Q: %s\nA: %s\n%!" response.prompt response.answer

let get_contents_from_prompt p =
    match p with
    | LongResponse n -> n
    | ScaleResponse n -> n

(* user_response is just a list where can dump the prompt and answer which
   will eventually be formatted and placed in the output file *)
let get_user_input =
    let rec aux prompt_list user_response =
        (match prompt_list with
        | [] -> user_response
        | h :: t ->
                let prompt_contents = get_contents_from_prompt h in
                let user_input = prompt_contents |> Helpers.prompt in
                let cur_response = { prompt = prompt_contents; answer = user_input} in
                aux t (cur_response :: user_response)) in
    List.rev (aux prompts [])
