# make the TeX

all:
	rm -rf cache/; mkdir cache/; mkdir cache/tex; (cd tex; mv ../cache/main.pdf ../../plan.pdf; pdflatex -output-directory ../cache main.tex && pdflatex -output-directory ../cache main.tex && mv ../cache/main.pdf ../../plan.pdf)

clean cl:
	rm -rf cache/
