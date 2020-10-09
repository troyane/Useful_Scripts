#!/bin/bash 

#
# Script to mark documents with personal data, so they can't be easily used for identity theft.
#
# Example usage: 
#   sensitive "imgs\docs\personal.png" "Alice & Bob"
#   
# As result it will produce file "imgs\docs\personal_stamped.png" with red diagonal text
# over it "Alice & Bob personal docs".
#

if [ "$#" -ne 2 ]; then
  echo "Wrong arguments specified. 2 arguments required:"
  echo "  1st - path to image, e.g. \"imgs\docs\personal.png\""
  echo "  2nd - your note e.g. \"Alice & Bob\""
  echo "Example usage:" 
  echo "sensitive \"imgs\docs\personal.png\" \"Alice & Bob\""
  echo ""
  echo "Exiting."
  exit -1
fi

input="$1"

if [ ! -f "${input}" ]; then
    echo "File \"${input}\" not found! Exiting."
    exit -1
fi

# Get picture height
height="$(identify -ping -format '%h' ${input})"
# Calculate preferable text point size based on picture height 
preferablePointSize=$((height/11))
margin1=$((-1*preferablePointSize))
margin2=$((preferablePointSize/2))
directory="$(dirname "${input}")"
filename=$(basename -- "$input")
extension="${filename##*.}"
filename="${filename%.*}"

output=${directory}/${filename}_stamped.${extension}

convert -density 150 \
        -fill "rgba(255,0,0,0.25)" \
        -gravity Center -pointsize "${preferablePointSize}" \
        -draw "rotate -45 text 0,${margin1} \"${2}\" text 0,${margin2} \"personal docs\"" \
        "${input}" "${output}"

echo "Result saved to: ${output}"
