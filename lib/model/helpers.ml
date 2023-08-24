(* Given a string, print the prompt and read in the input *)
let prompt p =
    let prompt_string = p ^ ": " in
    Printf.printf "%s%!" prompt_string;
    read_line ()

let read_file_contents path =
    In_channel.with_open_bin path In_channel.input_all

(* Returns string containing date in "YYYY-MM-DD" form *)
let build_date () =
    let localtime = Unix.time () |> Unix.localtime in
    let year = string_of_int (localtime.tm_year + 1900) in
    let month = string_of_int (localtime.tm_mon+1) in
    let day = string_of_int localtime.tm_mday in
    year ^ "-" ^ month ^ "-" ^ day
