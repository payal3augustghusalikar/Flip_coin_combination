#! /bin/bash -x
echo "*********** Welcome to Flip Coin Combination ************"
echo ""
r1=$(expr $RANDOM % 10)
r2=$(expr $r1 % 2)

if [ $r2 -eq 0 ]
then
	echo -ne "Head \n"
else
	echo -ne "Tail \n"
fi
