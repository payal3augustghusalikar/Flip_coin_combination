#! /bin/bash -x
echo "*********** Welcome to Flip Coin Combination ************"
echo ""

i=1
Hcount=0
Tcount=0
singletHeadPercentage=0
singletTailPercentage=0


declare -A singletflip
read -p "enter number to flip coin ==> " n
echo " "

while [ $i -le $n ]
do
	echo "coin tossed $i times"

# To generate random number

	r1=$(expr $RANDOM % 2)

	if [ $r1 -eq 0 ]
	then
		singletflip[Head]=$((++Hcount))
		echo -ne "Heads \n"
	else
		echo -ne "Tails \n"
		singletflip[Tail]=$((++Tcount))
	fi

		((i++))
done

# to print result into dictionary
echo -ne "\n The result of singlet into dictionary is :   ${singletflip[@]} \n"


#to print percentage og singlet
echo -ne " winning % of singlet Heads and Tails is : \n "

singletHeadPercentage="$(( $Hcount * 100 / $n ))"

singletTailPercentage="$(( $Tcount * 100 / $n ))"

echo "singletHeadPercentage  = $singletHeadPercentage %  &  singletTailPercentage = $singletTailPercentage %"
