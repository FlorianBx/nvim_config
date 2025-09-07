local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local vscode = require('vscode')

local function vscode_action(action)
  return function()
    vscode.action(action)
  end
end

keymap.set("i", "jj", "<Esc>", opts)

keymap.set("n", "<leader>ew", vscode_action('workbench.action.files.save'), opts)
keymap.set("n", "<Leader>r", vscode_action('workbench.action.files.revert'), opts)

keymap.set("n", "ga", vscode_action('editor.action.selectAll'), opts)

keymap.set("n", "ss", vscode_action('workbench.action.splitEditorDown'), opts)
keymap.set("n", "sv", vscode_action('workbench.action.splitEditorRight'), opts)
keymap.set("n", "sx", vscode_action('workbench.action.closeActiveEditor'), opts)
keymap.set("n", "sw", vscode_action('workbench.action.closeOtherEditors'), opts)

keymap.set("n", "<C-h>", vscode_action('workbench.action.navigateLeft'), opts)
keymap.set("n", "<C-j>", vscode_action('workbench.action.navigateDown'), opts)
keymap.set("n", "<C-k>", vscode_action('workbench.action.navigateUp'), opts)
keymap.set("n", "<C-l>", vscode_action('workbench.action.navigateRight'), opts)

keymap.set("n", "<S-h>", vscode_action('workbench.action.previousEditor'), opts)
keymap.set("n", "<S-l>", vscode_action('workbench.action.nextEditor'), opts)

keymap.set("n", "-", vscode_action('workbench.view.explorer'), opts)

keymap.set("n", "<leader>th", function()
  if vscode.get_config('panelPosition') == 'bottom' then
    vscode.action('workbench.action.positionPanelBottom')
  else
    vscode.action('workbench.action.terminal.split')
  end
end, opts)
keymap.set("n", "<leader>ty", function()
  if vscode.get_config('panelPosition') == 'right' then
    vscode.action('workbench.action.positionPanelRight')
  else
    vscode.action('workbench.action.createTerminalEditor')
  end
end, opts)
keymap.set("n", "<leader>tt", vscode_action('workbench.action.terminal.new'), opts)
keymap.set("n", "<leader>tf", vscode_action('workbench.action.terminal.focus'), opts)
keymap.set("n", "tx", vscode_action('workbench.action.closeActiveEditor'), opts)

keymap.set("n", "<leader>ff", vscode_action('workbench.action.quickOpen'), opts)
keymap.set("n", "<leader>fg", vscode_action('workbench.action.findInFiles'), opts)
keymap.set("n", "<leader>fs", vscode_action('workbench.action.findInFiles'), opts)
keymap.set("n", "<leader>fr", vscode_action('workbench.action.openRecent'), opts)
keymap.set("n", "<leader>fb", vscode_action('workbench.action.showAllEditors'), opts)
keymap.set("n", "<leader>ft", function()
  vscode.action('workbench.action.findInFiles', { query = 'TODO|FIXME|HACK|BUG|NOTE' })
end, opts)

keymap.set("n", "<leader>lg", vscode_action('workbench.view.scm'), opts)

keymap.set("n", "gd", vscode_action('editor.action.revealDefinition'), opts)
keymap.set("n", "gr", vscode_action('editor.action.goToReferences'), opts)
keymap.set("n", "gi", vscode_action('editor.action.goToImplementation'), opts)
keymap.set("n", "<leader>ca", vscode_action('editor.action.quickFix'), opts)
keymap.set("n", "<leader>rn", vscode_action('editor.action.rename'), opts)
keymap.set("n", "K", vscode_action('editor.action.showHover'), opts)

keymap.set("n", "<leader>d", vscode_action('workbench.actions.view.problems'), opts)
keymap.set("n", "[d", vscode_action('editor.action.marker.prevInFiles'), opts)
keymap.set("n", "]d", vscode_action('editor.action.marker.nextInFiles'), opts)

keymap.set("n", "<leader>ll", vscode_action('editor.action.formatDocument'), opts)

keymap.set("n", "<leader>e", vscode_action('workbench.view.explorer'), opts)
keymap.set("n", "<leader>t", vscode_action('workbench.action.terminal.toggleTerminal'), opts)

keymap.set("n", "<leader>gg", vscode_action('workbench.view.scm'), opts)

keymap.set("n", "<leader>nh", vscode_action('removeSecondaryCursors'), opts)

keymap.set("n", "<C-S-l>", vscode_action('workbench.action.increaseViewWidth'), opts)
keymap.set("n", "<C-S-h>", vscode_action('workbench.action.decreaseViewWidth'), opts)
keymap.set("n", "<C-S-k>", vscode_action('workbench.action.increaseViewHeight'), opts)
keymap.set("n", "<C-S-j>", vscode_action('workbench.action.decreaseViewHeight'), opts)

keymap.set("n", "<leader>:", vscode_action('workbench.action.showCommands'), opts)
keymap.set("n", "<leader>p", vscode_action('workbench.action.showCommands'), opts)

local vscode_vue_keymaps = {
  ['<leader>vd'] = 'extension.volar.action.showOutputChannel',
  ['<leader>vr'] = 'extension.volar.action.restartServer',
  ['<leader>vt'] = 'extension.volar.action.showTypeScript',
  ['<leader>vh'] = 'extension.volar.action.showHtmlSource',
  ['<leader>vs'] = 'extension.volar.action.showStyleSource',
}

local vscode_ts_keymaps = {
  ['<leader>tr'] = 'typescript.removeUnusedImports',
  ['<leader>to'] = 'typescript.organizeImports',
  ['<leader>ti'] = 'typescript.addMissingImports',
  ['<leader>tf'] = 'typescript.findAllReferences',
  ['<leader>ts'] = 'typescript.selectTypeScriptVersion',
}

local vscode_diagnostic_keymaps = {
  ['<leader>xx'] = 'workbench.actions.view.problems',
  ['<leader>xw'] = 'workbench.action.problems.focus',
  ['<leader>xl'] = 'editor.action.marker.next',
  ['<leader>xh'] = 'editor.action.marker.prev',
}

for key, action in pairs(vscode_vue_keymaps) do
  keymap.set('n', key, vscode_action(action), opts)
end

for key, action in pairs(vscode_ts_keymaps) do
  keymap.set('n', key, vscode_action(action), opts)
end

for key, action in pairs(vscode_diagnostic_keymaps) do
  keymap.set('n', key, vscode_action(action), opts)
end