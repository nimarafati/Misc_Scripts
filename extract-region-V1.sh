#!/usr/bash
chr=$1
start=$2
end=$3
vcf=$4
echo "echo \"Chr	Start	End
$1	$2	$3\">region.bed"
echo "echo \"vcftools --vcf $4 --bed region.bed --recode --out $4.out\""
