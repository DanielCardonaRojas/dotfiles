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


