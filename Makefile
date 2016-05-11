test:
	Rscript -e 'library(methods);library(testthat);devtools::test();'

readme:
	Rscript -e 'library(knitr);knit("README.Rmd", "README.md");'

cran:
	-rm *.tar.gz
	Rscript -e 'library(methods);library(testthat);devtools::build(path=".");'
	R CMD check --as-cran *.tar.gz
	rm -rf pystr.Rcheck

pdf:
	R CMD Rd2pdf ../pystr
	rm -rf .*Rd2pdf
