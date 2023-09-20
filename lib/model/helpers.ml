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

(* TODO: See if Unix provides helper function for this conversion *)
(* Given int representing month, return month name belonging to that num *)
let month_name_from_num num =
    match num with
    | 1 -> "January"
    | 2 -> "February"
    | 3 -> "March"
    | 4 -> "April"
    | 5 -> "May"
    | 6 -> "June"
    | 7 -> "July"
    | 8 -> "August"
    | 9 -> "September"
    | 10 -> "October"
    | 11 -> "November"
    | 12 -> "December"
    | _ -> "Invalid"
