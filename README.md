# Encryption
------------

File encryption transforms data into code that only intended recipients can decipher, preventing unauthorized users from being able to access, view, and understand sensitive information.

It offers a higher security as each file has its on own encryption key, protecting confidential information and ensure that your files remain safe.

The algorithm used in this encryption is XOR cipher for now, key is 32 length long (256 bits) which theoretically makes the key OTP.


# Testing
---------
> **Warning**
> (you shouldn't actually use it for now. but if you want to test:)


Encryption: 

```
dune exec ./encryption/src/encryption.exe encrypt filename
```

Decryption:

```
dune exec ./encryption/src/encryption.exe decrypt filename filename.key.txt
```
