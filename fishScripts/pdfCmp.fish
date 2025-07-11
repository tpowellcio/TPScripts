function pdfCmp
pdfSplit $argv[1] $(basename $argv[1] .pdf)_cmp.pdf ebook
end