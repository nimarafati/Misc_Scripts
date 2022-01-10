# vcftools
This repository consists of different scripts to modify vcftools output. You can find the list of scripts and their application below:


## extract-region-V1.sh
This is a very simple example on using vcftools to extract regions of interest.  
```
extract-region-V1.sh $chr $start $end $vcf_file
```

## transpose-matrix.sh
Transposing vcftools --012 output. By default vcftools --012 reports a matrix where variants are presented in columns unlike vcf format. By this script you can transpose it and convert it to **bed** format which makes it easier to upload and use the output. Please note that you just need to use the file base name:  
```
vcftools --vcf Final_Call-PASS_snpEff.vcf --012 --out Final_Call-PASS_snpEff
transpose-matrix.sh Final_Call-PASS_snpEff.012
``` 

