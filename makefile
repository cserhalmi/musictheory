all: zeneelmélet.pdf

clean:
	rm zeneelmélet.dvi
	rm zeneelmélet.pdf

zeneelmélet.pdf: zeneelmélet.tex
	pdflatex -synctex=1 -interaction=nonstopmode $<

#zeneelmélet.pdf: zeneelmélet.dvi
#	pdflatex -synctex=1 -interaction=nonstopmode $<


zeneelmélet.dvi: zeneelmélet.tex makrok/environments.tex
	latex $<
	latex $<
	latex $<
