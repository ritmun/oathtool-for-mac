# A Simple OAuth Token Generation Utility for Mac

_Ensure that your organization permits use of a commandline tool for obtaining two-factor auth token. Some may see it as an unnecessary ease in authentication, and hence disallow it._
1. Install `oathtool` using your OS's package manager. For mac, use :
```brew install oath-toolkit```


2. Create the encrypted files you'll need to create the token.
    - In your auth settings (i.e. in your okta account, or your sso credentials settings page for your org)
      - Create a `key`. This is the `key` used to create the token. Save it. Choose `totp` type, if asked.
      - Find your `QR code` on the confirmation screen when the `key` is generated. Save it.
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

## All done.
- To use this, run the `tokgen` command. Ignore gpg info messages. 
- On a mac, token will be copied to your clipboard, just paste it in the password field. Remember to hit enter when the token is no longer needed on the clipboard, so the tool can clear the clipboard. 
- Totp tokens expire in certain time intervals. So, you may need to run this again when authenticating next time. 
