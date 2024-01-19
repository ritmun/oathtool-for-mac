#!/usr/bin/env bash

set -o errexit
set -o nounset

echo "Enter your passphrase for key.gpg and qrcode.gpg"
read -s PASSPHRASE
echo

KEY=$(gpg --batch --output - --passphrase ${PASSPHRASE} --decrypt ~/.oathtool/key.gpg)
TOTP=$(gpg --batch --output - --passphrase ${PASSPHRASE} --decrypt ~/.oathtool/qrcode.gpg | oathtool --base32 --totp -)

# For mac uncomment this, comment the linux block
echo ${TOTP} | pbcopy
echo "Token pbcopied. Hit enter to clear clipboard when it is pasted."
read ip
pbcopy < /dev/null

# For linux, uncomment this, comment the mac block: pbcopy is a mac utility, other OSs will need to use cat and xclip
#echo ${TOTP} | xclip -sel clipboard
#echo "Token copied to clipboard; press enter to clear"
#read ip
#xclip -sel clip < /dev/null
