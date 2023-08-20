let read_file_contents path =
    In_channel.with_open_bin path In_channel.input_all

(* Default file location for esm entries is esm_entries *)
let entry_file_path = read_file_contents "../.entry_dir/"

let build_file_name =
    let localtime = Unix.time () |> Unix.localtime in
    let year = string_of_int (localtime.tm_year + 1900) in
    let month = string_of_int (localtime.tm_mon+1) in
    let day = string_of_int localtime.tm_mday in
    let file_name = year ^ "-" ^ month ^ "-" ^ day ^ ".txt" in
    file_name

let create_esm_entry =
    Sys.mkdir entry_file_path

let () =
    let file_name = build_file_name in
    let nvim_command = "nvim" ^ " " ^ file_name in
    match Sys.command nvim_command with
    | 0 -> Printf.printf "nvim opened successfully\n%!"
    | n -> Printf.printf "Error encountered. Exit code: %i\n%!" n
