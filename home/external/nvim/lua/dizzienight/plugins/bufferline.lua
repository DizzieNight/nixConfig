require("bufferline").setup({
    options = {
        mode = "buffers",
        offsets = {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
        },
        indicator = {
            -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'underline',
        },
        color_icons = true,
        globalstatus = true,
    }
})
