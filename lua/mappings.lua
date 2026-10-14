require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "Escape" })

map("n", "<leader>ew", ":w<CR>", { noremap = true, silent = true, desc = "Save current file" })
map("n", "<leader>r", ":e!<CR>", { noremap = true, silent = true, desc = "Reload buffer" })
map("n", "ga", "gg<S-v>G", { noremap = true, silent = true, desc = "Select all" })

map("n", "ss", ":split<CR> | <C-w>j", { noremap = true, silent = true, desc = "Split horizontal" })
map("n", "sv", ":vsplit<CR> | <C-w>l", { noremap = true, silent = true, desc = "Split vertical" })
map("n", "sx", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close split" })
map("n", "sw", "<cmd>only<CR>", { noremap = true, silent = true, desc = "Close other splits" })

map("n", "<C-S-l>", "<C-w><5", { noremap = true, silent = true, desc = "Resize window left" })
map("n", "<C-S-h>", "<C-w>>5", { noremap = true, silent = true, desc = "Resize window right" })
map("n", "<C-S-k>", "<C-w>+5", { noremap = true, silent = true, desc = "Resize window up" })
map("n", "<C-S-j>", "<C-w>-5", { noremap = true, silent = true, desc = "Resize window down" })

map("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Reveal file in explorer" })

map("n", "<leader>ll", function() require("conform").format({ lsp_fallback = true }) end, { noremap = true, silent = true, desc = "Format buffer" })

local function grep_path_rank(path)
  if not path then return 50 end
  if path:match("node_modules/") then return 90 end
  if path:match("/dist/") or path:match("/build/") or path:match("/%.next/") or path:match("/%.nuxt/") or path:match("/%.output/") or path:match("/coverage/") then return 80 end
  if path:match("%-lock%.json$") or path:match("%.lock$") or path:match("%.lockb$") then return 75 end
  if path:match("%.min%.js$") or path:match("%.min%.css$") or path:match("%.map$") then return 75 end
  if path:match("%.vue$") or path:match("%.ts$") or path:match("%.tsx$") or path:match("%.js$") or path:match("%.jsx$") or path:match("%.mjs$") or path:match("%.cjs$") then return 10 end
  if path:match("%.scss$") or path:match("%.css$") or path:match("%.html$") then return 20 end
  if path:match("%.json$") or path:match("%.md$") or path:match("%.ya?ml$") then return 35 end
  return 50
end

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({
    additional_args = function() return { "--hidden" } end,
    tiebreak = function(current, existing)
      return grep_path_rank(current.filename) < grep_path_rank(existing.filename)
    end,
  })
end, { noremap = true, silent = true, desc = "Find: grep (smart rank)" })
