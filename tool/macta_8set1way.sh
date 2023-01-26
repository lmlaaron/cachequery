# remember to use 
# modprobe msr
# wrmsr -a 0xc90 0x0001
# use Intel CAT to set L3 one way

# v 9 8 v 8 9  r r r 10 11 13 15 v 10 11 13 15 r 14 v 14

# 

total_number=0
correct_numer=0
for i in `seq 0 1249`; do
	for v in `seq 0 7`; do
		total_number=$((${total_number} + 1))
		r1=$(($RANDOM%8)) 
		r2=$(($RANDOM%8)) 
		r3=$(($RANDOM%8)) 
		r4=$(($RANDOM%8)) 
		z=$(./cachequery.py -l l3 -r 0_${v} 1_1 1_0 0_${v} 1_0? 1_1? 0_${r1} 0_${r2} 0_${r3} 1_2 1_3 1_5 1_7 0_${v} 1_2? 1_3? 1_5? 1_7? 0_${r4} 1_6 0_${v} 1_6? | tail -1 | awk '{print  $24 "\t" $25  "\t"  $26 "\t" $27 "\t" $28 "\t" $29 "\t" $30 }')
		#echo $z	

		l1=$(echo $z | awk '{print $1}')
		l2=$(echo $z | awk '{print $2}')
		l3=$(echo $z | awk '{print $3}')
		l4=$(echo $z | awk '{print $4}')
		l5=$(echo $z | awk '{print $5}')
		l6=$(echo $z | awk '{print $6}')
		l7=$(echo $z | awk '{print $7}')
	
		#echo $l1
		#echo $l2
		#echo $l3
		#echo $l4
		#echo $l5
		#echo $l6
		#echo $l7
		
		
		if [ $v -eq 0 ] && [ $l1 -eq 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi
		if [ $v -eq 1 ] && [ $l2 -eq 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi
		if [ $v -eq 2 ] && [ $l3 -eq 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi
		if [ $v -eq 3 ] && [ $l4 -eq 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi
		if [ $v -eq 4 ]  && [ $l1 -ne 0 ]  && [ $l2 -ne 0 ]   && [ $l3 -ne 0 ] && [ $l4 -ne 0 ]&& [ $l5 -ne 0 ] && [ $l6 -ne 0 ]&& [ $l7 -ne 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi
		if [ $v -eq 5 ] && [ $l5 -eq 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi
		if [ $v -eq 6 ] && [ $l7 -eq 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi
		if [ $v -eq 7 ] && [ $l6 -eq 0 ]
		then
			correct_number=$((${correct_number} + 1))
		fi


	done
done

echo ${correct_number}
echo ${total_number}
