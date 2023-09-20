(* Default file location for esm entries is ~/vesm/ but users are allowed
 * to modify the ./entry_dir file to change the location. *)
let get_vesm_base_path () = Helpers.read_file_contents "./.entry_dir"

(* Return string containing path to entry: ~/vesm/year/month/YYYY-MM-DD/ *)
let get_entry_dir_path () =
    let base_path = String.trim (get_vesm_base_path ()) in
    let localtime = Unix.time () |> Unix.localtime in
    let year = string_of_int (localtime.tm_year + 1900) in
    (* FIXME: Figure out how to not have three different versions of month *)
    let month_num = localtime.tm_mon+1 in
    let month_num_str = string_of_int month_num in
    let month_name = Helpers.month_name_from_num month_num in
    let day = string_of_int localtime.tm_mday in
    let formatted_date = year ^ "-" ^ month_num_str ^ "-" ^ day in
    let entry_dir_path = base_path ^ year ^ "/" ^ month_name ^ "/" ^ formatted_date ^ "/" in
    print_endline ("entry_dir_path: " ^ entry_dir_path);
    entry_dir_path

(* Builds entry directory in form ~/vesm/<year>/<month>/<YYYY-MM-DD>/ *)
let build_entry_dir () =
    (* Create the full entry path *)
    let entry_dir_path = get_entry_dir_path () in
    let _ = Sys.command ("mkdir -p " ^ entry_dir_path) in
    (* Add a config file to the directory so that we can keep track of the entry number *)
    let daily_config_file = entry_dir_path ^ ".daily_config" in
    Sys.command ("touch " ^ daily_config_file)
