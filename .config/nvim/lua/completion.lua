local cmp = require("cmp")

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
  mapping = {
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
    ['<Tab>'] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        else
          fallback()
        end
      end
    }),
  }
}

require("nvim-autopairs").setup()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require("cmp").event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
