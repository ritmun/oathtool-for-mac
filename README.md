#### 1. Install oathtool using 
```brew install oath-toolkit```
#### 2. Set up your token on token.redhat.com. (Remember to choose type totp.)
- Click on the link to see your qrcode on the confirmation screen. 
- Rename the directory where this README is, to `.oathtool`, place it under your home directory `~/` 
- Save qrcode and token in text files named qrcode and totptoken, temporarily, in it.
#### 3. Create gpg keys for both files with this: 
```gpg --batch --output token.gpg --passphrase <some phrase 1> --symmetric totptoken```
 ```gpg --batch --output qrcode.gpg --passphrase <some phrase 2> --symmetric qrcode```
#### 4. Delete `qrcode` and `totptoken` files once gpg files are created in step 3.
#### 5. Open `tokgen.sh` in this folder and replace `<some phrase 1>` and `<some phrase 2>` with the phrases you selected in `step 3`, respectively for `totp` and `qrcode`.
#### 6. Remove all access for any user other than yourself to these files.
#### 7. Add the following alias to your bashrc or zshrc file
####  ```alias tokgen="sh ~/.oathtool/tokgen.sh"```
