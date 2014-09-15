LATEX = pdflatex --shell-escape
SPELL = aspell
TARGET = K3-Reference
BIBTEX = bibtex

default: $(TARGET).tex 
	$(LATEX) $(TARGET); $(BIBTEX) $(TARGET); $(LATEX) $(TARGET); $(LATEX) $(TARGET)

view: $(TARGET).tex 
	$(LATEX) $(TARGET); $(BIBTEX) $(TARGET); $(LATEX) $(TARGET); $(LATEX) $(TARGET)
	open $(TARGET).pdf &

clean:
	$(RM) -f *.out *.aux *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TARGET).ps $(TARGET).pdf *.tdo *~

check:
	@echo "Passing the check will cause make to report Error 1."
	$(LATEX) $(TARGET)  | grep -i undefined
