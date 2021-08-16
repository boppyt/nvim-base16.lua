local nvim = require 'nvim'

local function highlight(group, guifg, guibg, attr, guisp)
	local parts = {group}
	if guifg then table.insert(parts, "guifg=#"..guifg) end
	if guibg then table.insert(parts, "guibg=#"..guibg) end
	if attr then
		table.insert(parts, "gui="..attr)
	end
	if guisp then table.insert(parts, "guisp=#"..guisp) end

	-- nvim.ex.highlight(parts)
	vim.api.nvim_command('highlight '..table.concat(parts, ' '))
end

-- Modified from https://github.com/chriskempson/base16-vim
local function apply_base16_theme(theme)

	-- Neovim terminal colours
	if nvim.fn.has("nvim") then
		nvim.g.terminal_color_0 =  "#"..theme.base00
		nvim.g.terminal_color_1 =  "#"..theme.base08
		nvim.g.terminal_color_2 =  "#"..theme.base0B
		nvim.g.terminal_color_3 =  "#"..theme.base0A
		nvim.g.terminal_color_4 =  "#"..theme.base0D
		nvim.g.terminal_color_5 =  "#"..theme.base0E
		nvim.g.terminal_color_6 =  "#"..theme.base0C
		nvim.g.terminal_color_7 =  "#"..theme.base05
		nvim.g.terminal_color_8 =  "#"..theme.base03
		nvim.g.terminal_color_9 =  "#"..theme.base08
		nvim.g.terminal_color_10 = "#"..theme.base0B
		nvim.g.terminal_color_11 = "#"..theme.base0A
		nvim.g.terminal_color_12 = "#"..theme.base0D
		nvim.g.terminal_color_13 = "#"..theme.base0E
		nvim.g.terminal_color_14 = "#"..theme.base0C
		nvim.g.terminal_color_15 = "#"..theme.base07
		if nvim.o.background == "light" then
			nvim.g.terminal_color_background = "#"..theme.base05
			nvim.g.terminal_color_foreground = "#"..theme.base0B
		else
			nvim.g.terminal_color_background = "#"..theme.base00
			nvim.g.terminal_color_foreground = "#"..theme.base0E
		end
	end

	-- TODO
	-- nvim.command "hi clear"
	-- nvim.command "syntax reset"

	-- Vim editor colors
	highlight("Normal",        theme.base05, theme.base00,  nil, nil)
	highlight("Bold",          nil, nil, "bold", nil)
	highlight("Debug",         theme.base08, nil, nil, nil)
	highlight("Directory",     theme.base0D, nil, nil, nil)
	highlight("Error",         theme.base00, theme.base08, nil, nil)
	highlight("ErrorMsg",      theme.base08, theme.base00, nil, nil)
	highlight("Exception",     theme.base08, nil, nil, nil)
	highlight("FoldColumn",    theme.base0C, theme.base01, nil, nil)
	highlight("Folded",        theme.base03, theme.base01, nil, nil)
	highlight("IncSearch",     theme.base01, theme.base09, "none", nil)
	highlight("Italic",        nil, nil, "none", nil)
	highlight("Macro",         theme.base08, nil, nil, nil)
	highlight("MatchParen",    nil, theme.base03, nil,  nil)
	highlight("ModeMsg",       theme.base0B, nil, nil, nil)
	highlight("MoreMsg",       theme.base0B, nil, nil, nil)
	highlight("Question",      theme.base0D, nil, nil, nil)
	highlight("Search",        theme.base01, theme.base0A, nil, nil)
	highlight("Substitute",    theme.base01, theme.base0A, "none", nil)
	highlight("SpecialKey",    theme.base03, nil, nil, nil)
	highlight("TooLong",       theme.base08, nil, nil, nil)
	highlight("Underlined",    theme.base08, nil, nil, nil)
	highlight("Visual",        nil, theme.base02, nil, nil)
	highlight("VisualNOS",     theme.base08, nil, nil, nil)
	highlight("WarningMsg",    theme.base08, nil, nil, nil)
	highlight("WildMenu",      theme.base08, theme.base0A,  nil, nil)
	highlight("Title",         theme.base0D, nil,  "none", nil)
	highlight("Conceal",       theme.base0D, theme.base00, nil, nil)
	highlight("Cursor",        theme.base00, theme.base05, nil, nil)
	highlight("NonText",       theme.base03, nil,nil, nil)
	highlight("LineNr",        theme.base03, "NONE", nil, nil)
	highlight("SignColumn",    theme.base03, "NONE", nil, nil)
	highlight("StatusLine",    theme.base04, theme.base02, "none", nil)
	highlight("StatusLineNC",  theme.base03, "NONE", "none", nil)
	highlight("VertSplit",     theme.base02, "NONE", "none", nil)
	highlight("ColorColumn",   nil, theme.base01,  "none", nil)
	highlight("CursorColumn",  nil, theme.base01,  "none", nil)
	highlight("CursorLine",    nil, theme.base01,  "none", nil)
	highlight("CursorLineNr",  theme.base04, "NONE",  nil, nil)
	highlight("QuickFixLine",  nil, theme.base01, "none", nil)
	highlight("PMenu",         theme.base05, theme.base01, "none", nil)
	highlight("PMenuSel",      theme.base01, theme.base05, nil, nil)
	highlight("TabLine",       theme.base03, theme.base01, "none", nil)
	highlight("TabLineFill",   theme.base03, theme.base01, "none", nil)
	highlight("TabLineSel",    theme.base0B, theme.base01, "none", nil)

	-- Diff highlighting
	highlight("DiffAdd",      theme.base0B, theme.base01,  nil, nil)
	highlight("DiffChange",   theme.base03, theme.base01,  nil, nil)
	highlight("DiffDelete",   theme.base08, theme.base01,  nil, nil)
	highlight("DiffText",     theme.base0D, theme.base01,  nil, nil)
	highlight("DiffAdded",    theme.base0B, theme.base00,  nil, nil)
	highlight("DiffFile",     theme.base08, theme.base00,  nil, nil)
	highlight("DiffNewFile",  theme.base0B, theme.base00,  nil, nil)
	highlight("DiffLine",     theme.base0D, theme.base00,  nil, nil)
	highlight("DiffRemoved",  theme.base08, theme.base00,  nil, nil)

	-- Git highlighting
	highlight("gitcommitOverflow",       theme.base08, nil, nil, nil)
	highlight("gitcommitSummary",        theme.base0B, nil, nil, nil)
	highlight("gitcommitComment",        theme.base03, nil, nil, nil)
	highlight("gitcommitUntracked",      theme.base03, nil, nil, nil)
	highlight("gitcommitDiscarded",      theme.base03, nil, nil, nil)
	highlight("gitcommitSelected",       theme.base03, nil, nil, nil)
	highlight("gitcommitHeader",         theme.base0E, nil, nil, nil)
	highlight("gitcommitSelectedType",   theme.base0D, nil, nil, nil)
	highlight("gitcommitUnmergedType",   theme.base0D, nil, nil, nil)
	highlight("gitcommitDiscardedType",  theme.base0D, nil, nil, nil)
	highlight("gitcommitBranch",         theme.base09, nil, "bold", nil)
	highlight("gitcommitUntrackedFile",  theme.base0A, nil, nil, nil)
	highlight("gitcommitUnmergedFile",   theme.base08, nil, "bold", nil)
	highlight("gitcommitDiscardedFile",  theme.base08, nil, "bold", nil)
	highlight("gitcommitSelectedFile",   theme.base0B, nil, "bold", nil)

	-- Mail highlighting
	highlight("mailQuoted1",  theme.base0A, nil, nil, nil)
	highlight("mailQuoted2",  theme.base0B, nil, nil, nil)
	highlight("mailQuoted3",  theme.base0E, nil, nil, nil)
	highlight("mailQuoted4",  theme.base0C, nil, nil, nil)
	highlight("mailQuoted5",  theme.base0D, nil, nil, nil)
	highlight("mailQuoted6",  theme.base0A, nil, nil, nil)
	highlight("mailURL",      theme.base0D, nil, nil, nil)
	highlight("mailEmail",    theme.base0D, nil, nil, nil)

	-- Markdown highlighting
	highlight("markdownCode",              theme.base0B, nil, nil, nil)
	highlight("markdownError",             theme.base05, theme.base00, nil, nil)
	highlight("markdownCodeBlock",         theme.base0B, nil, nil, nil)
	highlight("markdownHeadingDelimiter",  theme.base0D, nil, nil, nil)

	-- Spelling highlighting
	highlight("SpellBad",     nil, nil, "undercurl", theme.base08)
	highlight("SpellLocal",   nil, nil, "undercurl", theme.base0C)
	highlight("SpellCap",     nil, nil, "undercurl", theme.base0D)
	highlight("SpellRare",    nil, nil, "undercurl", theme.base0E)

        -- LspDiagnostic base highlight group
	highlight("LspDiagnosticsDefaultError",       theme.base08, nil, nil, nil)
	highlight("LspDiagnosticsDefaultWarning",     theme.base0A, nil, nil, nil)
	highlight("LspDiagnosticsDefaultInformation", theme.base0D, nil, nil, nil)
	highlight("LspDiagnosticsDefaultHint",        theme.base0C, nil, nil, nil)

        -- treesitter
        highlight('TSNone',               theme.base05, theme.base00,  nil, nil)
        highlight('TSPunctDelimiter',     theme.base07, nil,  nil, nil)
        highlight('TSPunctBracket',       theme.base08, nil,  nil, nil)
        highlight('TSPunctSpecial',       theme.base0F, nil,  nil, nil)
        highlight('TSConstant',           theme.base09, nil,  "bold", nil)
        highlight('TSConstBuiltin',       theme.base0C, nil,  nil, nil)
        highlight('TSConstMacro',         theme.base0E, nil,  "none", nil)
        highlight('TSString',             theme.base0B, nil,  nil, nil)
        highlight('TSStringRegex',        theme.base0B, nil,  nil, nil)
        highlight('TSStringEscape',       theme.base0F, nil,  nil, nil)
        highlight('TSCharacter',          theme.base08, nil,  nil, nil)
        highlight('TSNumber',             theme.base0B, nil,  nil, nil)
        highlight('TSBoolean',            theme.base0B, nil,  "bold", nil)
        highlight('TSFloat',              theme.base0B, nil,  nil, nil)
        highlight('TSFunction',           theme.base0D, nil,  "bold", nil)
        highlight('TSFuncBuiltin',        theme.base0C, nil,  nil, nil)
        highlight('TSFuncMacro',          theme.base08, nil,  nil, nil)
        highlight('TSParameter',          theme.base08, nil,  "none", nil)
        highlight('TSParameterReference', theme.base08, nil,  "none", nil)
        highlight('TSMethod',             theme.base0D, nil,  "bold", nil)
        highlight('TSField',              theme.base0A, nil,  "none", nil)
        highlight('TSProperty',           theme.base08, nil,  "none", nil)
        highlight('TSConstructor',        theme.base0C, nil,  nil, nil)
        highlight('TSAnnotation',         theme.base0A, nil,  nil, nil)
        highlight('TSAttribute',          theme.base0A, nil,  nil, nil)
        highlight('TSNamespace',          theme.base0D, nil,  nil, nil)
        highlight('TSConditional',        theme.base0E, nil,  nil, nil)
        highlight('TSRepeat',             theme.base0A, nil,  nil, nil)
        highlight('TSLabel',              theme.base0A, nil,  nil, nil)
        highlight('TSOperator',           theme.base07, nil,  "none", nil)
        highlight('TSKeyword',            theme.base0E, nil,  nil, nil)
        highlight('TSKeywordFunction',    theme.base0E, nil,  "bold", nil)
        highlight('TSKeywordOperator',    theme.base05, nil,  "none", nil)
        highlight('TSException',          theme.base08, nil,  nil, nil)
        highlight('TSType',               theme.base0A, nil,  "bold", nil)
        highlight('TSTypeBuiltin',        theme.base0A, nil,  "bold", nil)
        highlight('TSInclude',            theme.base0D, nil,  nil, nil)
        highlight('TSVariableBuiltin',    theme.base0C, nil,  nil, nil)
        highlight('TSText',               theme.base05, theme.base00, nil, nil)
        highlight('TSStrong',             theme.base07, theme.base00, "bold", nil)
        highlight('TSEmphasis',           theme.base06, theme.base00, "italic", nil)
        highlight('TSUnderline',          theme.base05, theme.base00, "underline", nil)
        highlight('TSTitle',              theme.base0D, nil,  "none", nil)
        highlight('TSLiteral',            theme.base0B, nil,  nil, nil)
        highlight('TSURI',                theme.base08, nil,  nil, nil)
        highlight('TSTag',                theme.base0A, nil,  nil, nil)
        highlight('TSTagDelimiter',       theme.base0F, nil,  nil, nil)
        highlight('TSDefinitionUsage',    nil, theme.base02,  nil, nil)
        highlight('TSDefinition',         theme.base01, theme.base0A,  nil, nil)
        highlight('TSCurrentScope',       nil, theme.base01, "none", nil)

	-- TODO
	-- nvim.command 'syntax on'
end

return setmetatable({
	themes = function(name)
            name = "themes/" .. name .. "-base16"
            local present, theme_array = pcall(require, name)
            if present then
                return theme_array
            else
                error("No such base16 theme: " .. name)
            end
        end,
	apply_theme = apply_base16_theme,
	theme_from_array = function(array)
		assert(#array == 16, "base16.theme_from_array: The array length must be 16")
		local result = {}
		for i, value in ipairs(array) do
			assert(#value == 6, "base16.theme_from_array: array values must be in 6 digit hex format, e.g. 'ffffff'")
			local key = ("base%02X"):format(i - 1)
			result[key] = value
		end
		return result
	end
}, {
	__call = function (_, ...)
		apply_base16_theme(...)
	end,
})
