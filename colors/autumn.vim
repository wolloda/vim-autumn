" Author:       Vojtech Kana

" GUI colors
let s:guiColors = 
\{ 'foreground': "#cccccc",
\  'background': "#444646",
\  'selection': "#707070",
\  'line': "#393939",
\  'comment': "#9a9a9a",
\  'crimson': "#c9666b",
\  'red': "#f2777a",
\  'pink': "#fc6d8a",
\  'orange': "#f99157",
\  'yellow': "#fee56b",
\  'green': "#99cc99",
\  'aqua': "#66cccc",
\  'blue': "#6699cc",
\  'purple': "#cc99cc",
\  'window': "#4d5057",
\  'diffAdd': "#4c4e39",
\  'diffChange': "#2b5b77" }

let s:termColors = 
\{ 'foreground': 251,
\  'background': 236,
\  'selection': 239,
\  'line': 237,
\  'comment': 247,
\  'crimson': 203,
\  'red': 174,
\  'pink': 204,
\  'orange': 209,
\  'yellow': 185,
\  'green': 157,
\  'aqua': 123,
\  'blue': 67,
\  'purple': 139,
\  'window': 239,
\  'diffAdd': 238,
\  'diffChange': 39 }

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "autumn"

if has("gui_running") || &t_Co == 88 || &t_Co == 256

	" Sets the highlighting for the given group
	fun! <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=" . get(s:guiColors, a:fg) . " ctermfg=" . get(s:termColors, a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=" . get(s:guiColors, a:bg) . " ctermbg=" . get(s:termColors, a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun

	call <SID>X("Normal", 'foreground', 'background', "")
	call <SID>X("SpellBad", 'purple', '', "bold,underline")
	call <SID>X("Conceal", 'crimson', 'background', "")
	call <SID>X("Braces", 'crimson', "", "")
	call <SID>X("LineNr", 'comment', "", "")
	call <SID>X("CursorLineNr", 'yellow', "", "bold")
	call <SID>X("NonText", 'comment', "", "")
	call <SID>X("SpecialKey", 'selection', "", "")
	call <SID>X("Search", 'orange', 'background', "underline")
	call <SID>X("TabLine", 'window', 'foreground', "reverse")
	call <SID>X("TabLineFill", 'window', 'foreground', "reverse")
	call <SID>X("StatusLine", 'window', 'yellow', "reverse")
	call <SID>X("StatusLineNC", 'window', 'foreground', "reverse")
	call <SID>X("VertSplit", 'window', 'window', "none")
	call <SID>X("Visual", "", 'selection', "")
	call <SID>X("Directory", 'blue', "", "")
	call <SID>X("ModeMsg", 'green', "", "")
	call <SID>X("MoreMsg", 'green', "", "")
	call <SID>X("Question", 'green', "", "")
	call <SID>X("WarningMsg", 'red', "", "")
	call <SID>X("MatchParen", "", 'selection', "")
	call <SID>X("Folded", 'comment', 'background', "")
	call <SID>X("FoldColumn", "", 'background', "")
	if version >= 700
		call <SID>X("CursorLine", "", 'line', "none")
		call <SID>X("CursorColumn", "", 'line', "none")
		call <SID>X("PMenu", 'foreground', 'selection', "none")
		call <SID>X("PMenuSel", 'foreground', 'selection', "reverse")
		call <SID>X("SignColumn", "", 'background', "none")
	end
	if version >= 703
		call <SID>X("ColorColumn", "", 'line', "none")
	end

	" Standard Highlighting
	call <SID>X("Comment", 'comment', "", "")
	call <SID>X("Todo", 'red', 'background', "bold")
	call <SID>X("Title", 'comment', "", "")
	call <SID>X("Identifier", 'red', "", "none")
	call <SID>X("Statement", 'foreground', "", "")
	call <SID>X("Conditional", 'foreground', "", "")
	call <SID>X("Repeat", 'foreground', "", "")
	call <SID>X("Structure", 'purple', "", "")
	call <SID>X("Function", 'yellow', "", "")
	call <SID>X("Constant", 'orange', "", "")
	call <SID>X("Keyword", 'orange', "", "")
	call <SID>X("String", 'pink', "", "")
	call <SID>X("Special", 'foreground', "", "")
	call <SID>X("PreProc", 'purple', "", "")
	call <SID>X("Operator", 'aqua', "", "none")
	call <SID>X("Type", 'blue', "", "none")
	call <SID>X("Define", 'purple', "", "none")
	call <SID>X("Include", 'blue', "", "")
	"call <SID>X("Ignore", "666666", "", "")

	" Vim Highlighting
	call <SID>X("vimCommand", 'yellow', "", "none")

	" C Highlighting
	call <SID>X("cType", 'yellow', "", "")
	call <SID>X("cStorageClass", 'blue', "", "bold")
	"call <SID>X("cConditional", 'purple', "", "")
	"call <SID>X("cRepeat", 'purple', "", "")
	
	" CPP Highlighting
	call <SID>X("cppAccess", 'crimson', "", "bold")
	call <SID>X("cCustomClass", 'blue', "", "")
	call <SID>X("cppSTLnamespace", 'blue', "", "")
	call <SID>X("cppBoolean", 'yellow', "", "bold")

	highlight link cppSTLfunction Function
	highlight link cppSTLconstant cType
	highlight link cppType cType
	highlight link cppSTLType cType

	" PHP Highlighting
	call <SID>X("phpVarSelector", 'red', "", "")
	call <SID>X("phpKeyword", 'purple', "", "")
	call <SID>X("phpRepeat", 'purple', "", "")
	call <SID>X("phpConditional", 'purple', "", "")
	call <SID>X("phpStatement", 'purple', "", "")
	call <SID>X("phpMemberSelector", 'foreground', "", "")

	" Ruby Highlighting
	call <SID>X("rubySymbol", 'green', "", "")
	call <SID>X("rubyConstant", 'yellow', "", "")
	call <SID>X("rubyAccess", 'yellow', "", "")
	call <SID>X("rubyAttribute", 'blue', "", "")
	call <SID>X("rubyInclude", 'blue', "", "")
	call <SID>X("rubyLocalVariableOrMethod", 'orange', "", "")
	call <SID>X("rubyCurlyBlock", 'orange', "", "")
	call <SID>X("rubyStringDelimiter", 'green', "", "")
	call <SID>X("rubyInterpolationDelimiter", 'orange', "", "")
	call <SID>X("rubyConditional", 'purple', "", "")
	call <SID>X("rubyRepeat", 'purple', "", "")
	call <SID>X("rubyControl", 'purple', "", "")
	call <SID>X("rubyException", 'purple', "", "")

	" Crystal Highlighting
	call <SID>X("crystalSymbol", 'green', "", "")
	call <SID>X("crystalConstant", 'yellow', "", "")
	call <SID>X("crystalAccess", 'yellow', "", "")
	call <SID>X("crystalAttribute", 'blue', "", "")
	call <SID>X("crystalInclude", 'blue', "", "")
	call <SID>X("crystalLocalVariableOrMethod", 'orange', "", "")
	call <SID>X("crystalCurlyBlock", 'orange', "", "")
	call <SID>X("crystalStringDelimiter", 'green', "", "")
	call <SID>X("crystalInterpolationDelimiter", 'orange', "", "")
	call <SID>X("crystalConditional", 'purple', "", "")
	call <SID>X("crystalRepeat", 'purple', "", "")
	call <SID>X("crystalControl", 'purple', "", "")
	call <SID>X("crystalException", 'purple', "", "")

	" Python Highlighting
	call <SID>X("pythonInclude", 'purple', "", "")
	call <SID>X("pythonStatement", 'purple', "", "")
	call <SID>X("pythonConditional", 'purple', "", "")
	call <SID>X("pythonRepeat", 'purple', "", "")
	call <SID>X("pythonException", 'purple', "", "")
	call <SID>X("pythonFunction", 'blue', "", "")
	call <SID>X("pythonPreCondit", 'purple', "", "")
	call <SID>X("pythonRepeat", 'aqua', "", "")
	call <SID>X("pythonExClass", 'orange', "", "")

	" JavaScript Highlighting
	call <SID>X("javaScriptBraces", 'foreground', "", "")
	call <SID>X("javaScriptFunction", 'purple', "", "")
	call <SID>X("javaScriptConditional", 'purple', "", "")
	call <SID>X("javaScriptRepeat", 'purple', "", "")
	call <SID>X("javaScriptNumber", 'orange', "", "")
	call <SID>X("javaScriptMember", 'orange', "", "")
	call <SID>X("javascriptNull", 'orange', "", "")
	call <SID>X("javascriptGlobal", 'blue', "", "")
	call <SID>X("javascriptStatement", 'red', "", "")

	" CoffeeScript Highlighting
	call <SID>X("coffeeRepeat", 'purple', "", "")
	call <SID>X("coffeeConditional", 'purple', "", "")
	call <SID>X("coffeeKeyword", 'purple', "", "")
	call <SID>X("coffeeObject", 'yellow', "", "")

	" HTML Highlighting
	call <SID>X("htmlTag", 'red', "", "")
	call <SID>X("htmlTagName", 'red', "", "")
	call <SID>X("htmlArg", 'red', "", "")
	call <SID>X("htmlScriptTag", 'red', "", "")

	" Diff Highlighting
	call <SID>X("diffAdd", "", 'diffAdd', "")
	call <SID>X("diffDelete", 'background', 'red', "")
	call <SID>X("diffChange", "", 'diffChange', "")
	call <SID>X("diffText", 'line', 'blue', "")

	" ShowMarks Highlighting
	call <SID>X("ShowMarksHLl", 'orange', 'background', "none")
	call <SID>X("ShowMarksHLo", 'purple', 'background', "none")
	call <SID>X("ShowMarksHLu", 'yellow', 'background', "none")
	call <SID>X("ShowMarksHLm", 'aqua', 'background', "none")

	" Lua Highlighting
	call <SID>X("luaStatement", 'purple', "", "")
	call <SID>X("luaRepeat", 'purple', "", "")
	call <SID>X("luaCondStart", 'purple', "", "")
	call <SID>X("luaCondElseif", 'purple', "", "")
	call <SID>X("luaCond", 'purple', "", "")
	call <SID>X("luaCondEnd", 'purple', "", "")

	" Cucumber Highlighting
	call <SID>X("cucumberGiven", 'blue', "", "")
	call <SID>X("cucumberGivenAnd", 'blue', "", "")

	" Go Highlighting
	call <SID>X("goDirective", 'purple', "", "")
	call <SID>X("goDeclaration", 'purple', "", "")
	call <SID>X("goStatement", 'purple', "", "")
	call <SID>X("goConditional", 'purple', "", "")
	call <SID>X("goConstants", 'orange', "", "")
	call <SID>X("goTodo", 'yellow', "", "")
	call <SID>X("goDeclType", 'blue', "", "")
	call <SID>X("goBuiltins", 'purple', "", "")
	call <SID>X("goRepeat", 'purple', "", "")
	call <SID>X("goLabel", 'purple', "", "")

	" Clojure Highlighting
	call <SID>X("clojureConstant", 'orange', "", "")
	call <SID>X("clojureBoolean", 'orange', "", "")
	call <SID>X("clojureCharacter", 'orange', "", "")
	call <SID>X("clojureKeyword", 'green', "", "")
	call <SID>X("clojureNumber", 'orange', "", "")
	call <SID>X("clojureString", 'green', "", "")
	call <SID>X("clojureRegexp", 'green', "", "")
	call <SID>X("clojureParen", 'aqua', "", "")
	call <SID>X("clojureVariable", 'yellow', "", "")
	call <SID>X("clojureCond", 'blue', "", "")
	call <SID>X("clojureDefine", 'purple', "", "")
	call <SID>X("clojureException", 'red', "", "")
	call <SID>X("clojureFunc", 'blue', "", "")
	call <SID>X("clojureMacro", 'blue', "", "")
	call <SID>X("clojureRepeat", 'blue', "", "")
	call <SID>X("clojureSpecial", 'purple', "", "")
	call <SID>X("clojureQuote", 'blue', "", "")
	call <SID>X("clojureUnquote", 'blue', "", "")
	call <SID>X("clojureMeta", 'blue', "", "")
	call <SID>X("clojureDeref", 'blue', "", "")
	call <SID>X("clojureAnonArg", 'blue', "", "")
	call <SID>X("clojureRepeat", 'blue', "", "")
	call <SID>X("clojureDispatch", 'blue', "", "")

	" Scala Highlighting
	call <SID>X("scalaKeyword", 'purple', "", "")
	call <SID>X("scalaKeywordModifier", 'purple', "", "")
	call <SID>X("scalaOperator", 'blue', "", "")
	call <SID>X("scalaPackage", 'red', "", "")
	call <SID>X("scalaFqn", 'foreground', "", "")
	call <SID>X("scalaFqnSet", 'foreground', "", "")
	call <SID>X("scalaImport", 'purple', "", "")
	call <SID>X("scalaBoolean", 'orange', "", "")
	call <SID>X("scalaDef", 'purple', "", "")
	call <SID>X("scalaVal", 'purple', "", "")
	call <SID>X("scalaVar", 'aqua', "", "")
	call <SID>X("scalaClass", 'purple', "", "")
	call <SID>X("scalaObject", 'purple', "", "")
	call <SID>X("scalaTrait", 'purple', "", "")
	call <SID>X("scalaDefName", 'blue', "", "")
	call <SID>X("scalaValName", 'foreground', "", "")
	call <SID>X("scalaVarName", 'foreground', "", "")
	call <SID>X("scalaClassName", 'foreground', "", "")
	call <SID>X("scalaType", 'yellow', "", "")
	call <SID>X("scalaTypeSpecializer", 'yellow', "", "")
	call <SID>X("scalaAnnotation", 'orange', "", "")
	call <SID>X("scalaNumber", 'orange', "", "")
	call <SID>X("scalaDefSpecializer", 'yellow', "", "")
	call <SID>X("scalaClassSpecializer", 'yellow', "", "")
	call <SID>X("scalaBackTick", 'green', "", "")
	call <SID>X("scalaRoot", 'foreground', "", "")
	call <SID>X("scalaMethodCall", 'blue', "", "")
	call <SID>X("scalaCaseType", 'yellow', "", "")
	call <SID>X("scalaLineComment", 'comment', "", "")
	call <SID>X("scalaComment", 'comment', "", "")
	call <SID>X("scalaDocComment", 'comment', "", "")
	call <SID>X("scalaDocTags", 'comment', "", "")
	call <SID>X("scalaEmptyString", 'green', "", "")
	call <SID>X("scalaMultiLineString", 'green', "", "")
	call <SID>X("scalaUnicode", 'orange', "", "")
	call <SID>X("scalaString", 'green', "", "")
	call <SID>X("scalaStringEscape", 'green', "", "")
	call <SID>X("scalaSymbol", 'orange', "", "")
	call <SID>X("scalaChar", 'orange', "", "")
	call <SID>X("scalaXml", 'green', "", "")
	call <SID>X("scalaConstructorSpecializer", 'yellow', "", "")
	call <SID>X("scalaBackTick", 'blue', "", "")

	" Git
	call <SID>X("diffAdded", 'green', "", "")
	call <SID>X("diffRemoved", 'red', "", "")
	call <SID>X("gitcommitSummary", "", "", "")

	" Delete Functions
	delf <SID>X
endif

set background=dark
