#Todo: Replace <some phrase 1> and <some phrase 2> with your passphrases.

gpg --batch --output ~/.oathtool/tempt --passphrase <some phrase 1> --decrypt ~/.oathtool/token.gpg
gpg --batch --output ~/.oathtool/tempq  --passphrase <some phrase 2>> --decrypt ~/.oathtool/qrcode.gpg

echo "$(cat ~/.oathtool/tempt)$(oathtool --base32 --totp $(<~/.oathtool/tempq))"  > ~/.oathtool/tmp                      
rm -f ~/.oathtool/tempq.txt
rm -f ~/.oathtool/tempt.txt
pbcopy < ~/.oathtool/tmp
rm -f ~/.oathtool/tmp
echo "Token pbcopied. Hit enter to clear clipboard when it is pasted."
read ip
pbcopy < /dev/null
