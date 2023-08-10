open Xor_cipher

let read_file filename = 
    let ic = open_in_bin filename in
    let len = in_channel_length ic in
    (* reads len characters from channel ic and return a new string *) 
    let content = really_input_string ic len in
    close_in ic;
    content

let write_file filename content =
    let oc = open_out_bin filename in
    output_string oc content;
    close_out oc

let encrypt inputf outputf key = 
    let plaintext = read_file inputf in
    let encrypted_text = xor_cipher key plaintext in
    write_file outputf encrypted_text 

let decrypt inputf outputf key =
    let encrypted_text = read_file inputf in 
    let decrypted_text = xor_cipher key encrypted_text in
    write_file outputf decrypted_text
(* actual pp later *)
let _ =
    let input_filename = "plaintext.txt" in
    let encrypted_filename = "encrypted.txt" in
    let decrypted_filename = "decrypted.txt" in
    let encryption_key = "mysecretkey" in

    encrypt input_filename encrypted_filename encryption_key;
    decrypt encrypted_filename decrypted_filename encryption_key; 

    print_endline "Encryption and decryption completed."
