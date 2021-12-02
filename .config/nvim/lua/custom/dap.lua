local M = {}
local dap = require('dap')

M.configure = function() 
  -- dap.adapters.dart = {
  --   type = "executable",
  --   command = "node",
  --   args = {"~/Dart-Code/out/dist/debug.js", "flutter"}
  -- }
  -- dap.configurations.dart = {
  --   {
  --     type = "dart",
  --     request = "launch",
  --     name = "Launch flutter",
  --     dartSdkPath = os.getenv('HOME').."/fvm/default/bin/cache/dart-sdk/",
  --     flutterSdkPath = os.getenv('HOME').."/fvm/default/",
  --     -- program = "${workspaceFolder}/lib/main.dart",
  --     -- cwd = "${workspaceFolder}",
  --   }
  -- }

end

return M
