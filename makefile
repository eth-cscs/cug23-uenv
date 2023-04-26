TEXFILES=abstract.tex  deployment.tex  introduction.tex  paper.tex  results.tex  spack-stacks.tex listing-spec.tex
#IMAGEFILES=data/*.tex data/*.tbl

REV=

paper.pdf : $(TEXFILES) $(IMAGEFILES) bibup
	pdflatex paper

diff :
	latexdiff-vc -t UNDERLINE --git -d diff --force -r $(REV) $(TEXFILES)
	(cd diff; \
	ln -s ../images .; \
	ln -s ../src .; \
	ln -s ../data .; \
	pdflatex paper; \
	bibtex paper; \
	pdflatex paper)

bibup : paper.bib
	pdflatex paper
	bibtex paper
	pdflatex paper

force : paper.pdf
	pdflatex paper

clean :
	rm -f bibup
	rm -f *.log
	rm -f paper.bbl
	rm -f *.blg
	rm -f paper.pdf
	rm -f *.aux
	rm -rf diff/

.PHONY: bibup diff force clean
