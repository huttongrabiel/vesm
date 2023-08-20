(* Given a string, print the prompt and read in the input *)
let prompt p =
    let prompt_string = p ^ ": " in
    Printf.printf "%s%!" prompt_string;
    read_line ()

let read_file_contents path =
    In_channel.with_open_bin path In_channel.input_all
