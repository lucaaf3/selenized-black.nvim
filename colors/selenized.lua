-- Copyright © 2023 Calin Don. All Rights Reserved.

-- lua port of the selenized color scheme
-- see: https://github.com/jan-warchol/selenized
-- with updated values from https://github.com/jan-warchol/selenized/blob/9efeaac1b95a151d5ada36f17f7c4d5c8c3f0741/the-values.md

_G.selenized = _G.selenized or {}

local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

local background = vim.o.background or 'dark'

local none = 'none'
local colors = {
    dark = {
        bg_0       = '#181818',
        bg_1       = '#252525',
        bg_2       = '#3b3b3b',
        dim_0      = '#777777',
        fg_0       = '#b9b9b9',
        fg_1       = '#dedede',
        bg_15      = '#212121', -- bg_1 12% darker for subtle highlighting of embedded, selectable blocks
        dim_1      = '#958777', -- yellowish dim_0 for things like autocomplete previews
        red        = '#ed4a46',
        green      = '#70b433',
        yellow     = '#dbb32d',
        blue       = '#368aeb',
        magenta    = '#eb6eb7',
        cyan       = '#3fc5b7',
        orange     = '#e67f43',
        violet     = '#a580e2',
        br_red     = '#ff5e56',
        br_green   = '#83c746',
        br_yellow  = '#efc541',
        br_blue    = '#4f9cfe',
        br_magenta = '#ff81ca',
        br_cyan    = '#56d8c9',
        br_orange  = '#fa9153',
        br_violet  = '#b891f5',
    },
    light = {
        bg_0       = '#ffffff',
        bg_1       = '#ebebeb',
        bg_2       = '#cdcdcd',
        dim_0      = '#878787',
        fg_0       = '#474747',
        fg_1       = '#282828',
        dim_1      = '#a59787', -- yellowish dim_0 for things like autocomplete previews
        bg_15      = '#cfcfcf', -- bg_1 12% darker for subtle highlighting of embedded, selectable blocks
        red        = '#d6000c',
        green      = '#1d9700',
        yellow     = '#c49700',
        blue       = '#0064e4',
        magenta    = '#dd0f9d',
        cyan       = '#00ad9c',
        orange     = '#d04a00',
        violet     = '#7f51d6',
        br_red     = '#bf0000',
        br_green   = '#008400',
        br_yellow  = '#af8500',
        br_blue    = '#0054cf',
        br_magenta = '#c7008b',
        br_cyan    = '#009a8a',
        br_orange  = '#ba3700',
        br_violet  = '#6b40c3',
        deep_dark  = '#181818',
    }
}
_G.selenized.color_scheme = colors
_G.selenized.colors = colors[background]

local highlight = function(group, hi)
    hi = hi or {}
    if type(hi) == 'string' then
        cmd.hi(string.format('link %s %s', group, hi))
        return
    end
    local format = ''

    if hi.fg then
        format = format .. ' guifg=' .. hi.fg
    end
    if hi.bg then
        format = format .. ' guibg=' .. hi.bg
    end
    if hi.guisp then
        format = format .. ' guisp=' .. hi.guisp
    end
    if hi.style then
        format = format .. ' gui=' .. hi.style
    end

    cmd.hi(group .. ' ' .. format)
end

