all: main.pdf main.tex abstract.tex chap1.tex chap2.tex chap3.tex chap4.tex chap5.tex chap6.tex main.bib appa.tex

clean: 
	rm -rf *aux
#	pdflatex main.tex
	sed -e "s/url\ =\ .*//g" main.bib > tmp
	sed -e "s/issn\ =\ .*//g" tmp > tmp2
	sed -e 's/<i>/\\textit{/g' tmp2 > tmp
	sed -e 's/<\/i>/}/g' tmp > tmp2
	sed -e 's/CO2/\{CO\}\\textsubscript{2}/g' tmp2 > tmp
	sed -e 's/<sub>12<\/sub>/\\textsubscript{12}/g' tmp > tmp2
	
	mv tmp2 main.bib

main.pdf: main.tex abstract.tex main.bib chap1.tex chap2.tex chap3.tex chap4.tex chap5.tex chap6.tex appa.tex
	pdflatex main.tex
	bibtex main
	bibtex main
	pdflatex main.tex
	pdflatex main.tex
	pdflatex main.tex
	open main.pdf -a /Applications/Preview.app
