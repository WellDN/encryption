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

let rnd_key() =
    Random.self_init ();
    let key_length = 32 in
    let key = Bytes.create key_length in
    for i = 0 to key_length - 1 do
        (* generates random integer of 256 bits in a length of 32 (returns ascii as string) *)
        Bytes.set key i (char_of_int (Random.int 256))
    done;
    Bytes.to_string key

module Encrypt = struct
   let encrypt input_file =
       let plaintext = read_file input_file in
       let key = rnd_key() in
       let encrypted_text = xor_cipher key plaintext in
       write_file input_file encrypted_text;
       key
end

module Decrypt = struct
   let decrypt input_file key =
       let plaintext = read_file input_file in
       let decrypted_text = xor_cipher key plaintext in
       write_file input_file decrypted_text
end

   let () =
       if Array.length Sys.argv <> 4 then (
           Printf.eprintf "Usage: %s <encrypt/decrypt> <inputfile> <key>\n" Sys.argv.(0);
    exit 1
           );

let command = Sys.argv.(1) in
let input_file = Sys.argv.(2) in
let key = Sys.argv.(3) in

match command with
| "encrypt" ->
        let encryption_key = Encrypt.encrypt input_file in
        Printf.printf "File %s was encrypted successfully.\n" input_file;
    Printf.printf "Secret key: %s\n" encryption_key
| "decrypt" ->
        Decrypt.decrypt input_file key;
    Printf.printf "File %s was decrypted successfully.\n" input_file
| _ ->
        Printf.eprintf "Unknown command: %s\n" command;
    exit 1

