local M = {}

function M.configure()
    local builders = {
        dart = function(cmd) 
          print('>>> dart dap cmd: ' .. cmd[2] .. ' ' .. cmd[3] .. ' ' .. cmd[4])
          return {
            dap = {
              type = "dart",
              request = "launch",
              name = "Launch flutter",
              dartSdkPath = os.getenv('HOME').."/fvm/default/bin/cache/dart-sdk/",
              flutterSdkPath = os.getenv('HOME').."/fvm/default/",
              -- program = "${workspaceFolder}/lib/main.dart",
              -- cwd = "${workspaceFolder}",
            }
          }
        end, 
        python = function(cmd)
            local non_modules = {"python", "pipenv", "poetry"}

            local module_index
            if vim.tbl_contains(non_modules, cmd[1]) then
                module_index = 3
            else
                module_index = 1
            end

            local args = vim.list_slice(cmd, module_index + 1)

            return {
                dap = {
                    type = "python",
                    name = "Ultest Debugger",
                    request = "launch",
                    module = cmd[module_index],
                    args = args,
                    justMyCode = false
                }
            }
        end,
    }
    require("ultest").setup({builders = builders})
end

return M
