hi Normal guibg=Black guifg=White
set bg=dark
set guioptions-=T
set guifont=DejaVu\ Sans\ Mono:h18
set fuoptions=maxvert,maxhorz
set antialias

colo darkerdesert

" Menu of mappings
set wildmenu
set wcm=<Tab>
	amenu User.TaskList\ (F2)							<F2>
	amenu User.YRShow\ (F3)								<F3>
	amenu User.TagBar\ (F5)								<F5>
	amenu User.Next\ buffer\ (C-F6)						<C-F6>
	amenu User.NERDTree\ (F10)							<F10>
	amenu User.-sep1-									<Nop>
	amenu User.Clear\ search\ selection\ (<Leader>c)	<Leader>c
	amenu User.-sep2-									<Nop>
" Pad menu
	amenu User.Pad.Pad\ list\ (:Pad\ ls)					<ESC>:Pad ls<CR>
	amenu User.Pad.Pad\ new\ unnamed\ (:Pad\ new)					<ESC>:Pad new<CR>
	amenu User.Pad.Pad\ new\ with\ name\ (:Pad\ new\ name)					<ESC>:Pad new 
