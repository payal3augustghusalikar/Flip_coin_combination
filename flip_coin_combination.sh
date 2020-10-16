#! /bin/bash -x
echo "*********** Welcome to Flip Coin Combination ************"
echo ""

function singlet()
{
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

	echo "singletHeadPercentage = $singletHeadPercentage %  &  singletTailPercentage = $singletTailPercentage %"
}


#to find doublet combination

function doublet()
{
	read -p "Enter number for doublet flip : " n

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
	for (( i=0; i<$n; i++ ))
	do
		count=$(($count+1))
		r2=$(( $RANDOM % 4 ))

		if [ $r2 -eq 0 ]
		then
			count1=$(( $count1 + 1 ))
			percent1="$(( $count1 * 100 / $n  ))"

		elif [ $r2 -eq 1 ]
		then
			count2=$(( $count2 + 1 ))
			percent2="$(( $count2 * 100 / $n ))"

		elif [ $r2 -eq 2 ]
		then
			count3=$(( $count3 + 1 ))
			percent3="$(( $count3 * 100 / $n ))"

		elif [ $r2 -eq 3 ]
		then
			count4=$(( $count4 + 1 ))
			percent4="$(( $count4 * 100 / $n ))"
		fi
		Doublet[0]="HH:$percent1"
		Doublet[1]="HH:$percent2"
		Doublet[2]="HH:$percent3"
		Doublet[3]="HH:$percent4"
	done
	echo "Outcomes with doublet percentage is :"
	echo ${Doublet[@]}
}


#to get triplet combination
function triplet()
{
	read -p "Enter number to flip : " n2
	declare -A tripletflip
	num_of_coin=3
	tripletflip=0
	for (( count=0; count<$n2; count++ ))
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
		echo tripletflip[$index]="$(( ${tripletflip[$index]} * 100 / $n2 ))"
	done
	echo "triplet percentage is :"
	echo ${tripletflip[@]}
}

#to sort singlet,doblet,triplet combination
function winner()
{
	declare -A sort_combination
	maximum=0
	temp=0
	echo "enter a number to flip coins"
	read n3
	for((index=0; index<$n3; index++))
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
	echo "${sort_combination[@]}"

	for j in ${!sort_combination[@]}
	do
		sort_combination[$j]="$(( ${sort_combination[$j]} * 100 / $n3 ))"
		temp=${sort_combination[$j]}
		if [ $temp -ge $maximum ]
		then
			maximum=$temp
			new=$J
		fi
	done
	echo "maximum is $maximum=$i"
}


echo "enter the flipping combination from below option : "
echo -ne " 1.singlet \n 2.doublet \n 3.triplet \n 4.winning combination \n enter your choice "
read choice
case $choice in

   1) singlet
      ;;
   2) doublet
      ;;
   3) triplet
      ;;
	4) winner
esac
