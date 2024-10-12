vim.cmd [[
  highlight CmpItemAbbr guibg=NONE guifg=#ffffff  
  highlight CmpItemAbbrMatch guibg=NONE guifg=#ffcc00 
  highlight CmpItemKind guibg=NONE guifg=#a0a0a0 
  highlight CmpItemMenu guibg=NONE guifg=#888888
  highlight CmpItemSelected guibg=#3b3b3b guifg=#ffffff
]]
vim.o.pumblend = 20
vim.o.pumblend = 20


require('mason').setup()
require('mason-lspconfig').setup({
	enusure_installed={
		"lua_ls",
		"rust_analyzer"
	}
})

local lsp = require('lspconfig')
lsp.lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = {
				globals = {"vim"}
			}
		}
	}
}

local servers = {'clangd', 'rust_analyzer', 'pyright'}
local cap = require('cmp_nvim_lsp').default_capabilities()

for _, srv in ipairs(servers) do
	lsp[srv].setup{
		capabilities = cap,
	}
end


local on_attach = function(_client, bufrn)
	local opt = {buffer=bufrn, remap=false}
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opt)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opt)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opt)
	vim.keymap.set('n', 'gi', require('telescope.nvim').lsp_references, opt)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opt)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end

local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup{
	snippet = {
		expand = function (args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4), -- UP
		['<C-d>'] = cmp.mapping.scroll_docs(4), -- DOWN
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
		  behavior = cmp.ConfirmBehavior.Replace,
		  select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}


vim.diagnostic.config({
    virtual_text = true
})
