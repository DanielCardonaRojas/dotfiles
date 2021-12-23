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
local package_path_str = "/Users/danielcardonarojas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/danielcardonarojas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/danielcardonarojas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/danielcardonarojas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/danielcardonarojas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["Comment.nvim"] = {
    config = { "require('plugins.configs.others').comment()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "require('plugins.configs.others').luasnip()" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["better-escape.nvim"] = {
    config = { "require('plugins.configs.others').better_escape()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('plugins.configs.bufferline')" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["bufjump.nvim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\fforward\n<C-n>\rbackward\n<C-p>\nsetup\fbufjump\frequire\0" },
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/bufjump.nvim",
    url = "https://github.com/kwkarlwang/bufjump.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-path" },
    after_files = { "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-buffer" },
    after_files = { "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lua" },
    after_files = { "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "require('plugins.configs.dashboard')" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  extensions = {
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/extensions",
    url = "https://github.com/Nvchad/extensions"
  },
  ["feline.nvim"] = {
    config = { "require('plugins.configs.statusline')" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0B\0\1\1K\0\1\0\15lsp_attach\rdebugger\1\0\0\1\0\2\fenabled\2\16run_via_dap\2\nsetup\18flutter-tools\frequire\0" },
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\n‘\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\19 FocusDisable \bcmd\bvim\23excluded_filetypes\1\0\1\15signcolumn\1\1\a\0\0\15toggleterm\fTrouble\rNvimTree\17dapui_scopes\22dapui_breakpoints\17dapui_stacks\nsetup\nfocus\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["friendly-snippets"] = {
    after = { "nvim-cmp" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('custom.gitsigns')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  hop = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/hop",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('plugins.configs.others').blankline()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "require('plugins.configs.others').signature()" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('plugins.configs.others').autopairs()" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    after = { "nvim-web-devicons" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\vcolors\frequire\0" },
    load_after = {
      ["packer.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-base16.lua",
    url = "https://github.com/NvChad/nvim-base16.lua"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "LuaSnip" },
    config = { "require('custom.cmp')" },
    load_after = {
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14configure\15custom.dap\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim" },
    config = { "require('plugins.configs.lspconfig')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    config = { '\27LJ\2\na\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\rNvimTree\15toggleterm\14dashboard"scrollview_excluded_filetypes\6g\bvim\0' },
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFocus" },
    config = { "require('plugins.configs.nvimtree')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('plugins.configs.treesitter')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    after = { "feline.nvim", "bufferline.nvim" },
    config = { "require('plugins.configs.icons')" },
    load_after = {
      ["nvim-base16.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    after = { "nvim-base16.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('custom.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20start_in_insert\2\nsetup\15toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nn\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\15auto_close\2\14auto_open\1\tmode\26workspace_diagnostics\nsetup\ftrouble\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/danielcardonarojas/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^Comment"] = "Comment.nvim",
  ["^telescope"] = "telescope.nvim"
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

-- Setup for: bufferline.nvim
time([[Setup for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15bufferline\18core.mappings\frequire\0", "setup", "bufferline.nvim")
time([[Setup for bufferline.nvim]], false)
-- Setup for: nvim-lspconfig
time([[Setup for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006if &ft == \"packer\" | echo \"\" | else | silent! e %\bcmd\bvimx\1\0\4\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0003\2\6\0)\3\0\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\19nvim-lspconfig\21packer_lazy_load\15core.utils\frequire\0", "setup", "nvim-lspconfig")
time([[Setup for nvim-lspconfig]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rnvimtree\18core.mappings\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: nvim-dap
time([[Setup for nvim-dap]], true)
try_loadstring("\27LJ\2\nÄ\6\0\0\6\0\21\0I6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\a\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\17\0'\4\18\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0004\5\0\0B\0\5\1K\0\1\0-:lua require\"dap.ui.widgets\".hover()<CR>\15<leader>di3:lua require\"debugHelper\".attachToRemote()<CR>\15<leader>dA+:lua require\"debugHelper\".attach()<CR>\15<leader>da=:lua require\"dap\".set_exception_breakpoints({\"all\"})<CR>\15<leader>de::lua require\"dap\".repl.toggle({}, \"vsplit\")<CR><C-w>l\15<leader>dr':lua require\"dap\".step_over() <CR>\15<leader>dj\15<leader>dc&:lua require\"dap\".continue() <CR>\t<F5>/:lua require\"dap\".toggle_breakpoint() <CR>\15<leader>dh\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-dap")
time([[Setup for nvim-dap]], false)
time([[packadd for nvim-dap]], true)
vim.cmd [[packadd nvim-dap]]
time([[packadd for nvim-dap]], false)
-- Setup for: gitsigns.nvim
time([[Setup for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18gitsigns.nvim\21packer_lazy_load\15core.utils\frequire\0", "setup", "gitsigns.nvim")
time([[Setup for gitsigns.nvim]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16vim-matchup\21packer_lazy_load\15core.utils\frequire\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: hop
time([[Setup for hop]], true)
try_loadstring("\27LJ\2\nò\3\0\0\a\0\17\0>'\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0\18\4\0\0'\5\5\0&\4\5\4'\5\6\0004\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0\18\4\0\0'\5\a\0&\4\5\4'\5\b\0004\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0\18\4\0\0'\5\t\0&\4\5\4'\5\n\0004\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0\18\4\0\0'\5\v\0&\4\5\4'\5\f\0004\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0\18\4\0\0'\5\r\0&\4\5\4'\5\14\0004\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0\18\4\0\0'\5\15\0&\4\5\4'\5\16\0004\6\0\0B\1\5\1K\0\1\0\20:HopLineBC <CR>\6k\20:HopLineAC <CR>\6j\21:HopChar1BC <CR>\6F\21:HopChar1AC <CR>\6f\20:HopWordBC <CR>\6b\20:HopWordAC <CR>\6w\6n\20nvim_set_keymap\bapi\bvim\21<leader><leader>\0", "setup", "hop")
time([[Setup for hop]], false)
time([[packadd for hop]], true)
vim.cmd [[packadd hop]]
time([[packadd for hop]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14telescope\18core.mappings\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: trouble.nvim
time([[Setup for trouble.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\24:TroubleToggle <CR>\15<leader>ll\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "trouble.nvim")
time([[Setup for trouble.nvim]], false)
time([[packadd for trouble.nvim]], true)
vim.cmd [[packadd trouble.nvim]]
time([[packadd for trouble.nvim]], false)
-- Setup for: nvim-dap-ui
time([[Setup for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2(:lua require(\"dapui\").toggle() <CR>\15<leader>dd\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-dap-ui")
time([[Setup for nvim-dap-ui]], false)
time([[packadd for nvim-dap-ui]], true)
vim.cmd [[packadd nvim-dap-ui]]
time([[packadd for nvim-dap-ui]], false)
-- Setup for: Comment.nvim
time([[Setup for Comment.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\6\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\fcomment\18core.mappings\17Comment.nvim\21packer_lazy_load\15core.utils\frequire\0", "setup", "Comment.nvim")
time([[Setup for Comment.nvim]], false)
-- Setup for: toggleterm.nvim
time([[Setup for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n÷\4\0\0\6\0\19\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\r\0'\3\n\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\v\0005\5\17\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\r\0'\3\16\0'\4\14\0005\5\18\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\1\0\2\fnoremap\2\vsilent\2\n<c-_>\1\0\2\fnoremap\2\vsilent\2D <c-\\><c-n><cmd>lua require('custom.toggleterm').devterm()<CR> \6t\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('custom.toggleterm').devterm()<CR>\n<c-x>\1\0\2\fnoremap\2\vsilent\0025<cmd>lua require('custom.toggleterm').lzgc()<CR>\15<leader>gG\1\0\2\fnoremap\2\vsilent\0024<cmd>lua require('custom.toggleterm').lzg()<CR>\15<leader>gg\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "toggleterm.nvim")
time([[Setup for toggleterm.nvim]], false)
-- Setup for: focus.nvim
time([[Setup for focus.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\26:FocusMaxOrEqual <CR>\v<c-w>=\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "focus.nvim")
time([[Setup for focus.nvim]], false)
time([[packadd for focus.nvim]], true)
vim.cmd [[packadd focus.nvim]]
time([[packadd for focus.nvim]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14dashboard\18core.mappings\frequire\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
time([[packadd for dashboard-nvim]], true)
vim.cmd [[packadd dashboard-nvim]]
time([[packadd for dashboard-nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\15auto_close\2\14auto_open\1\tmode\26workspace_diagnostics\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14configure\15custom.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: bufjump.nvim
time([[Config for bufjump.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\fforward\n<C-n>\rbackward\n<C-p>\nsetup\fbufjump\frequire\0", "config", "bufjump.nvim")
time([[Config for bufjump.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: flutter-tools.nvim
time([[Config for flutter-tools.nvim]], true)
try_loadstring("\27LJ\2\n\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0B\0\1\1K\0\1\0\15lsp_attach\rdebugger\1\0\0\1\0\2\fenabled\2\16run_via_dap\2\nsetup\18flutter-tools\frequire\0", "config", "flutter-tools.nvim")
time([[Config for flutter-tools.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\n‘\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\19 FocusDisable \bcmd\bvim\23excluded_filetypes\1\0\1\15signcolumn\1\1\a\0\0\15toggleterm\fTrouble\rNvimTree\17dapui_scopes\22dapui_breakpoints\17dapui_stacks\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: nvim-scrollview
time([[Config for nvim-scrollview]], true)
try_loadstring('\27LJ\2\na\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\rNvimTree\15toggleterm\14dashboard"scrollview_excluded_filetypes\6g\bvim\0', "config", "nvim-scrollview")
time([[Config for nvim-scrollview]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require('plugins.configs.dashboard')
time([[Config for dashboard-nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'telescope.nvim', 'toggleterm.nvim', 'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'friendly-snippets', 'better-escape.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
