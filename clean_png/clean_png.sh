#!/bin/bash

for f in *.png
do
	echo "Stripping $f"
	echo -e " -> was \c" && stat --printf="%sb" $f
	
	# Strip the image of any profiles, comments or these PNG chunks: 
	# bKGD,cHRM,EXIF,gAMA,iCCP,iTXt,sRGB,tEXt,zCCP,zTXt,date.
	convert -strip $f $f > /dev/null 2>&1
	
	# Removes all Metadata for Exif and so on and overwrites the original file.
	exiftool -overwrite_original -all= $f > /dev/null 2>&1
	
	echo -e ", become \c" && stat --printf="%sb" $f
	echo ""
done
