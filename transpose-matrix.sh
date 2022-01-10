#!/usr/bash
if [ ! -f $1 ]; then
	echo "Check input file."
	exit 0	
fi
if [ $1 == ""];then
	echo "Check input file."
        exit 0
fi

file="$1"
awk '
{ 
    for (i=1; i<=NF; i++)  {
        a[NR,i] = $i
    }
}
NF>p { p = NF }
END {    
    for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++){
            str=str" "a[i,j];
        }
       print str
    }
}' $file | sed '1,1d' > ${file}.t
ind=`wc -l ${file}.indv | awk '{print $1}' `
echo -e "#Chr	Start	End	" >${file}.t.bed
cat ${file}.indv | tr '\n' '\t' >>${file}.t.bed
echo "$ind individuals"
command="paste ${file}.pos ${file}.t | awk '{OFS=\"\t\";print \$1,\$2-1,\$2,"
#echo $command
counter=3
ind=$((ind+2))
while [ $counter -lt $ind ]
do
	command="$command \$$counter,"
#	echo $command
	((counter++))
done
command="$command \$$counter}'"
eval $command >${file}.t.bed
echo $command
