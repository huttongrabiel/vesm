type prompt =
    | LongResponse of string
    | ScaleResponse of string

let get_contents_from_prompt p =
    match p with
    | LongResponse n -> n
    | ScaleResponse n -> n

type response = { prompt: string; answer: string}

let print_response response =
    Printf.printf "Q: %s\nA: %s\n%!" response.prompt response.answer

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

