#!/bash/bin

read options

if [ "$options" = "-d" ]
then
	echo "directories"
elif [ "$options" = "-f" ]
then
	echo "files"
elif [ "$options" = "-b" ]
then
	echo "bytes"
else
	echo "Invalid input"
fi
