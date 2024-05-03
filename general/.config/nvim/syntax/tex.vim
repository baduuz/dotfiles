so $VIMRUNTIME/syntax/tex.vim

if !exists("g:tex_no_math")
    call TexNewMathZone("E","align",1)
endif
