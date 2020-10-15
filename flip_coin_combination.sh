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

#to find doublet combination
count=0
count1=0
count2=0
count3=0
count4=0
percent1=0
percent2=0
percent3=0
percent4=0
declare -A Doublet
for (( i=1; i<$n; i++ ))
do

	r2=$(( $RANDOM % 4 ))

if [ $r2 -eq 0 ]
then
	count1=$(( $count1 + 1 ))
	percent1="$(( $count * 100 / $count ))"

elif [ $r2 -eq 1 ]
then
	count1=$(( $count2 + 1 ))
	percent1="$(( $count2 * 100 / $count ))"

elif [ $r2 -eq 2 ]
then
	count2=$(( $count2 + 1 ))
	percent2="$(( $count2 * 100 / $count ))"

elif [ $r2 -eq 3 ]
then
	count3=$(( $count3 + 1 ))
	percent3="$(( $count3 * 100 / $count ))"
fi
Doublet[0]="HH:$percent1"
Doublet[1]="HH:$percent2"
Doublet[2]="HH:$percent3"
Doublet[3]="HH:$percent4"
done
echo "Outcomes with doublet percentage is :"
echo ${doublet[@]}

#to get triplet combination
declare -A tripletflip
num_of_coin=3
tripletflip=0
for(( count=0; count<$num_of_coin; count++ ))
do
	for(( countcoin=0; countcoin<$num_of_coin; countcoin++ ))
		do
			r3=$(( $RANDOM % 2 ))
				if [ $r3 -eq 0 ]
				then
					coin+=H
				else
					coin+=T
				fi
		done
		((tripletflip[$coin]++))
	coin=""
done

#to find total percentage of triplet combination
	for index in ${!tripletflip[@]}
	do
tripletflip[$index]="$(( ${tripletflip[$index]} * 100 / $num_of_coin ))"
	done
echo "triplet percentage is :"
echo ${tripletflip[@]}

#to sort singlet,doblet,triplet combination
declare -A sort_combination
maximum=0
temp=0
echo "enter a number to flip coins"
read number3
for((index=0; index<$number3; index++))
do
        for((coinindex=0; coinindex<2; coinindex++))
        do
                r4=$(($RANDOM%2))
                        if [ $r4 -eq 0 ]
                        then
                                coinside+=H
                        else
                                coinside+=T
                        fi
        done
sort_combination[$coinside]=$((${sort_combination[$coinside]}+1))
done
echo "${sort_combonation[@]}"
