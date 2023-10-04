# Todo: Replace <some phrase 1> and <some phrase 2> with your passphrases.

gpg --batch --output ~/.oathtool/tempk --passphrase <some phrase 1> --decrypt ~/.oathtool/key.gpg
gpg --batch --output ~/.oathtool/tempq  --passphrase <some phrase 2> --decrypt ~/.oathtool/qrcode.gpg

# Following should be adjusted for the token format expected in your auth. Here, the format is key+totp.
echo "$(cat ~/.oathtool/tempk)$(oathtool --base32 --totp $(<~/.oathtool/tempq))"  > ~/.oathtool/tmp      

# For mac uncomment this, comment the linux block
pbcopy < ~/.oathtool/tmp
echo "Token pbcopied. Hit enter to clear clipboard when it is pasted."
read ip
pbcopy < /dev/null

# For linux, uncomment this, comment the mac block: pbcopy is a mac utility, other OSs will need to use cat and xclip
# cat ~/.oathtool/tmp | xclip -selection clipboard
# read ip
# xclip -sel clip < /dev/null


# Remove temp files
rm -f ~/.oathtool/tempq
rm -f ~/.oathtool/tempk
rm -f ~/.oathtool/tmp
