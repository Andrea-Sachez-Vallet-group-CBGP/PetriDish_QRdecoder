#!/bin/bash
################################################
####### ERROR DETECTION QR CODES IN STICKERS####
################################################
#Project Fungal Inhibition in vitro assays TED Population analyses
#Pilar Vesga & Rocío Tirado November 2023_ErrorDetector#
#
#chmod +x 2023_ErrorDetect.sh
nRaw=$(find RawImages/ -type f | wc -l)
nRenamed=$(find Renamed/ -type f | wc -l)
echo "nRaw: $nRaw"
echo "nRenamed: $nRenamed"
#
if [ "$nRaw" -eq "$nRenamed" ]
then
# it simply moves the files to the different folders
  echo "Same number of files. Well done :D. Now, let's separate back and front"
  mkdir -p Renamed/Back
  mkdir -p Renamed/Front
  mv Renamed/*_B.jpeg Renamed/Back/
  mv Renamed/*_F.jpeg Renamed/Front/ 
else
#it creates a list of the labels used for the qr codes and a list of the files we have in the Renamed folder
  echo "Amount of files in RawImages different than in Renamed"
  read -p "Introduce the name of your labels file without the .xlsx extension (remember to previously copy the .xlsx in the Stickers folder): " LabelSheet #It saves your file as the object LabelSheet
  xlsx2csv Stickers/"$LabelSheet".xlsx > Labels.csv #Transform the excel to csv. Important that the excel doens't have commas
  #paste -d '\n' <(csvcut -c QR_Code_B -d ',' Labels.csv) <(csvcut -c QR_Code_F -d ',' Labels.csv) | tail -n +3 > list_labels.txt
  paste -d '\n' <(csvcut -c QR_Code_B -d ',' Labels.csv) <(csvcut -c QR_Code_F -d ',' Labels.csv) | tail -n +3 > list_labels.txt
  ls Renamed/ > list_renamed.txt #generated the list of files from the folder
  sed -e s/.jpeg//g -i list_renamed.txt #removes the .jpeg from the list of files of the renamed folder
  sort list_renamed.txt -o list_renamed.txt #for the comm command is important that the lines are alphabetically ordered
  sort list_labels.txt -o list_labels.txt
  comm -13 --nocheck-order list_renamed.txt list_labels.txt > list_missing.txt #compares the two lists. 
fi
echo "Done!!!"