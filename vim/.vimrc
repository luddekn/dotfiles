"Enabling gui colors"
set termguicolors

"Setting line numbers"
set number
set relativenumber

"Status line"
set laststatus=2
set statusline=\ %{StatuslineMode()}\ %f%m%=%{tolower(&filetype)}\ \|\ %{&encoding}[%{&fileformat}]\ \|\ Ln\ %l\,\ Col\ %c\ \|\ Buf:%n

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

"Enabling mouse support"
set mouse=a

"Enabling syntax"
syntax on

"Show matching bracket pairs"
set showmatch

"Search highlight"
set hlsearch
"Smartcase for searching"
set ignorecase
set smartcase

set background=dark

hi clear
let g:colors_name = 'rosepine'

let s:t_Co = exists('&t_Co') && !has('gui_running') ? (&t_Co ?? 0) : -1
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')

hi! link CurSearch IncSearch
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link WildMenu IncSearch
hi! link markdownH1Delimiter markdownH1
hi! link markdownH2Delimiter markdownH2
hi! link markdownH3Delimiter markdownH3
hi! link markdownH4Delimiter markdownH4
hi! link markdownH5Delimiter markdownH5
hi! link markdownH6Delimiter markdownH6
hi! link markdownURL markdownLinkText
hi! link mkdLink mkdInlineURL
hi! link mkdLinkDef mkdInlineURL
hi! link mkdURL mkdInlineURL

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#26233a', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4', '#908caa', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4']
endif
if get(g:,'disable_bg',0)
  hi Normal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
  hi NormalNC guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
  hi SignColumn guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
  hi StatusLineNC guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
else
  hi Normal guifg=#e0def4 guibg=#000000 gui=NONE cterm=NONE
  hi NormalNC guifg=#e0def4 guibg=#000000 gui=NONE cterm=NONE
  hi SignColumn guifg=#e0def4 guibg=#000000 gui=NONE cterm=NONE
  hi StatusLineNC guifg=#6e6a86 guibg=#000000 gui=NONE cterm=NONE
endif
if get(g:,'disable_float_bg',0)
  hi DarkenedPanel guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi DarkenedStatusline guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Folded guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
  hi NormalFloat guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=#908caa guibg=NONE gui=NONE cterm=NONE
  hi StatusLine guifg=#908caa guibg=NONE gui=NONE cterm=NONE
  hi TabLine guifg=#908caa guibg=NONE gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
else
  hi DarkenedPanel guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
  hi DarkenedStatusline guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
  hi Folded guifg=#e0def4 guibg=#1f1d2e gui=NONE cterm=NONE
  hi NormalFloat guifg=#e0def4 guibg=#1f1d2e gui=NONE cterm=NONE
  hi Pmenu guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
  hi StatusLine guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
  hi TabLine guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
endif
if !s:italics 
  hi Comment guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
else
  hi Comment guifg=#6e6a86 guibg=NONE gui=italic cterm=italic
  if !s:italics
    hi Comment gui=NONE cterm=NONE
  endif
endif
hi ColorColumn guifg=NONE guibg=#26233a gui=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#21202e gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#21202e gui=NONE cterm=NONE
hi CursorLineNr guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=NONE guibg=#333c48 gui=NONE cterm=NONE
hi DiffChange guifg=NONE guibg=#26233a gui=NONE cterm=NONE
hi DiffDelete guifg=NONE guibg=#43293a gui=NONE cterm=NONE
hi DiffText guifg=NONE guibg=#433842 gui=NONE cterm=NONE
hi Directory guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#eb6f92 guibg=NONE gui=bold cterm=bold
hi FloatBorder guifg=#403d52 guibg=NONE gui=NONE cterm=NONE
hi FloatTitle guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#000000 guibg=#ebbcba gui=NONE cterm=NONE
hi LineNr guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#e0def4 guibg=#403d52 gui=NONE cterm=NONE
hi ModeMsg guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#21202e gui=NONE cterm=NONE
hi PmenuSel guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
hi Question guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Search guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
hi SpecialKey guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellCap guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellLocal guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellRare guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi TabLineSel guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
hi Title guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#403d52 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
hi WarningMsg guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Character guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#31748f guibg=NONE gui=NONE cterm=NONE
hi Constant guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Debug guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Define guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
hi Exception guifg=#31748f guibg=NONE gui=NONE cterm=NONE
hi Float guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#31748f guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Macro guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#31748f guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#31748f guibg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
hi Structure guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Tag guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi htmlArg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi htmlBold guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlEndTag guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi htmlH1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
hi htmlH2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
hi htmlH3 guifg=#ebbcba guibg=NONE gui=bold cterm=bold
hi htmlH4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
hi htmlH5 guifg=#31748f guibg=NONE gui=bold cterm=bold
if !s:italics 
  hi htmlItalic guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
else
  hi htmlItalic guifg=NONE guibg=NONE gui=italic ctermfg=NONE ctermbg=NONE cterm=italic
  if !s:italics
    hi htmlItalic gui=NONE cterm=NONE
  endif
endif
hi htmlLink guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi htmlTag guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi htmlTagN guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi htmlTagName guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi markdownDelimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi markdownH1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
hi markdownH2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
hi markdownH3 guifg=#ebbcba guibg=NONE gui=bold cterm=bold
hi markdownH4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
hi markdownH5 guifg=#31748f guibg=NONE gui=bold cterm=bold
hi markdownH6 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
hi markdownLinkText guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
if !s:italics 
  hi mkdCode guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
else
  hi mkdCode guifg=#9ccfd8 guibg=NONE gui=italic cterm=italic
  if !s:italics
    hi mkdCode gui=NONE cterm=NONE
  endif
endif
hi mkdCodeDelimiter guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
hi mkdCodeEnd guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi mkdCodeStart guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi mkdFootnotes guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
hi mkdID guifg=#9ccfd8 guibg=NONE gui=underline cterm=underline
hi mkdInlineURL guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
hi mkdListItemLine guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
hi mkdRule guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi VimwikiHR guifg=#908caa guibg=NONE gui=NONE cterm=NONE
hi VimwikiHeader1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
hi VimwikiHeader2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
hi VimwikiHeader3 guifg=#ebbcba guibg=NONE gui=bold cterm=bold
hi VimwikiHeader4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
hi VimwikiHeader5 guifg=#31748f guibg=NONE gui=bold cterm=bold
hi VimwikiHeader6 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
hi VimwikiHeaderChar guifg=#31748f guibg=NONE gui=NONE cterm=NONE
hi VimwikiLink guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
hi VimwikiList guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
hi VimwikiNoExistsLink guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
