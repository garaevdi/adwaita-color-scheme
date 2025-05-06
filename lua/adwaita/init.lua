local M = {}

local highlights = require("adwaita.highlights")
M.palette = require("adwaita.palette")


---@alias TextStyle { italic: boolean, bold: boolean, underline: boolean}

---@class AdwaitaConfig
---@filed comments_style TextStyle | nil
---@filed functions_style TextStyle | nil
---@filed keyword_style TextStyle | nil
---@filed statement_style TextStyle | nil
---@filed type_style TextStyle | nil
---@field transparent ?boolean
---@field dim_inactive ?boolean
---@field flat_toolbar ?boolean
---@filed theme "auto" | "dark" | "light" | nil
M.config = {
    comments_style = { italic = true },
    functions_style = {},
    keyword_style = { italic = true },
    statement_style = { bold = true },
    type_style = {},
    transparent = false,
    dim_inactive = false,
    flat_toolbar = true,
    theme = "auto"
}

---@param opts AdwaitaConfig | nil
function M.setup(opts)
    M.config = vim.tbl_extend("force", M.config, opts or {})
end

function M.load()
    local palette = M.palette
    highlights.load(palette, M.config)
end

M.colorscheme = M.load

return M
