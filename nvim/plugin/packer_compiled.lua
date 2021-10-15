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
local package_path_str = "/home/kuba/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/kuba/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/kuba/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/kuba/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kuba/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
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
  ["BufOnly.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/BufOnly.nvim"
  },
  CamelCaseMotion = {
    config = { "\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31lt.plugins.camelcasemotion\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/CamelCaseMotion"
  },
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30lt.plugins.fix-cursorhold\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.snippets\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["TrueZen.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23lt.plugins.truezen\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\1\2>\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["ctrlsf.vim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22lt.plugins.ctrlsf\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26lt.plugins.galaxyline\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  kommentary = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neorg = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21lt.plugins.neorg\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/neorg-telescope"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.neoscroll\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30lt.plugins.nvim-autopairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.nvim-bqf\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "cmp-nvim-lsp", "cmp-nvim-lua", "cmp-buffer", "cmp_luasnip", "cmp-path" },
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.nvim-cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30lt.plugins.nvim-colorizer\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.nvim-gps\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\1\2}\0\0\3\0\t\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0004\2\3\0007\2\4\0027\2\5\0027\2\6\2:\2\b\1>\0\2\1G\0\1\0\14log_level\1\0\0\nDEBUG\vlevels\blog\bvim\rsettings\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-mapper"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27lt.plugins.nvim-mapper\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-mapper"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26lt.plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&lt.plugins.treesitter-textobjects\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/nvim_context_vt"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28lt.plugins.package-info\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23lt.plugins.project\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27lt.plugins.refactoring\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/refactoring.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.telescope\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29lt.plugins.todo-comments\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.twilight\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.fugitive\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27lt.plugins.vim-matchup\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sneak"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21lt.plugins.sneak\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.which-key\frequire\0" },
    loaded = true,
    path = "/home/kuba/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: FixCursorHold.nvim
time([[Config for FixCursorHold.nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30lt.plugins.fix-cursorhold\frequire\0", "config", "FixCursorHold.nvim")
time([[Config for FixCursorHold.nvim]], false)
-- Config for: package-info.nvim
time([[Config for package-info.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28lt.plugins.package-info\frequire\0", "config", "package-info.nvim")
time([[Config for package-info.nvim]], false)
-- Config for: ctrlsf.vim
time([[Config for ctrlsf.vim]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22lt.plugins.ctrlsf\frequire\0", "config", "ctrlsf.vim")
time([[Config for ctrlsf.vim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&lt.plugins.treesitter-textobjects\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: vim-sneak
time([[Config for vim-sneak]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21lt.plugins.sneak\frequire\0", "config", "vim-sneak")
time([[Config for vim-sneak]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.nvim-gps\frequire\0", "config", "nvim-gps")
time([[Config for nvim-gps]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26lt.plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.twilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-mapper
time([[Config for nvim-mapper]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27lt.plugins.nvim-mapper\frequire\0", "config", "nvim-mapper")
time([[Config for nvim-mapper]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26lt.plugins.galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27lt.plugins.vim-matchup\frequire\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: TrueZen.nvim
time([[Config for TrueZen.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23lt.plugins.truezen\frequire\0", "config", "TrueZen.nvim")
time([[Config for TrueZen.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23lt.plugins.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: CamelCaseMotion
time([[Config for CamelCaseMotion]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31lt.plugins.camelcasemotion\frequire\0", "config", "CamelCaseMotion")
time([[Config for CamelCaseMotion]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21lt.plugins.neorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.snippets\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30lt.plugins.nvim-colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-bqf
time([[Config for nvim-bqf]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.nvim-bqf\frequire\0", "config", "nvim-bqf")
time([[Config for nvim-bqf]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.fugitive\frequire\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24lt.plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29lt.plugins.todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\1\2}\0\0\3\0\t\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0004\2\3\0007\2\4\0027\2\5\0027\2\6\2:\2\b\1>\0\2\1G\0\1\0\14log_level\1\0\0\nDEBUG\vlevels\blog\bvim\rsettings\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27lt.plugins.refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25lt.plugins.neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
