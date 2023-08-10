(* TODO:  make a key generator with 32 length long *)
(* TODO:  password generator *)
(* TODO: AES *)
let xor_cipher key text =
    let key_length = String.length key in
    let text_length = String.length text in
    let encrypted = Bytes.create text_length in
    for i = 0 to text_length - 1 do
        (* read each char and return the ascii in text_length, generate a key and keep cycling when key_length hits 0 *)
        let key_ascii = Char.code (String.get key (i mod key_length)) in
        let text_ascii = Char.code (String.get text i) in
        (* Key and text being compared (lxor) to generate the xor_cipher (!= = 1) (== = 0) *)
        let encrypted_char = Char.chr (key_ascii lxor text_ascii) in
        Bytes.set encrypted i encrypted_char
    done;
    Bytes.to_string encrypted
