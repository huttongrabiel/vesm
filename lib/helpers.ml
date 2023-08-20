(* Given a string, print the prompt and read in the input *)
let prompt p =
    let prompt_string = p ^ ": " in
    Printf.printf "%s%!" prompt_string;
    read_line ()
