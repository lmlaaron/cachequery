# remember to use 
# modprobe msr
# wrmsr -a 0xc90 0x0001
# use Intel CAT to set L3 one way

# v 9 8 v 8 9  r r r 10 11 13 15 v 10 11 13 15 r 14 v 14

# 

total_number=0
correct_numer=0
for i in `seq 0 10`; do
	for v in `seq 0 7`; do
		total_number=$((${total_number} + 1))
		r1=$(($RANDOM%8)) 
		r2=$(($RANDOM%8)) 
		r3=$(($RANDOM%8)) 
		r4=$(($RANDOM%8)) 
		./cachequery.py -l l3 -r 0_${v} 1_1 1_0 0_${v} 1_0? 1_1? 0_${r1} 0_${r2} 0_${r3} 1_2 1_3 1_5 1_7 0_${v} 1_2? 1_3? 1_5? 1_7? 0_${r4} 1_6 0_${v} 1_6? | tail -1
	done
done
