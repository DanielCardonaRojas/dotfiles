lua << EOF
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = {os.getenv('HOME').."development/out/dist/debug.js", "flutter"}
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = os.getenv('HOME').."/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = os.getenv('HOME').."/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  }
}


vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
EOF

nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dk :lua require'dap'.step_out()<CR>
nnoremap <leader>dl :lua require'dap'.step_into()<CR>
nnoremap <leader>dj :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.close()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <F5> :lua require'dap'.continue()<CR>
nnoremap <leader>dK :lua require'dap'.up()<CR>
nnoremap <leader>dJ :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.close()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>

nnoremap <leader>df :Telescope dap frames<CR>
nnoremap <leader>dc :Telescope dap commands<CR>
nnoremap <leader>db :Telescope dap list_breakpoints<CR>
