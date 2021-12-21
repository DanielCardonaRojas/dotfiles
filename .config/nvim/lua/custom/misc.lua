
local M = {}


local isTransparent = false

M.toggleTransparent = function()
  if isTransparent then
    require('colors').init()
  else
    vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  end
  isTransparent = not isTransparent

end

return M
