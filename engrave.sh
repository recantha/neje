echo Set-up serial port
stty 57600 < $1
sleep 1
stty < $1

echo Handshake?
echo -e '\xF6' > $1
sleep 1

echo Reset
echo -e '\xF9' > $1
sleep 1

echo Set burning time?
echo -e '\x20' > $1
sleep 1

echo Sending to top-left corner and waiting for 5 seconds
echo -e '\xF3' > $1
sleep 5

echo Sending to centre and waiting for 5 seconds
echo -e '\xFB' > $1
sleep 5

echo Initiate image transfer
echo -e '\xFE\xFE\xFE\xFE\xFE\xFE\xFE\xFE' > $1
sleep 3

echo Send image
cat $2 > $1
echo Image sent
sleep 1

echo This should start the burning. I think
echo -e '\xF1' > $1

echo All done
