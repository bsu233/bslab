#!/bin/bash
cwd=`pwd`
vhh_folder="$cwd/pdb"
result_folder="$cwd/result"
ag="xx"
ag_aa="xx_number"

#设置最大并行进程数，这里我的cpu是16核
max_jobs=16

#批量处理vhh与msln进行对接
for i in `seq 1 number`; do
	vhh=$vhh_folder/vhh$i.pdb
	# 创建独立的文件夹
	#vhh_name=$(basename "$vhh")
	#folder_name="${vhh_name%.*}"
	for rep in `seq 1 3`; do
		work="$result_folder/vhh$i/${ag}_${rep}"
		mkdir -p "$work"
		cp $vhh "$work/"
		cp "${ag}_${rep}.pdb" "$work/"
		cd $work
		hdock "${ag}_${rep}.pdb" "vhh$i.pdb" -out Hdock.out &
                while [ $(ps -ef | grep hdock | grep -v grep | wc -l) -ge $max_jobs ]; do
                        sleep 60
                done
		cd $cwd
	done
done
#等待后台所有的hdock完成，也是每分钟检测一下
while [ $(ps -ef | grep hdock | grep -v grep | wc -l) -gt 0 ]; do
        sleep 60
done

for i in `seq 1 number`; do
	for rep in `seq 1 3`; do
		ag_folder="$result_folder/vhh$i/${ag}_${rep}"
		cd $ag_folder/
                createpl Hdock.out top10.pdb -nmax 10 -complex -models
                cd $cwd
		awk '$3 ~ /^[0-9]*H/ {next} 1' $ag_folder/vhh$i.pdb > $ag_folder/temp.pdb && mv $ag_folder/temp.pdb $ag_folder/vhh$i.pdb
                awk '$3 ~ /^[0-9]*H/ {next} 1' $ag_folder/${ag}_${rep}.pdb > $ag_folder/temp.pdb && mv $ag_folder/temp.pdb $ag_folder/${ag}_${rep}.pdb
		cat > $ag_folder/leapin << EOD
source leaprc.protein.ff19SB
A = loadpdb $ag_folder/vhh$i.pdb
B = loadpdb $ag_folder/${ag}_${rep}.pdb
saveamberparm A $ag_folder/vhh.prmtop $ag_folder/vhh.inpcrd
saveamberparm B $ag_folder/ag.prmtop $ag_folder/ag.inpcrd
quit
EOD
                tleap -f $ag_folder/leapin
		for count in {1..10} ; do
			work="$ag_folder/$count"
        	        mkdir -p "$work"
			mv "$ag_folder/model_$count.pdb" "$work"
                	awk '$3 ~ /^[0-9]*H/ {next} 1' $work/model_$count.pdb > $work/$count.pdb
                	cat > $work/leapin << EOD
source leaprc.protein.ff19SB
AB = loadpdb $work/$count.pdb
saveamberparm AB $work/complex.prmtop $work/complex.inpcrd
savepdb AB $work/amb.pdb
quit
EOD
			tleap -f $work/leapin
			comaa=$(tail -3 $work/amb.pdb | head -1 | awk '{print $5}')
			cat > $work/min.in <<EOD
&cntrl
  imin=1,
  maxcyc=50000,
  ncyc=200,
  ntpr=100,
  igb=2
  cut=999.0,
  ntr=1,
  restraintmask=":1-$comaa@CA,C,N,O",
  restraint_wt=5,
  /
&wt type='END'
/
EOD
			pmemd.cuda -O -i $work/min.in -c $work/complex.inpcrd -p $work/complex.prmtop -r $work/min.rst -o $work/min.out -ref $work/complex.inpcrd
			cat > $work/mmgbsa.in <<EOD
&general
   startframe=1, endframe=1, interval=1,
   keep_files=0, debug_printlevel=2
/
&gb
   igb=5, saltcon=0.15
/
&decomp
   idecomp=1, print_res='1-$ag_aa,$(($ag_aa + 1))-$comaa', csv_format=0,
/
EOD
done
done
done
for i in `seq 1 number`;do
        for rep in `seq 1 3`; do
                ag_folder="$result_folder/vhh$i/${ag}_${rep}"
		for count in {1..10} ; do
			work="$ag_folder/$count"
			cd $work
			MMPBSA.py -O -i mmgbsa.in -o FINAL_RESULTS_MMPBSA.dat -do FINAL_DECOMP_MMPBSA.dat -cp complex.prmtop -rp ../ag.prmtop -lp ../vhh.prmtop -y min.rst &
			while [ $(ps -ef | grep MMPBSA.py | grep -v grep | wc -l) -ge $max_jobs ]; do
				sleep 1
			done
			cd $cwd
		done
	done
done
while [ $(ps -ef | grep MMPBSA.py | grep -v grep | wc -l) -gt 0 ]; do
        sleep 1
done
error_folder=""
for i in `seq 1 number` ; do
        for rep in `seq 1 3` ;do
                ag_folder="$result_folder/vhh$i/${ag}_${rep}"
                for count in {1..10} ; do
                        work="$ag_folder/$count"
                        if [ -f "$work/FINAL_RESULTS_MMPBSA.dat" ]; then
                                value=$(tail -5 $work/FINAL_RESULTS_MMPBSA.dat | head -1 | awk '{print $3}')
                                if [ -z "$value" ] || (( $(echo "$value > 500" | bc -l) )); then
                                        error_folder="$error_folder $work"
                                fi
                        else
                                error_folder="$error_folder $work"
                        fi
                done
        done
done
echo "$error_folder" >> "error_folder"
for work in $error_folder ; do
	pmemd -O -i $work/min.in -c $work/complex.inpcrd -p $work/complex.prmtop -r $work/min.rst -o $work/min.out -ref $work/complex.inpcrd &
	while [ $(ps -ef | grep pmemd | grep -v grep | wc -l) -ge $max_jobs ]; do
                sleep 5
        done
done
while [ $(ps -ef | grep pmemd | grep -v grep | wc -l) -gt 0 ]; do
        sleep 5
done
for work in $error_folder ; do
        cd $work
        MMPBSA.py -O -i mmgbsa.in -o FINAL_RESULTS_MMPBSA.dat -do FINAL_DECOMP_MMPBSA.dat -cp complex.prmtop -rp ../ag.prmtop -lp ../vhh.prmtop -y min.rst &
        while [ $(ps -ef | grep MMPBSA.py | grep -v grep | wc -l) -ge $max_jobs ]; do
                sleep 1
        done
        cd $cwd
done
while [ $(ps -ef | grep MMPBSA.py | grep -v grep | wc -l) -gt 0 ]; do
        sleep 1
done

