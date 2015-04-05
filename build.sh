#\bin\env bash

echo "Generating PDF"
pandoc -s answers.tex -N -o answers.pdf
echo "Done: PDF is named answers.pdf"