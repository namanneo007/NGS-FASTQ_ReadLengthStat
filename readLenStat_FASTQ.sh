#	AUTHOR : NAMAN MANGUKIA
#	
#	THIS PROGRAM WILL GIVE 5 Read length statistics of provided .FASTQ file:
#
#	1.	No of Reads
#	2.	No of Bases
#	3.	Maximum read length
#	4.	Minimum read length
#	5.	Mean read length
#

if [ $# -ne 1 ]
  then
    echo "Usage: sh $0	[SINGLE FASTQ FILE]"
    exit 1
fi

echo "====>>>>|||	READ-LEN-STATS	:	$1	|||<<<<===="
echo ""

awk {'if((NR+2)%4==0) print length'} $1|awk 'BEGIN {count=0;sum=0;max=0;min=0;mean} {count++;sum+=$0;if(max<$0){max=$0};if(NR==1){min=$0} else{if(min>$0){min=$0}}} END {print "READS\t\t"count"\nBASES\t\t"sum"\nMax-Read-Len\t"max"\nMin-Read-Len\t"min"\nMean-Read-Len\t"sum/count}'
