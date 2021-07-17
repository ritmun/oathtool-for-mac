cd ~/.oathtool
gpg --batch --output tempt --passphrase <some phrase 1> --decrypt token.gpg  
gpg --batch --output tempq  --passphrase <some phrase 2>> --decrypt qrcode.gpg

echo "$(cat tempt)$(oathtool --base32 --totp $(<tempq))"  > tmp                      
rm -f tempq.txt
rm -f tempt.txt
pbcopy < tmp
rm -f tmp
echo "Token pbcopied. Hit enter to clear clipboard when it is pasted."
read ip
pbcopy < /dev/null
