(lang dune 3.10)

(name file_encryption)

(generate_opam_files true)

(source
 (github welldn/encryption))

(authors "Wellington Araujo <wellington.ddev@gmail.com>")

(maintainers "Wellington Araujo <wellington.ddev@gmail.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name file_encryption)
 (synopsis "Encryption for files")
 (description "Make your files more secure by simply encrypting them")
 (depends ocaml dune)
 (tags
  (topics encryption security )))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