---@diagnostic disable-next-line: redefined-local
local highlights = function(colors)
    cmd.hi('clear')
    if fn.exists('syntax_on') then
        cmd.syntax('reset')
    end

    g.colors_name                  = 'selenized'

    g.terminal_color_0             = colors.bg_1
    g.terminal_color_1             = colors.red
    g.terminal_color_2             = colors.green
    g.terminal_color_3             = colors.yellow
    g.terminal_color_4             = colors.blue
    g.terminal_color_5             = colors.magenta
    g.terminal_color_6             = colors.cyan
    g.terminal_color_7             = colors.dim_0
    g.terminal_color_8             = colors.bg_2
    g.terminal_color_9             = colors.br_red
    g.terminal_color_10            = colors.br_green
    g.terminal_color_11            = colors.br_yellow
    g.terminal_color_12            = colors.br_blue
    g.terminal_color_13            = colors.br_magenta
    g.terminal_color_14            = colors.br_cyan
    g.terminal_color_15            = colors.fg_1

    local hi                       = {}
    hi['Normal']                   = { fg = colors.fg_0, bg = colors.bg_0, guisp = none, style = none }

    hi['IncSearch']                = { fg = colors.orange, bg = none, guisp = none, style = 'reverse' }
    hi['Search']                   = { fg = colors.yellow, bg = none, guisp = none, style = 'reverse' }
    hi['QuickFixLine']             = 'Search'
    hi['Visual']                   = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['MatchParen']               = { fg = colors.br_yellow, bg = colors.bg_2, guisp = none, style = 'bold' }
    hi['Cursor']                   = { fg = none, bg = none, guisp = none, style = 'reverse' }
    hi['lCursor']                  = 'Cursor'
    hi['CursorLine']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['CursorColumn']             = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['Folded']                   = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['ColorColumn']              = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['LineNr']                   = { fg = colors.dim_0, bg = colors.bg_1, guisp = none, style = none }
    hi['CursorLineNr']             = { fg = colors.fg_1, bg = colors.bg_1, guisp = none, style = none }
    hi['WinSeparator']             = { fg = colors.dim_0, bg = colors.dim_0, guisp = none, style = none }
    hi['StatusLine']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['StatusLineNC']             = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['StatusLineTerm']           = 'StatusLine'
    hi['StatusLineTermNC']         = 'StatusLineNC'
    hi['TabLineSel']               = { fg = colors.fg_1, bg = colors.bg_2, guisp = none, style = none }
    hi['TabLine']                  = { fg = colors.fg_0, bg = colors.bg_1, guisp = none, style = none }
    hi['TabLineFill']              = { fg = colors.fg_0, bg = colors.bg_1, guisp = none, style = none }
    hi['ToolbarButton']            = { fg = none, bg = none, guisp = none, style = 'reverse' }
    hi['ToolbarLine']              = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['Pmenu']                    = { fg = colors.dim_0, bg = colors.bg_1, guisp = none, style = none }
    hi['PmenuSel']                 = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['PmenuThumb']               = { fg = none, bg = colors.dim_0, guisp = none, style = none }
    hi['PmenuSbar']                = { fg = none, bg = colors.bg_2, guisp = none, style = none }
    hi['DiffAdd']                  = { fg = colors.green, bg = colors.bg_1, guisp = none, style = none }
    hi['DiffChange']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['DiffDelete']               = { fg = colors.red, bg = colors.bg_1, guisp = none, style = none }
    hi['DiffText']                 = { fg = colors.bg_1, bg = colors.yellow, guisp = none, style = none }
    hi['Comment']                  = { fg = colors.dim_0, bg = none, guisp = none, style = 'italic' }
    hi['Constant']                 = { fg = colors.cyan, bg = none, guisp = none, style = none }
    hi['String']                   = 'Constant'
    hi['Number']                   = 'Constant'
    hi['Boolean']                  = 'Constant'
    hi['Character']                = 'Constant'
    hi['Float']                    = 'Constant'
    hi['Identifier']               = { fg = colors.br_blue, bg = none, guisp = none, style = none }
    hi['Function']                 = 'Identifier'
    hi['Statement']                = { fg = colors.br_yellow, bg = none, guisp = none, style = none }
    hi['Conditional']              = 'Statement'
    hi['Repeat']                   = 'Statement'
    hi['Keyword']                  = 'Statement'
    hi['Label']                    = 'Statement'
    hi['Exception']                = 'Statement'
    hi['Operator']                 = 'Statement'
    hi['PreProc']                  = { fg = colors.orange, bg = none, guisp = none, style = none }
    hi['Define']                   = 'PreProc'
    hi['PreCondit']                = 'PreProc'
    hi['Include']                  = 'PreProc'
    hi['Macro']                    = 'Include'
    hi['Type']                     = { fg = colors.green, bg = none, guisp = none, style = none }
    hi['Typedef']                  = 'Type'
    hi['StorageClass']             = 'Type'
    hi['Structure']                = 'Type'
    hi['Special']                  = { fg = colors.red, bg = none, guisp = none, style = none }
    hi['SpecialChar']              = 'Special'
    hi['Delimiter']                = 'Special'
    hi['SpecialComment']           = 'Special'
    hi['Debug']                    = 'Special'
    hi['Tag']                      = 'Special'
    hi['Error']                    = { fg = colors.red, bg = none, guisp = none, style = 'bold' }
    hi['Todo']                     = { fg = colors.magenta, bg = none, guisp = none, style = 'bold' }
    hi['Underlined']               = { fg = colors.violet, bg = none, guisp = none, style = 'underline' }
    hi['Ignore']                   = { fg = colors.bg_2, bg = none, guisp = none, style = none }
    hi['VimCommand']               = { fg = colors.yellow, bg = none, guisp = none, style = none }
    hi['RubyDefine']               = { fg = colors.fg_1, bg = none, guisp = none, style = 'bold' }

    hi['Terminal']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['Conceal']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['Directory']                = { fg = none, bg = none, guisp = none, style = none }
    hi['EndOfBuffer']              = { fg = none, bg = none, guisp = none, style = none }
    hi['ErrorMsg']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['FoldColumn']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['ModeMsg']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['MoreMsg']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['NonText']                  = { fg = none, bg = none, guisp = none, style = none }
    hi['Question']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['SignColumn']               = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['SpecialKey']               = { fg = none, bg = none, guisp = none, style = none }
    hi['SpellBad']                 = { fg = none, bg = none, guisp = colors.red, style = 'undercurl' }
    hi['SpellCap']                 = { fg = none, bg = none, guisp = colors.red, style = 'undercurl' }
    hi['SpellLocal']               = { fg = none, bg = none, guisp = colors.yellow, style = 'undercurl' }
    hi['SpellRare']                = { fg = none, bg = none, guisp = colors.cyan, style = 'undercurl' }
    hi['Title']                    = { fg = none, bg = none, guisp = none, style = none }
    hi['VisualNOS']                = { fg = none, bg = none, guisp = none, style = none }
    hi['WarningMsg']               = { fg = none, bg = none, guisp = none, style = none }
    hi['WildMenu']                 = { fg = none, bg = none, guisp = none, style = none }
    hi['FloatBorder']              = { fg = colors.bg_1, bg = none, guisp = none, style = none }
    hi['NormalFloat']              = { fg = colors.dim_0, bg = colors.bg_0, guisp = none, style = none }
    hi['FloatTitle']               = { fg = colors.dim_0, bg = colors.bg_0, guisp = none, style = none }
    hi['WinBar']                   = { fg = colors.dim_0, bg = colors.bg_0, guisp = none, style = none }

    hi['Suggestion']               = { fg = colors.dim_1, bg = none, guisp = none, style = 'italic' }

    -- vim Copilot
    hi['CopilotSuggestion']        = 'Suggestion'

    -- Built-in diagnostic
    hi['DiagnosticError']          = { fg = colors.red, bg = hi['SignColumn'].bg }
    hi['DiagnosticHint']           = { fg = colors.yellow, bg = hi['SignColumn'].bg }
    hi['DiagnosticInfo']           = { fg = colors.cyan, bg = hi['SignColumn'].bg }
    hi['DiagnosticWarn']           = { fg = colors.cyan, bg = hi['SignColumn'].bg }

    hi['DiagnosticUnderlineError'] = { style = 'underline', guisp = hi['DiagnosticError'].fg }
    hi['DiagnosticUnderlineHint']  = { style = 'underline', guisp = hi['DiagnosticWarn'].fg }
    hi['DiagnosticUnderlineInfo']  = { style = 'underline', guisp = hi['DiagnosticInfo'].fg }
    hi['DiagnosticUnderlineWarn']  = { style = 'underline', guisp = hi['DiagnosticHint'].fg }

    -- Built-in LSP
    hi['LspReferenceText']         = { bg = colors.bg_1 }
    hi['LspReferenceRead']         = 'LspReferenceText'
    hi['LspReferenceWrite']        = 'LspReferenceText'

    hi['LspInfoBorder']            = 'FloatBorder'

    -- nvim-cmp highlight groups
    hi['CmpItemKindClass']         = 'Type'
    hi['CmpItemKindColor']         = 'Special'
    hi['CmpItemKindConstant']      = 'Constant'
    hi['CmpItemKindConstructor']   = 'Type'
    hi['CmpItemKindEnum']          = 'Structure'
    hi['CmpItemKindEnumMember']    = 'Structure'
    hi['CmpItemKindEvent']         = 'Exception'
    hi['CmpItemKindField']         = 'Structure'
    hi['CmpItemKindFile']          = 'Tag'
    hi['CmpItemKindFolder']        = 'Directory'
    hi['CmpItemKindFunction']      = 'Function'
    hi['CmpItemKindInterface']     = 'Structure'
    hi['CmpItemKindKeyword']       = 'Keyword'
    hi['CmpItemKindMethod']        = 'Function'
    hi['CmpItemKindModule']        = 'Structure'
    hi['CmpItemKindOperator']      = 'Operator'
    hi['CmpItemKindProperty']      = 'Structure'
    hi['CmpItemKindReference']     = 'Tag'
    hi['CmpItemKindSnippet']       = 'Special'
    hi['CmpItemKindStruct']        = 'Structure'
    hi['CmpItemKindText']          = 'Statement'
    hi['CmpItemKindTypeParameter'] = 'Type'
    hi['CmpItemKindUnit']          = 'Special'
    hi['CmpItemKindValue']         = 'Identifier'
    hi['CmpItemKindVariable']      = 'Delimiter'
    hi['CmpItemKindCopilot']       = 'Structure'

    -- Git Signs
    hi['GitSignsAdd']              = { fg = colors.green, bg = colors.bg_1 }
    hi['GitSignsDelete']           = { fg = colors.red, bg = colors.bg_1 }
    hi['GitSignsChange']           = { fg = colors.blue, bg = colors.bg_1 }

    hi['ColorColumn']              = { fg = none, bg = colors.bg_1, guisp = none, style = none }
    hi['WinSeparator']             = { fg = colors.bg_2, bg = none, guisp = none, style = 'bold' }

    hi['@variable.builtin']        = { fg = colors.green }
    -- improve HTML and Markdown editing
    hi['@text.emphasis']           = { style = 'italic' }
    hi['@text.strong']             = { style = 'bold' }
    hi['@text.title']              = { fg = colors.fg_1, style = 'bold' }
    hi['@text.literal']            = { bg = colors.bg_1 }
    hi['@text.uri']                = hi['Underlined']
    hi['@text.codeblock']          = { bg = colors.bg_15 }

    for group, highlights in pairs(hi) do
        highlight(group, highlights)
    end
    _G.selenized.colors = colors
end
highlights(colors[background])
