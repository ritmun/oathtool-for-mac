# Ctrl + V Token Utility

Purpose: Replace the process of token generation using a mobile app then concatenating it with keyphrase typing it out...

.. by following two steps: 

## Usage
- Run `tokgen` command 
- Paste password

## Installation: 

_Ensure that your organization permits use of a commandline tool for obtaining two-factor auth token. Some may see it as an unnecessary ease in authentication, and hence disallow it._
1. Install `oathtool` using your OS's package manager. For mac, use :
```brew install oath-toolkit```


2. Create the encrypted files you'll need to create the token.
    - In your organization's SSO two-factor auth settings 
      - Create a `key` (aka _token_). This is the `key` used to create the auth token. Save it. Choose `totp` type, if asked.
      - Find your `QR code` (aka _Secret Key_) on the confirmation screen when the barcode is generated. Save it, removing spaces between 4 char blocks.
    - On your localhost
        - Clone this repository. Rename the cloned directory to `.oathtool`, and move it under your home directory `~/` 
        - Inside this folder, save your `QR code` and `key` in separate files named `qrcode` and `key`, with no extension. You'll delete these later.  
4. Create gpg keys for both files using these: \
```gpg --batch --output key.gpg --passphrase <some phrase 1> --symmetric key``` \
```gpg --batch --output qrcode.gpg --passphrase <some phrase 2> --symmetric qrcode```


4. Note down your `<some phrase 1>` and `<some phrase 2>`. Make sure to permanently delete `qrcode` and `key` files at this point. We won't be needing them as we'll only be using the encrypted files to obtain the token.
 

5. Open `tokgen.sh` in `~/.oathtool` directory and replace `<some phrase 1>` and `<some phrase 2>` with the phrases you used in `step 3`, for `key` and `qrcode` respectively.


6. Remove access for all other users to these files. \
```chmod 700 qrcode.gpg key.gpg``` \
```chmod 730 tokgen.sh```


7. Add the following alias to the .bashrc or .zshrc file in your home dir. \
  ```alias tokgen="sh ~/.oathtool/tokgen.sh"```  \
  For OSs other than mac, uncomment lines indicated in `tokgen.sh`. 




Note: 
- Totp tokens expire in certain time intervals. So, you may need to run `tokgen` again when authenticating next time. 
