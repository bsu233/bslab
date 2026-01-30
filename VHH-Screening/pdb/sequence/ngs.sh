#!/bin/bash
###########################################
gzip -d xxx1.gz xxx2.gz
mkdir qc
fastqc -o qc xxx.fastq xxx.fastq
cutadapt \
    -a AGATCGGAAGAGC \
    -A AGATCGGAAGAGC \
    -O 1\
    -m 1\
    -q 20,20 \
    --max-n 0.1 \
    -e 0.1 \
    -o xx1_trimmed.fastq -p xx2_trimmed.fastq xxx1.fastq xxx2.fastq
pandaseq -o 10 -f xx1_trimmed.fastq -r xx2_trimmed.fastq -w ngs.fasta
###########################################
input_file="ngs.fasta"
temp_file="temp_sequences.txt"
ultimate_file="ngs.txt"
declare -A count
declare -A seq_length
total=0
awk -F"TGGCCCAGGCGGCC|GGCCAGGCCGGCCA" 'BEGIN {OFS="\n"} /!^>/ {print $0} {if (NF==3) print $2}' $input_file > $temp_file
# 合并并统计重复的序列
total=$(wc -l < "$temp_file")
sort "$temp_file" | uniq -c | awk -v total="$total" '{
  count[$2] += $1
  seq_length[$2] = length($2)
  total_count += $1
}
END {
  for (seq in count) {
    freq = count[seq] / total_count
    print seq, count[seq], freq, seq_length[seq]
  }
}' OFS=" " | sort -k2,2nr > $ultimate_file
echo "分析完成，结果已保存到 $ultimate_file"
awk '$1 ~ /AGT$/ { print }' ngs.txt > ngs_vhh.txt
###########################################
declare -A translate_table=(
    [TTT]=F [CTT]=L [ATT]=I [GTT]=V
    [TTC]=F [CTC]=L [ATC]=I [GTC]=V
    [TTA]=L [CTA]=L [ATA]=I [GTA]=V
    [TTG]=L [CTG]=L [ATG]=M [GTG]=V
    [TCT]=S [CCT]=P [ACT]=T [GCT]=A
    [TCC]=S [CCC]=P [ACC]=T [GCC]=A
    [TCA]=S [CCA]=P [ACA]=T [GCA]=A
    [TCG]=S [CCG]=P [ACG]=T [GCG]=A
    [TAT]=Y [CAT]=H [AAT]=N [GAT]=D
    [TAC]=Y [CAC]=H [AAC]=N [GAC]=D
    [TAA]=Stop [CAA]=Q [AAA]=K [GAA]=E
    [TAG]=Stop [CAG]=Q [AAG]=K [GAG]=E
    [TGT]=C [CGT]=R [AGT]=S [GGT]=G
    [TGC]=C [CGC]=R [AGC]=S [GGC]=G
    [TGA]=Stop [CGA]=R [AGA]=R [GGA]=G
    [TGG]=W [CGG]=R [AGG]=R [GGG]=G
)
translate_sequence() {
    local dna=$(echo "$1" | tr 'a-z' 'A-Z' | tr -d '\r\n ')
    local aa=""
    local len=${#dna}
    local codon x

    for ((i=0; i<len; i+=3)); do
        codon=${dna:i:3}

        # 跳过不足 3 个碱基的尾部
        [[ ${#codon} -ne 3 ]] && continue

        # 如果含 N 或 非 ATCG，输出 X
        if [[ ! $codon =~ ^[ATCG]{3}$ ]]; then
            aa+="X"
            continue
        fi

        x=${translate_table[$codon]}

        # 如果不存在匹配的 codon，也输出 X（避免 bad array subscript）
        [[ -z "$x" ]] && x="X"

        aa+="$x"
    done

    echo "$aa"
}
counter=1
while read -r col1 col2 col3 col4; do
    aa=$(translate_sequence "$col1")
    echo -e "${counter}\t$col1\t${aa}\t${col2}\t${col3}\t${col4}" >> translated.txt
    ((counter++))
done < ngs_vhh.txt
#######################################################
awk '{if ($4 >= 100)print}' translated.txt > dna.seq
awk '
$3 !~ /Stop/ {
    seq = $3
    nr  = $1

    # 如果 seq 第一次出现 → 保存
    if (!(seq in best_nr)) {
        best_nr[seq] = nr
        best_line[seq] = $0
    } else if (nr < best_nr[seq]) {
        # 如果出现过，则更新为 NR 更小的那条
        best_nr[seq] = nr
        best_line[seq] = $0
    }
}

END {
    # 按 NR 从小到大排序输出
    n = 0
    for (s in best_nr) {
        n++
        arr_nr[n] = best_nr[s]
        arr_seq[n] = s
    }

    # 排序（冒泡，n 不大完全够用）
    for (i = 1; i <= n; i++) {
        for (j = i+1; j <= n; j++) {
            if (arr_nr[i] > arr_nr[j]) {
                tmp = arr_nr[i]; arr_nr[i] = arr_nr[j]; arr_nr[j] = tmp
                tmp2 = arr_seq[i]; arr_seq[i] = arr_seq[j]; arr_seq[j] = tmp2
            }
        }
    }

    # 按排序结果输出
    for (i = 1; i <= n; i++) {
        seq = arr_seq[i]
        print best_line[seq]
    }
}
' dna.seq > new_dna.seq

