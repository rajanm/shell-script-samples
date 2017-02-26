#!/bin/bash

echo "start grouping csv file" $(date +%x_%r)

# to group the file by first 54 columns and sum the 55 and 56 column
awk -F"," '
NR==1 {print "risk by currency+region+le, exposure, hedge"}
NR!=1 {OFS=",";a[$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$50,$51,$52,$53,$54]+=$55;b[$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$50,$51,$52,$53,$54]+=$56;} END {for (i in a){print i,a[i],b[i]}}
' sensfile.csv > sensfiletmp.csv 

echo "completed grouping csv file" $(date +%x_%r)

# remove unprintable characters from awk output
tr -cd '\11\12\15\40-\176' < sensfiletmp.csv > sensfileout.csv 

echo "completed formatting csv file" $(date +%x_%r)