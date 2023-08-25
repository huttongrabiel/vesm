(* Default file location for esm entries is ~/vesm/ but users are allowed
 * to modify the ./entry_dir file to change the location. *)
let get_vesm_base_path () = Helpers.read_file_contents "../.entry_dir"

let get_entry_dir_path () = get_vesm_base_path () ^ Helpers.build_date ()

(* Creates a dir with the path ~/vesm/date/ *)
let build_entry_dir () =
    let entry_dir_path = get_entry_dir_path () in
    let daily_config_file = entry_dir_path ^ ".daily_config" in
    (* Owner: rw- Group: r-- Others: r-- *)
    Sys.mkdir entry_dir_path 644;
    Sys.command ("touch " ^ daily_config_file)
