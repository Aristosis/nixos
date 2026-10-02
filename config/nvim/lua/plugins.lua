vim.pack.add {
   { src = "https://github.com/nvim-tree/nvim-web-devicons" },
   { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
   { src = "https://github.com/stevearc/oil.nvim" },
   { src = "https://github.com/stevearc/conform.nvim" },
   { src = "https://github.com/nvim-mini/mini.nvim" },
   { src = "https://github.com/neovim/nvim-lspconfig" },
   { src = "https://github.com/lewis6991/gitsigns.nvim" },
   { src = "https://github.com/ibhagwan/fzf-lua" },
   { src = "https://github.com/3rd/image.nvim" },
   { src = "https://github.com/sainnhe/gruvbox-material" },
}

require("image").setup()
require("mini.move").setup()
require("mini.align").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("mini.ai").setup()
require("mini.splitjoin").setup()

require("gitsigns").setup()

local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader><leader>", fzf.files)
vim.keymap.set("n", "<leader>f", fzf.live_grep)
vim.keymap.set("n", "<leader>b", fzf.buffers)
vim.keymap.set("n", "<leader>d", fzf.diagnostics_workspace)
vim.keymap.set("n", "<leader>m", fzf.marks)

require("conform").setup {
   format_on_save = true,
   formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
   },
}

local oil = require("oil")
oil.setup {
   default_file_explorer = true,
   skip_confirm_for_simple_edits = true,
   float = { border = "single", max_width = 0.8, max_height = 0.8 },
   preview_win = { win_options = { number = true } },
}

vim.keymap.set("n", "<leader>-", function()
   oil.toggle_float(nil, { preview = {} })
end)

vim.keymap.set("n", "<leader>_", function()
   oil.toggle_float(vim.fn.getcwd(), { preview = {} })
end)

vim.g.gruvbox_material_transparent_background = 1
vim.cmd.colorscheme("gruvbox-material")
