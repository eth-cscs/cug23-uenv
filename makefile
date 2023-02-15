TEXFILES=abstract.tex  deployment.tex  introduction.tex  paper.tex  results.tex  spack-stacks.tex
#IMAGEFILES=data/*.tex data/*.tbl

paper.pdf : $(TEXFILES) $(IMAGEFILES) bibup
	pdflatex paper

bibup : paper.bib
	pdflatex paper
	bibtex paper
	pdflatex paper
	touch bibup

force : paper.pdf
	pdflatex paper

clean :
	rm -f bibup
	rm -f *.log
	rm -f paper.bbl
	rm -f *.blg
	rm -f paper.pdf
	rm -f *.aux
