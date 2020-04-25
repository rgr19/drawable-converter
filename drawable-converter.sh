#!/usr/bin/env bash

convert_to_res() {
	src=${1}
	fname="${src%.*}"
	dest="${fname}.png"

	echo "Convert image ${src} to DRAWABLE"

	if [ -f "${src}" ]; then
		echo " Creating different dimensions (dips) of "$src" ..."
		mkdir -p {drawable-xxxhdpi,drawable-xxhdpi,drawable-xhdpi,drawable-hdpi,drawable-mdpi,drawable-ldpi}

		convert ${src} -resize 345x345 drawable-xxxhdpi/${dest}
		convert ${src} -resize 144x144 drawable-xxhdpi/${dest}
		convert ${src} -resize 96x96 drawable-xhdpi/${dest}
		convert ${src} -resize 72x72 drawable-hdpi/${dest}
		convert ${src} -resize 48x48 drawable-mdpi/${dest}
		convert ${src} -resize 36x36 drawable-ldpi/${dest}
		echo " Done"
	else
		echo "${src} not found."
	fi
}

if [ ${#} -eq 0 ]; then
	echo "No arguments supplied"
elif [ ${#} -gt 1 ]; then
	for img in ${@}; do
		convert_to_res ${img}
  done
else
	convert_to_res ${1}
fi
