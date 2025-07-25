local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities,
})


vim.diagnostic.config( {
  virtual_text = true
})


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'Lsp: ' .. desc })
        end

        local tele = require("telescope.builtin")
        map('gd', tele.lsp_definitions, 'Goto Definition')
        map('<leader>ts', tele.lsp_document_symbols, 'Doc Symbols')
        map('<leader>tS', tele.lsp_dynamic_workspace_symbols, 'Dynamic Symbols')
        map('<leader>tg', tele.lsp_type_definitions, 'Goto Type')
        map('<leader>tr', tele.lsp_references, 'Goto References')
        map('<leader>ti', tele.lsp_implementations, 'Goto Impl')

        map('K', vim.lsp.buf.hover, 'hover')
        map('<leader>E', vim.diagnostic.open_float, 'diagnostic')
        map('<leader>k', vim.lsp.buf.signature_help, 'sig help')
        map('<leader>r', vim.lsp.buf.rename, 'rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'code action')
        map('<leader>w', vim.lsp.buf.format, 'format')

        vim.keymap.set('v',
            '<leader>ca',
            vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Lsp: code_action' })
    end,
})
