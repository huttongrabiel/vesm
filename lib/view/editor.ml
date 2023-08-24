(*let open_vim =
    let file_name = build_file_name in
    let nvim_command = "nvim" ^ " " ^ file_name in
    match Sys.command nvim_command with
    | 0 -> Printf.printf "nvim opened successfully\n%!"
    | n -> Printf.printf "Error encountered. Exit code: %i\n%!" n *)
