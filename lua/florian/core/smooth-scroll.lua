local M = {}

local last_time = 0
local rapid_threshold = 100
local scroll_mode = false
local timer = nil

local function enable_scroll_mode()
  if scroll_mode then return end
  scroll_mode = true
  
  vim.b.miniindentscope_disable = true
end

local function disable_scroll_mode()
  if not scroll_mode then return end
  scroll_mode = false
  
  vim.b.miniindentscope_disable = false
end

local function handle_movement()
  local current_time = vim.uv.hrtime() / 1000000
  
  if current_time - last_time < rapid_threshold then
    enable_scroll_mode()
    
    if timer then
      timer:stop()
    end
    
    timer = vim.defer_fn(function()
      disable_scroll_mode()
    end, 300)
  end
  
  last_time = current_time
end

vim.keymap.set("n", "j", function()
  handle_movement()
  return "j"
end, { expr = true, silent = true })

vim.keymap.set("n", "k", function()
  handle_movement()
  return "k"
end, { expr = true, silent = true })

return M