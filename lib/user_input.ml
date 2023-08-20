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
    ScaleResponse "How stressed are you (1-10)?";
    ScaleResponse "How comfortable are you (1-10)?";
    ScaleResponse "How focused are you (1-10)?";
]

let get_contents_from_prompt p =
    match p with
    | LongResponse n -> n
    | ScaleResponse n -> n

(* user_response should be a t to store data regarding this entry *)
let rec get_user_input prompt_list user_response =
    match prompt_list with
    | [] -> "Good job completing this momentary assessment!\n"
    | h :: t ->
            let prompt_contents = get_contents_from_prompt h in
            let user_input = prompt_contents |> Helpers.prompt in
            let cur_response = { prompt = prompt_contents; answer = user_input} in
            get_user_input t (cur_response :: user_response)
