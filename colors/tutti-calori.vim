" Vim color file
" Converted from Textmate theme Espresso tutti colori using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "tutti-colori"

hi Cursor ctermfg=15 ctermbg=0 cterm=NONE guifg=#ffffff guibg=#000000 gui=NONE
hi Visual ctermfg=NONE ctermbg=188 cterm=NONE guifg=NONE guibg=#c9d0d9 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi LineNr ctermfg=244 ctermbg=254 cterm=NONE guifg=#808080 guibg=#e6e6e6 gui=NONE
hi VertSplit ctermfg=249 ctermbg=249 cterm=NONE guifg=#b5b5b5 guibg=#b5b5b5 gui=NONE
hi MatchParen ctermfg=55 ctermbg=NONE cterm=underline guifg=#6700b9 guibg=NONE gui=underline
hi StatusLine ctermfg=0 ctermbg=249 cterm=bold guifg=#000000 guibg=#b5b5b5 gui=bold
hi StatusLineNC ctermfg=0 ctermbg=249 cterm=NONE guifg=#000000 guibg=#b5b5b5 gui=NONE
hi Pmenu ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi PmenuSel ctermfg=NONE ctermbg=188 cterm=NONE guifg=NONE guibg=#c9d0d9 gui=NONE
hi IncSearch ctermfg=15 ctermbg=130 cterm=NONE guifg=#ffffff guibg=#bc670f gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=NONE ctermbg=194 cterm=bold guifg=NONE guibg=#e8ffd5 gui=bold
hi Folded ctermfg=244 ctermbg=15 cterm=NONE guifg=#7f7f7f guibg=#ffffff gui=NONE

hi Normal ctermfg=0 ctermbg=15 cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
hi Boolean ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Character ctermfg=130 ctermbg=231 cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi Comment ctermfg=244 ctermbg=NONE cterm=NONE guifg=#7f7f7f guibg=NONE gui=NONE
hi Conditional ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi Constant ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Define ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi DiffAdd ctermfg=0 ctermbg=149 cterm=bold guifg=#000000 guibg=#a1e85d gui=bold
hi DiffDelete ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f25454 guibg=NONE gui=NONE
hi DiffChange ctermfg=0 ctermbg=152 cterm=NONE guifg=#000000 guibg=#b9cfe7 gui=NONE
hi DiffText ctermfg=0 ctermbg=74 cterm=bold guifg=#000000 guibg=#729fcf gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Function ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi Identifier ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi Keyword ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi Label ctermfg=130 ctermbg=231 cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi NonText ctermfg=248 ctermbg=231 cterm=NONE guifg=#aaaaaa guibg=#f2f2f2 gui=NONE
hi Number ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Operator ctermfg=62 ctermbg=NONE cterm=NONE guifg=#626fc9 guibg=NONE gui=NONE
hi PreProc ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi Special ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi SpecialKey ctermfg=248 ctermbg=254 cterm=NONE guifg=#aaaaaa guibg=#e6e6e6 gui=NONE
hi Statement ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi StorageClass ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi String ctermfg=130 ctermbg=231 cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi Tag ctermfg=25 ctermbg=231 cterm=NONE guifg=#2f6f9f guibg=#f4faff gui=NONE
hi Title ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi Todo ctermfg=244 ctermbg=NONE cterm=inverse,bold guifg=#7f7f7f guibg=NONE gui=inverse,bold
hi Type ctermfg=53 ctermbg=NONE cterm=bold guifg=#3a1d72 guibg=NONE gui=bold
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi rubyFunction ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=NONE ctermbg=194 cterm=bold guifg=NONE guibg=#e8ffd5 gui=bold
hi rubyConstant ctermfg=53 ctermbg=NONE cterm=bold guifg=#3a1d72 guibg=NONE gui=bold
hi rubyStringDelimiter ctermfg=130 ctermbg=231 cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi rubyBlockParameter ctermfg=101 ctermbg=NONE cterm=NONE guifg=#7b8c4d guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi rubyInclude ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=101 ctermbg=NONE cterm=NONE guifg=#7b8c4d guibg=NONE gui=NONE
hi rubyRegexp ctermfg=71 ctermbg=NONE cterm=NONE guifg=#699d36 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=71 ctermbg=NONE cterm=NONE guifg=#699d36 guibg=NONE gui=NONE
hi rubyEscape ctermfg=NONE ctermbg=229 cterm=bold guifg=NONE guibg=#fcedbd gui=bold
hi rubyControl ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=101 ctermbg=NONE cterm=NONE guifg=#7b8c4d guibg=NONE gui=NONE
hi rubyOperator ctermfg=62 ctermbg=NONE cterm=NONE guifg=#626fc9 guibg=NONE gui=NONE
hi rubyException ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi rubyRailsUserClass ctermfg=53 ctermbg=NONE cterm=bold guifg=#3a1d72 guibg=NONE gui=bold
hi rubyRailsARAssociationMethod ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi rubyRailsARMethod ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi rubyRailsRenderMethod ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi rubyRailsMethod ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi erubyDelimiter ctermfg=244 ctermbg=NONE cterm=NONE guifg=#7f7f7f guibg=NONE gui=NONE
hi erubyComment ctermfg=244 ctermbg=NONE cterm=NONE guifg=#7f7f7f guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi htmlTag ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi htmlEndTag ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi htmlTagName ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi htmlArg ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi htmlSpecialChar ctermfg=NONE ctermbg=229 cterm=NONE guifg=NONE guibg=#fcedbc gui=NONE
hi javaScriptFunction ctermfg=55 ctermbg=NONE cterm=NONE guifg=#6700b9 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=25 ctermbg=231 cterm=NONE guifg=#2f6f9f guibg=#f4faff gui=NONE
hi yamlAnchor ctermfg=101 ctermbg=NONE cterm=NONE guifg=#7b8c4d guibg=NONE gui=NONE
hi yamlAlias ctermfg=101 ctermbg=NONE cterm=NONE guifg=#7b8c4d guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=130 ctermbg=231 cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi cssURL ctermfg=101 ctermbg=NONE cterm=NONE guifg=#7b8c4d guibg=NONE gui=NONE
hi cssFunctionName ctermfg=54 ctermbg=NONE cterm=bold guifg=#4e279a guibg=NONE gui=bold
hi cssColor ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi cssPseudoClassId ctermfg=74 ctermbg=NONE cterm=NONE guifg=#4f9fcf guibg=NONE gui=NONE
hi cssClassName ctermfg=74 ctermbg=NONE cterm=NONE guifg=#4f9fcf guibg=NONE gui=NONE
hi cssValueLength ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi cssCommonAttr ctermfg=97 ctermbg=231 cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi cssBraces ctermfg=244 ctermbg=NONE cterm=NONE guifg=#7f7f7f guibg=NONE gui=NONE
