SOURCES:=$(wildcard appendix/*.tex)
TARGETS:=$(patsubst %.tex,%.pdf,$(SOURCES))
DEPS:=$(wildcard *.tex)
TEMPORARY:=*.ind *.dvi *.glo *.lot *.idx *.lof \
	   *.log *.aux *.xdy *.idx *.ilg *.ist \
	   *.acn *.toc *.out *.pdf *.gen *.gz \
	   *.err *.txt *.backup *.*~
TEMPORARY+=$(patsubst %,appendix/%,$(TEMPORARY))

all: musictheory.pdf

clean:
	@echo cleaning up ...
	@-rm -f $(TEMPORARY)

musictheory.pdf: $(TARGETS) $(DEPS)

%.pdf: %.tex
	@echo compiling $<...
	@cd $(dir $<); pdflatex -shell-escape -synctex=1 -interaction=nonstopmode $(notdir $(basename $<)).tex >$(notdir $(basename $<)).txt# 2>$(notdir $(basename $<)).err
	touch musictheory.tex
