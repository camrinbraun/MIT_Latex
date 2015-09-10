all: main.pdf main.tex chap1.tex chap2.tex chap3.tex main.bib

clean: 
	rm -rf *aux
	pdflatex main.tex

main.pdf: main.tex main.bib chap1.tex chap2.tex chap3.tex
	bibtex main
	bibtex main
	pdflatex main.tex
	pdflatex main.tex
	pdflatex main.tex
	open main.pdf -a /Applications/Preview.app
