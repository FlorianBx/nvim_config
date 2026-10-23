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

-- build output, deps and generated files that pollute front search results
local noise_dirs = {
  "node_modules", ".git", "dist", "build", "coverage", ".next", ".nuxt", ".output",
  ".cache", ".turbo", ".vite", "storybook-static", "__snapshots__",
}
local noise_files = {
  "*.min.js", "*.min.css", "*.map", "*.lockb",
  "package-lock.json", "pnpm-lock.yaml", "yarn.lock",
}

-- backend code (Drupal, Symfony, service-ctu back) hidden from front search
vim.list_extend(noise_dirs, { "backend", "back", "symfony", "vendor", "var" })
vim.list_extend(noise_files, {
  "*.php", "*.inc", "*.module", "*.install", "*.info", "*.theme", "*.test",
  "*.po", "*.pot", "*.twig", "*.proto", "*.neon",
})

local function rg_noise_globs()
  local args = {}
  for _, dir in ipairs(noise_dirs) do table.insert(args, "--glob=!**/" .. dir .. "/**") end
  for _, file in ipairs(noise_files) do table.insert(args, "--glob=!" .. file) end
  return args
end

local function fd_noise_excludes()
  local args = {}
  for _, pattern in ipairs(vim.list_extend(vim.list_extend({}, noise_dirs), noise_files)) do
    vim.list_extend(args, { "--exclude", pattern })
  end
  return args
end

local function grep(extra_args, title)
  require("telescope.builtin").live_grep({
    prompt_title = title,
    additional_args = function() return extra_args end,
    tiebreak = function(current, existing)
      return grep_path_rank(current.filename) < grep_path_rank(existing.filename)
    end,
  })
end

local function find_files(extra_args, title)
  require("telescope.builtin").find_files({
    prompt_title = title,
    find_command = vim.list_extend({ "fd", "--type", "f", "--hidden", "--color", "never" }, extra_args),
  })
end

map("n", "<leader>fg", function()
  grep(vim.list_extend({ "--hidden" }, rg_noise_globs()), "Grep (front)")
end, { noremap = true, silent = true, desc = "Find: grep front, no noise" })

map("n", "<leader>fgf", function()
  grep({ "--hidden", "--no-ignore", "--glob=!**/.git/**" }, "Grep (full)")
end, { noremap = true, silent = true, desc = "Find: grep full, with node_modules" })

map("n", "<leader>ff", function()
  find_files(fd_noise_excludes(), "Files (front)")
end, { noremap = true, silent = true, desc = "Find: files front, no noise" })

map("n", "<leader>fff", function()
  find_files({ "--no-ignore", "--exclude", ".git" }, "Files (full)")
end, { noremap = true, silent = true, desc = "Find: files full, with node_modules" })
