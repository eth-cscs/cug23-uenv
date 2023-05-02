TEXFILES=abstract.tex  deployment.tex  introduction.tex  paper.tex  results.tex  spack-stacks.tex listing-spec.tex

REV=

paper.pdf : $(TEXFILES) $(IMAGEFILES) bibup
	pdflatex paper

diff :
	latexdiff-vc -t UNDERLINE --git -d diff --force -r $(REV) $(TEXFILES)
	(cd diff; \
	ln -s ../images .; \
	ln -s ../src .; \
	ln -s ../data .; \
	ln -s ../paper.bib; \
	ln -s ../makefile; \
	make)

slides:
	pdflatex slides.tex

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
	rm -f slides.pdf
	rm -f *.aux
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f *.vrb
	rm -f *.toc
	rm -rf diff/

.PHONY: bibup diff force clean
