# PetryDish_QRdecoder
QR pipeline to generate QR codes to label petry dishes and automatically rename the pictures taken afterwards

Requirements
Have the Windows WSL of ubuntu active in your computer
Install zbar  https://manpages.ubuntu.com/manpages/xenial/man1/zbarimg.1.html
sudo apt-get install -y zbar-tools  // sudo apt-get install zbar-dbg

STICKER PRINTING
FOR DYMO USERS. THIS REQUIRES TO TAKE THE PICTURE WITH THE LID OFF.
Make a Label file in excel using as a template "LabelSheet" in the stickers folder. Make these columns: Date, Isolate, Isolate_B, Date_Isolate_B, Isolate_F, Date_Isolate_F
Make the labels in the Dymo using the LabelsDymo file in the stickers folder.
Print them with Dymo. We recommend  DYMO labelWriter 450 with multipurpose labels S0722530 13 x 25 mm 2up stickers but any other would work as well. 
Stick them on the lid. If you are going to take Front and Back pictures, put two stickers on opposite sides

FOR NON-DYMO USERS OR IF YOU WANT TO TAKE PICTURES WITH THE LID CLOSE
Take the QRgenerator script
Print the stickers in a multipurpose sticker sheet on a printer or even just normal paper. Cut the QR codes and stick them to your plates
If you want to take pictures with the lid close, we recommend to stick the QR code with tape in a way that the sticker goes out of the plate

TAKING PICTURES
Make the pictures. IMPORTANT: Stickers have to be focused. Suggested method:
Always have the same height and light. The stickers have a ruler in any case.
	
RENAME PICTURES 
ou need a folder called RawImages,Errors and one called Renamed. We will call this folder, Folder1
Put your images in the RawImages folder. Always keep a copy somewhere in case there is an error. 
Open the Ubuntu terminal
Type cd <path to your Folder1> and enter. 
run "sh QR_decoder.sh" and enter to run the script. 


CORRECTING ERRORS
Check your error pictures if any and rename them by hand. Then, cut them into the renamed folder to check you have all the files and there wasnt any other mistake. 
In case, there is no correspondance with the number of pictures, we need to know which ones do you have renamed and which ones might be missing or there were several pics of the same plate, etc. 
Run "sh ErrorDetector.sh". IMPORTANT to not change the order of the columns in the Sheet file in LabelSheet. 
If it changes, we have to open the Error detector with a text editor (notepad or notepad++) and change $5 and $7 to the column number we need. 
For example, if our QR labels are in the columns 1 and 4, we will have $1 and $4. DON'T add spaces or change anything else. 
The labels have to be the same ones that are in the QR code information which means, the ones that are used to rename the files. 
Once the Error detector has finished, it will print a list of missing pictures according to your original file. This can happen if, for instance, one photographed the back and front of a dish with the same sticker or once forgot some samples. 


ACKNOWLEDGEMENTS
[add citation]
