local utils = require("adwaita.utils")

local M = {}

---@param palette AdwaitaPalette
---@param config ?AdwaitaConfig
---@return Highlights
function M.setup(palette, config)
    config = config or require("adwaita").config
    local theme
    if config.theme ~= "auto" then
        theme = config.theme
    else
        theme = vim.o.background
    end

    ---@type Highlights
    local highlights = {}
    if theme == "dark" then
        highlights = {
            Normal = { bg = palette.libadwaita_dark_1, fg = palette.light_5 },
            NormalNC = { link = "Normal" },
            StatusLine = { bg = config.flat_toolbar and palette.libadwaita_dark_1 or palette.libadwaita_dark_5, fg = palette.light_5 },
            StatusLineNC = { bg = config.flat_toolbar and palette.libadwaita_dark_1 or palette.libadwaita_dark_2, fg = palette.light_4 },
            WinBar = { bg = config.flat_toolbar and palette.libadwaita_dark_1 or palette.libadwaita_dark_5, fg = palette.light_5 },
            WinBarNC = { bg = config.flat_toolbar and palette.libadwaita_dark_1 or palette.libadwaita_dark_2, fg = palette.light_4 },
            Cursor = { bg = palette.light_5 },
            lCursor = { link = "Cursor" },
            CursorIM = { link = "Cursor" },
            CursorLine = { bg = palette.libadwaita_dark_2 },
            CursorLineNR = { bg = palette.libadwaita_dark_2, fg = palette.dark_1 },
            CursorColumn = { link = "CursorLine" },
            LineNR = { bg = palette.libadwaita_dark_1, fg = palette.dark_2 },
            CurSearch = { bg = palette.yellow_4, fg = palette.dark_5 },
            IncSearch = { bg = palette.yellow_4, fg = palette.dark_5 },
            Search = { bg = utils.blend(palette.yellow_4, 0.3, palette.libadwaita_dark_1) },
            DiffAdd = { bg = palette.teal_3 },
            DiffChange = { bg = palette.orange_3 },
            DiffDelete = { bg = palette.red_1 },
            DiffText = { bg = palette.violet_2 },
            ErrorMsg = {}
        }
    else
        highlights = {
            Normal = { bg = palette.light_1, fg = palette.dark_3 },
            NormalNC = { link = "Normal" },
            StatusLine = { bg = config.flat_toolbar and palette.light_1 or palette.light_4, fg = palette.dark_3 },
            StatusLineNC = { bg = config.flat_toolbar and palette.light_1 or palette.light_4, fg = palette.dark_1 },
            WinBar = { bg = config.flat_toolbar and palette.light_1 or palette.light_4, fg = palette.dark_3 },
            WinBarNC = { bg = config.flat_toolbar and palette.light_1 or palette.light_4, fg = palette.dark_1 },
            Cursor = { bg = palette.dark_1 },
            lCursor = { link = "Cursor" },
            CursorIM = { link = "Cursor" },
            CursorLine = { bg = palette.light_3 },
            CursorLineNR = { bg = palette.light_3, fg = palette.light_7 },
            CursorColumn = { link = "CursorLine" },
            LineNR = { bg = palette.light_1, fg = palette.light_6 },
            IncSearch = { bg = palette.yellow_2, fg = palette.dark_4 },
            CurSearch = { bg = palette.yellow_2, fg = palette.dark_4 },
            Search = { bg = utils.blend(palette.yellow_2, 0.3, palette.light_1) },
            DiffAdd = { bg = palette.teal_4 },
            DiffChange = { bg = palette.orange_4 },
            DiffDelete = { bg = palette.red_1 },
            DiffText = { bg = palette.violet_4 },
        }
    end

    return highlights
end

return M
