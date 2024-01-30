###########################################
##### Generating QR codes with qrencode####
###########################################
#Program: qr encode and convert
#Project: Fungal Inhibition Assays ASV laboratory TED WP1
#Author: Pilar Vesga April 2023
###########################################
#
#
#!/bin/bash
#Tutorial qrencode: https://unix.stackexchange.com/questions/654784/how-can-i-generate-qr-codes-with-subtitles
#Tutorial functions convert: https://imagemagick.org/script/convert.php
#Pixel - cm conversor: https://www.unitconverters.net/typography/centimeter-to-pixel-x.htm
#
#Install qrencode and imagemagick
#sudo apt-get install qrencode
#sudo apt install imagemagick
#
#create the ruler of 2cm which is equivalent of aprox 75 pixels. 
convert -size 175x10 xc:white -draw 'line 20,5 95.590551181,5' -strokewidth 3 rulerLine.png #This is a line of 2cm that starts on coordinates 20,5
dos2unix Labels.txt
#
for i in $(cat Labels.txt); do #change the name of the file each time if date is added
  qrencode $i -t png -l H -d 300 -s 10 -o $i.q.png
  convert $i.q.png -resize 50% $i.q.png
  convert -size 175x10 xc:white -pointsize 12 -gravity center -font /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf -draw "text 4,0 '$i'" $i.s.png #change pointsize if too much text
  convert -append $i.q.png $i.s.png $i.png
	rm $i.q.png
	rm $i.s.png
  convert -append $i.png rulerLine.png $i.png
  mv $i.png QRcodes
 echo $i
done