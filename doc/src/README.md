# Report

## Prerequisites

pdflatex

## Build

Execute this command from the projet root:

```
rm -rf cache/; mkdir cache/; mkdir cache/tex; (cd tex; mv ../cache/main.pdf ../report.pdf; pdflatex -output-directory ../cache main.tex && pdflatex -output-directory ../cache main.tex && mv ../cache/main.pdf ../report.pdf)
```
