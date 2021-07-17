# Setting up token generation utility on your mac.

_Ensure that your organization allows permits using a legitimate commandline tool for obtaining two-factor auth token. Some may see it as an unnecessary ease in authentication, and hence disallow it._
1. Install `oathtool` using 
```brew install oath-toolkit```


2. Set up your token on your auth provider (e.g. token.redhat.com, or your okta settings page in your org.) Remember to choose `totp` token type, if asked.
- Click on the link to see your qrcode on the confirmation screen. 
- Rename the directory where this README is, to `.oathtool`, place it under your home directory `~/` 
- Save qrcode and token in text files named qrcode and totptoken, temporarily, in it.
3. Create gpg keys for both files using these: \
```gpg --batch --output token.gpg --passphrase <some phrase 1> --symmetric totptoken``` \
```gpg --batch --output qrcode.gpg --passphrase <some phrase 2> --symmetric qrcode```


4. Make sure to permanently delete `qrcode` and `totptoken` files once gpg files are created in step 3. We won't be needing them as we'll only be using rhe encrypted files each time to get token.  
 

5. Open `tokgen.sh` in this folder and replace `<some phrase 1>` and `<some phrase 2>` with the phrases you selected in `step 3`, respectively for `totp` and `qrcode`.


6. Remove all access for any user other than yourself to these files.
```chmod 700 qrcode.gpg token.gpg``` \
```chmod 730 tokgen.sh```


7. Add the following alias to your bashrc or zshrc file
  ```alias tokgen="sh ~/.oathtool/tokgen.sh"```

##All done.
- To use this, run the `tokgen` command. Token will be copied to your clipboard, just paste it in the password field. 
- Remember to hit enter when the token is no longer needed on the clipboard, so the tool can clear the clipboard. 
- Totp tokens expire in certain time intervals. So, you may need to run this again when authenticating next time. 
