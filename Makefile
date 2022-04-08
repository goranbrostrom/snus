R_OPTS=--no-save --no-restore --no-init-file --no-site-file # vanilla, but with --environ

getdata.pdf: getdata.Rmd
	R ${R_OPTS} -e "rmarkdown::render('getdata.Rmd')"
	pdflatex getdata.tex

