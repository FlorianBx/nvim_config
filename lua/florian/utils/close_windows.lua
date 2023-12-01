local function close_left_window()
    -- Save the current window to be able to return to it
    local current_win = vim.api.nvim_get_current_win()
    -- Move focus to the left window
    vim.cmd("wincmd h")
    -- If the focus has changed, close the new window
    if vim.api.nvim_get_current_win() ~= current_win then
      vim.cmd("q")
    end
  end
  
  local function close_right_window()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd l")
    if vim.api.nvim_get_current_win() ~= current_win then
      vim.cmd("q")
    end
  end
  
  local function close_top_window()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd k")
    if vim.api.nvim_get_current_win() ~= current_win then
      vim.cmd("q")
    end
  end
  
  local function close_bottom_window()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd j")
    if vim.api.nvim_get_current_win() ~= current_win then
      vim.cmd("q")
    end
  end
  
  return {
    close_left_window = close_left_window,
    close_right_window = close_right_window,
    close_top_window = close_top_window,
    close_bottom_window = close_bottom_window,
  }