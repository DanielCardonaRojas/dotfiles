-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/decaroj/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/decaroj/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/decaroj/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/decaroj/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/decaroj/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.autosave\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/AutoSave.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.luasnip\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.zenmode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim"
  },
  ["better-escape.vim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18better_escape\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/better-escape.vim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.bufferline\frequire\0" },
    load_after = {
      ["galaxyline.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/bufferline.nvim"
  },
  ["cheatsheet.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.chadsheet\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/cheatsheet.nvim"
  },
  ["dart-vim-plugin"] = {
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/dart-vim-plugin"
  },
  ["dashboard-nvim"] = {
    commands = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave" },
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  extensions = {
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/extensions"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18flutter-tools\frequire\0" },
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim"
  },
  ["galaxyline.nvim"] = {
    after = { "bufferline.nvim" },
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.statusline\frequire\0" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/hop"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14blankline\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14signature\27plugins.configs.others\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\flspkind\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/neoformat"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14neoscroll\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.autopairs\frequire\0" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    after = { "nvim-web-devicons" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\vcolors\frequire\0" },
    load_after = {
      ["packer.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-base16.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14colorizer\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    commands = { "CommentToggle" },
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcomment\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-compe"] = {
    after = { "nvim-autopairs" },
    after_files = { "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.configs.compe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-compe",
    wants = { "LuaSnip" }
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.nvim-dap\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim" },
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.lspconfig\frequire\0" },
    load_after = {
      ["nvim-lspinstall"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    after = { "nvim-lspconfig" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-terminal"] = {
    config = { "\27LJ\2\nX\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18nvim-terminal\frequire\vhidden\6o\bvim\0" },
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/nvim-terminal"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFocus" },
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.nvimtree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    after = { "galaxyline.nvim" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.configs.icons\frequire\0" },
    load_after = {
      ["nvim-base16.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    after = { "nvim-base16.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    after = { "cheatsheet.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\ng\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20start_in_insert\2\17open_mapping\14<leader>;\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/decaroj/.local/share/nvim/site/pack/packer/start/vim-wakatime"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cheatsheet"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: cheatsheet.nvim
time([[Setup for cheatsheet.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14chadsheet\18core.mappings\frequire\0", "setup", "cheatsheet.nvim")
time([[Setup for cheatsheet.nvim]], false)
-- Setup for: TrueZen.nvim
time([[Setup for TrueZen.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\ftruezen\18core.mappings\frequire\0", "setup", "TrueZen.nvim")
time([[Setup for TrueZen.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14telescope\18core.mappings\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: hop
time([[Setup for hop]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bhop\18core.mappings\frequire\0", "setup", "hop")
time([[Setup for hop]], false)
time([[packadd for hop]], true)
vim.cmd [[packadd hop]]
time([[packadd for hop]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14dashboard\18core.mappings\frequire\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: neoformat
time([[Setup for neoformat]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14neoformat\18core.mappings\frequire\0", "setup", "neoformat")
time([[Setup for neoformat]], false)
-- Setup for: better-escape.vim
time([[Setup for better-escape.vim]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18better_escape\18core.mappings\frequire\0", "setup", "better-escape.vim")
time([[Setup for better-escape.vim]], false)
-- Setup for: nvim-dap
time([[Setup for nvim-dap]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rnvim_dap\18core.mappings\frequire\0", "setup", "nvim-dap")
time([[Setup for nvim-dap]], false)
time([[packadd for nvim-dap]], true)
vim.cmd [[packadd nvim-dap]]
time([[packadd for nvim-dap]], false)
-- Setup for: nvim-comment
time([[Setup for nvim-comment]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcomment\18core.mappings\frequire\0", "setup", "nvim-comment")
time([[Setup for nvim-comment]], false)
-- Setup for: bufferline.nvim
time([[Setup for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15bufferline\18core.mappings\frequire\0", "setup", "bufferline.nvim")
time([[Setup for bufferline.nvim]], false)
-- Setup for: telescope-media-files.nvim
time([[Setup for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20telescope_media\18core.mappings\frequire\0", "setup", "telescope-media-files.nvim")
time([[Setup for telescope-media-files.nvim]], false)
time([[packadd for telescope-media-files.nvim]], true)
vim.cmd [[packadd telescope-media-files.nvim]]
time([[packadd for telescope-media-files.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rnvimtree\18core.mappings\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: flutter-tools.nvim
time([[Config for flutter-tools.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18flutter-tools\frequire\0", "config", "flutter-tools.nvim")
time([[Config for flutter-tools.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20start_in_insert\2\17open_mapping\14<leader>;\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-terminal
time([[Config for nvim-terminal]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18nvim-terminal\frequire\vhidden\6o\bvim\0", "config", "nvim-terminal")
time([[Config for nvim-terminal]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.nvim-dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Conditional loads
time("Condition for { 'gitsigns.nvim' }", true)
if
try_loadstring("\27LJ\2\nL\0\0\3\0\4\1\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\b\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\t.git\16isdirectory\afn\bvim\2\0", "condition", '{ "gitsigns.nvim" }')
then
time("Condition for { 'gitsigns.nvim' }", false)
time([[packadd for gitsigns.nvim]], true)
		vim.cmd [[packadd gitsigns.nvim]]
	time([[packadd for gitsigns.nvim]], false)
	-- Config for: gitsigns.nvim
	time([[Config for gitsigns.nvim]], true)
	try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.gitsigns\frequire\0", "config", "gitsigns.nvim")
	time([[Config for gitsigns.nvim]], false)
else
time("Condition for { 'gitsigns.nvim' }", false)
end
time("Condition for { 'AutoSave.nvim' }", true)
if
try_loadstring("\27LJ\2\nv\0\0\3\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0029\0\3\0009\0\4\0009\0\5\0\n\0\2\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\rautosave\vplugin\foptions\16load_config\15core.utils\frequire\0", "condition", '{ "AutoSave.nvim" }')
then
time("Condition for { 'AutoSave.nvim' }", false)
time([[packadd for AutoSave.nvim]], true)
		vim.cmd [[packadd AutoSave.nvim]]
	time([[packadd for AutoSave.nvim]], false)
	-- Config for: AutoSave.nvim
	time([[Config for AutoSave.nvim]], true)
	try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.autosave\frequire\0", "config", "AutoSave.nvim")
	time([[Config for AutoSave.nvim]], false)
else
time("Condition for { 'AutoSave.nvim' }", false)
end

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZFocus lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DashboardNewFile lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardNewFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DashboardJumpMarks lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardJumpMarks", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SessionLoad lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SessionSave lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionSave", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CommentToggle lua require("packer.load")({'nvim-comment'}, { cmd = "CommentToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'LuaSnip'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-lspinstall', 'nvim-treesitter', 'nvim-colorizer.lua', 'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'lspkind-nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au WinScrolled * ++once lua require("packer.load")({'neoscroll.nvim'}, { event = "WinScrolled *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe', 'better-escape.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
