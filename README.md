# Setting up oauth token generation utility for Mac.

_Ensure that your organization permits use of a commandline tool for obtaining two-factor auth token. Some may see it as an unnecessary ease in authentication, and hence disallow it._
1. Install `oathtool` using 
```brew install oath-toolkit```


2. Create a `token` in your auth settings (e.g. _token.redhat.com_, or your _okta_/other sso settings page for your org.) Remember to choose `totp` token type, if asked.
- Find your `QR code` on the confirmation screen. It should be provided as an alternative to the barcode. 
- Clone this repository. Rename the cloned directory to `.oathtool`, and move it under your home directory `~/` 
- Inside this folder, save your `QR code` and `token` in separate files named `qrcode` and `totptoken`, with no extension. You'll delete these later.  
3. Create gpg keys for both files using these: \
```gpg --batch --output token.gpg --passphrase <some phrase 1> --symmetric totptoken``` \
```gpg --batch --output qrcode.gpg --passphrase <some phrase 2> --symmetric qrcode```


4. Note down your `<some phrase 1>` and `<some phrase 2>`. Make sure to permanently delete `qrcode` and `totptoken` files at this point. We won't be needing them as we'll only be using rhe encrypted files to obtain the token.
 

5. Open `tokgen.sh` in this folder and replace `<some phrase 1>` and `<some phrase 2>` with the phrases you used in `step 3`, for `totp` and `qrcode` respectively.


6. Remove access for all other users to these files. \
```chmod 700 qrcode.gpg token.gpg``` \
```chmod 730 tokgen.sh```


7. Add the following alias to the .bashrc or .zshrc file in your home dir. \
  ```alias tokgen="sh ~/.oathtool/tokgen.sh"```

## All done.
- To use this, run the `tokgen` command. Ignore gpg info messages. Token will be copied to your clipboard, just paste it in the password field. 
- Remember to hit enter when the token is no longer needed on the clipboard, so the tool can clear the clipboard. 
- Totp tokens expire in certain time intervals. So, you may need to run this again when authenticating next time. 
