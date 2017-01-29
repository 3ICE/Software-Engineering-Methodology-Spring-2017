# Kaktus Report

## Prérequis

pdflatex

## Build

Depuis la racine du projet :

```
rm -rf cache/; mkdir cache/; mkdir cache/tex; (cd tex; mv ../cache/main.pdf ../report.pdf; pdflatex -output-directory ../cache main.tex && pdflatex -output-directory ../cache main.tex && mv ../cache/main.pdf ../report.pdf)
```
