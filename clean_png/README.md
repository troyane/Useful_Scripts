# PNG Clean script

## Details

* This script strips the image of any profiles, comments or these PNG chunks: bKGD,cHRM,EXIF,gAMA,iCCP,iTXt,sRGB,tEXt,zCCP,zTXt,date.
* Removes all Metadata for Exif and so on and overwrites the original file.
  
## Requirements

* bash (Linux or on Windows via git-bash or similar)
* [ImageMagick](https://imagemagick.org/)
* `exiftool` installed (`sudo apt install libimage-exiftool-perl`)

## Usage 

Drop this script into a folder with your `png`-files. Run as a script, no need for additional arguments. It will clean and overwrite all.

### Example usage

```
# ./clean_png.sh
Stripping file.png
 -> was 519596b, become 512231b
```
