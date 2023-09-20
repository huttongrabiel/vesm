let () =
    let _ = Model.Entries.get_entry_dir_path () in
    ()
    (*let responses = Model.User_input.get_user_input in
    match responses with
    | [] -> print_endline "Responses is empty!"
    | _ :: _ -> List.iter Model.Data.print_response responses*)
