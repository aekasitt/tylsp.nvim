-- plugin/tylsp.lua --

if not pcall(require, 'lspconfig') or not pcall(require, 'plenary') then
  return
end
require('tylsp').setup()
