# PetryDish_QRdecoder
QR pipeline to generate QR codes to label petry dishes and automatically rename the pictures taken afterwards

## Requirements
Have the Windows WSL of ubuntu active in your computer
Install [zbar](https://manpages.ubuntu.com/manpages/xenial/man1/zbarimg.1.html)
```
sudo apt-get install -y zbar-tools
```
OR
```
sudo apt-get install zbar-dbg
```

## STICKER PRINTING
### FOR DYMO USERS. THIS REQUIRES TO TAKE THE PICTURE WITH THE LID OFF.
* Make a Label file in excel using as a template "LabelSheet" in the stickers folder. Make these columns: Isolate, Treatment, BiologicalReplicate, TechnicalReplicate, Side, Date, QR_Code_F, Label, Isolate, Treatment, BiologicalReplicate, TechnicalReplicate,	Side, Date, QR_Code_B, Label
* Make the labels in the Dymo using the LabelsDymo file in the stickers folder.
* Print them with Dymo. We recommend  DYMO labelWriter 450 with multipurpose labels S0722530 13 x 25 mm 2up stickers but any other would work as well. 
* Stick them on the lid. If you are going to take Front and Back pictures, put two stickers on opposite sides. 

### FOR NON-DYMO USERS OR IF YOU WANT TO TAKE PICTURES WITH THE LID CLOSE
Requires [qrencode](https://unix.stackexchange.com/questions/654784/how-can-i-generate-qr-codes-with-subtitles), [dos2unix](https://manpages.ubuntu.com/manpages/trusty/es/man1/dos2unix.1.html) and [imagemagick](https://imagemagick.org/script/convert.php)
```
sudo apt-get install qrencode
sudo apt install imagemagick
sudo apt install dos2unix
```
Instructions:
* Make a Label file called Labels.txt. Format DATE_ISOLATE_TREATMENT_BREPLICATE_TREPLICATE_SIDE. Example in the folder
* Make a folder called QRcodes
* Run the script QRgenerator.sh
* Print QRs with the windows tool (select images, right click, print, page of 35 images,  NOT fiting page). Print the stickers in a multipurpose sticker sheet on a printer or even just normal paper.
* Cut the QRs to be used in the sampling. The line is designed as 2cm but when printing it shrinks to 1cm.
* If you want to take pictures with the lid close, we recommend to stick the QR code with tape in a way that the sticker goes out of the plate.

## TAKING PICTURES
IMPORTANT: Stickers have to be focused. Suggested method: Always have the same height and light. The stickers have a ruler in any case.
	
## RENAMING PICTURES 
* Create a main folder RootFolder
* Create folders named RawImages, Errors and Renamed. 
* Put your images in the RawImages folder. Always keep a copy somewhere in case there is an error. 
* Open the Ubuntu terminal, select the path to your folder and run the script

```
cd /path to your RootFolder/ 
sh QR_decoder.sh
```

## CORRECTING ERRORS
Requires [csv kit](https://csvkit.readthedocs.io/en/latest/) and [xlsx2csv](https://github.com/dilshod/xlsx2csv)
```
sudo apt install python3-pip
pip install xlsx2csv 
pip install csvkit
```
Intructions:
* Check your error pictures if any and rename them by hand. Then, cut them into the renamed folder to check you have all the files and there wasnt any other mistake. 
* In case, there is no correspondance with the number of pictures, we need to know which ones do you have renamed and which ones might be missing or there were several pics of the same plate, etc. 
* Run "sh ErrorDetector.sh". IMPORTANT to not change the order of the columns in the Sheet file in LabelSheet. This is the file you will need 
	* Some versions of zbar give an error related to sockets. If that is the case, uncomment (remove the #) from line 35 of the ErrorDetector Script
	* If you used the alternative to DYMO stickers, use the ErrorDetector of that folder and place your Labels.txt 
* Once the Error detector has finished, it will print a list of missing pictures according to your original file. This can happen if, for instance, one photographed the back and front of a dish with the same sticker or one forgot some samples. 

## License

This project is licensed under the CC0-1.0 license

## ACKNOWLEDGEMENTS
Vesga P., Tirado R., Akdemir D., De Francesco A., Sanchez-Vallet A. (Under preparation). Evaluation of fungal endophytes isolated from Spanish Durum wheat for biocontrol of the fungal pathogen Zymoseptoria tritici.
