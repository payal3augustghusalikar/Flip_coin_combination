#! /bin/bash -x
echo "*********** Welcome to Flip Coin Combination ************"
echo ""

i=1
Hcount=0
Tcount=0
singletHeadPercentage=0
singletTailPercentage=0


declare -A singletflip
read -p "enter number to flip coin for singlet ==> " n
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
echo "Enter flip times for doublet"
read n1

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
for (( i=1; i<$n1; i++ ))
do
	count=$(($count+1))

   r2=$(( $RANDOM % 4 ))

		if [ $r2 -eq 0 ]
		then
        count1=$(($count1+1))
        percent1="$(( $count1 * 100 / $n1 ))"

		elif [ $r2 -eq 1 ]
		then
        count2=$(($count2+1))
        percent2="$(( $count2 * 100 / $n1 ))"

		elif [ $r2 -eq 2 ]
		then
        count3=$(($count3+1))
        percent3="$(( $count3 * 100 / $n1 ))"

		elif [ $r2 -eq 3 ]
		then
        count4=$(($count4+1))
        percent4="$(( $count4 * 100 / $n1 ))"
		fi
Doublet[0]="HH:$percent1"
Doublet[1]="HT:$percent2"
Doublet[2]="TH:$percent3"
Doublet[3]="TT:$percent4"
done
echo "Outcomes with doublet percentage is :"

echo ${Doublet[@]}
echo ""


#to get triplet combination

read -p "Enter flip times for Triplet => " n2

count=0
count1=0
count2=0
count3=0
count4=0
count5=0
count6=0
count7=0
count8=0
percent1=0
percent2=0
percent3=0
percent4=0
percent5=0
percent6=0
percent7=0
percent8=0

declare -A triplet

for (( i=0; i<$n2; i++ ))
do
   count=$(($count+1))

   r2=$(( $RANDOM % 8 ))

      if [ $r2 -eq 0 ]
      then
        count1=$(($count1+1))
        percent1="$(( $count1 * 100 / $n2 ))"

      elif [ $r2 -eq 1 ]
      then
        count2=$(($count2+1))
        percent2="$(( $count2 * 100 / $n2 ))"

      elif [ $r2 -eq 2 ]
      then
        count3=$(($count3+1))
        percent3="$(( $count3 * 100 / $n2 ))"

      elif [ $r2 -eq 3 ]
      then
        count4=$(($count4+1))
        percent4="$(( $count4 * 100 / $n2 ))"

      elif [ $r2 -eq 4 ]
      then
        count5=$(($count5+1))
        percent5="$(( $count5 * 100 / $n2 ))"

      elif [ $r2 -eq 5 ]
      then
        count6=$(($count6+1))
        percent6="$(( $count6 * 100 / $n2 ))"

      elif [ $r2 -eq 6 ]
      then
        count7=$(($count7+1))
        percent7="$(( $count7 * 100 / $n2 ))"

      elif [ $r2 -eq 7 ]
      then
        count8=$(($count8+1))
        percent8="$(( $count8 * 100 / $n2 ))"

      fi
   triplet[0]="HHH:$percent1"
   triplet[1]="HHT:$percent2"
   triplet[2]="HTH:$percent3"
   triplet[3]="HTT:$percent4"
   triplet[4]="THH:$percent5"
   triplet[5]="THT:$percent6"
   triplet[6]="TTH:$percent7"
   triplet[7]="TTT:$percent8"

done

echo "triplets outcomes in percentages are ==> : "
echo ${triplet[@]}




#to sort singlet,doblet,triplet combination
declare -A sort_combination
maximum=0
temp=0

echo "enter a number to flip coins"
read n3
for((index=0; index<$n3; index++))
do
   for((coinindex=0; coinindex<4; coinindex++))
   do
      r4=$(($RANDOM%2))
      	if [ $r4 -eq 0 ]
      	then
         	coinside+=H
         else
         	coinside+=T
         fi
    done
sort_combination[$coinside]="$((${sort_combination[$coinside]}+1))"
done
echo "${sort_combination[@]}"

for j in ${!sort_combination[@]}
do
	sort_combination[$j]="$(( ${sort_combination[$j]} * 100 / $n2 ))"
	temp="${sort_combination[$j]}"
		if (( $temp -ge $maximum ))
		then
			maximum=$temp
			new=$j
		fi
done
echo "maximum winning combination is $maximum"




