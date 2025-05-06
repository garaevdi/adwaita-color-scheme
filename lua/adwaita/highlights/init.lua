local M = {}

-- Source: https://github.com/neanias/everforest-nvim/blob/main/lua/everforest/util.lua
-- Licensed under MIT

---@alias Highlight vim.api.keyset.highlight
---@alias Highlights table<string,Highlight>

---@param group string
---@param hl Highlight
function M.generate_highlight(group, hl)
    if not group then
        return
    end

    vim.api.nvim_set_hl(0, group, hl)
end

---@param highlights Highlights
function M.generate_highlights(highlights)
    for group, hl in pairs(highlights) do
        M.generate_highlight(group, hl)
    end
end

---@param palette AdwaitaPalette
---@param config AdwaitaConfig
function M.load(palette, config)
    if vim.g.colors_name then
        vim.cmd([[highlight clear]])
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "adwaita"

    ---@type Highlights
    local highlights = {}
    for _, highlight in ipairs({ "editor" }) do
        local mod = require("adwaita.highlights." .. highlight)
        vim.notify("Loading highlight module... " .. highlight, vim.log.levels.INFO)
        if not mod then
            vim.notify("Couldn't load a module: " .. highlight, vim.log.levels.ERROR)
        end
        highlights = vim.tbl_extend("force", mod.setup(palette, config), highlights)
    end

    M.generate_highlights(highlights)
end

return M
