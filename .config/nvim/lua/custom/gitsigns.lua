local present, gitsigns = pcall(require, "gitsigns")
if not present then
   return
end

gitsigns.setup {
   keymaps = {
      -- Default keymap options
      buffer = true,
      noremap = true,
      ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
      ["n <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ["n <leader>gu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ["n <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
   },
   numhl = false,

   sign_priority = 5,
   signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
      changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
   },
   current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
   current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
   },

   status_formatter = nil, -- Use default
   watch_gitdir = {
      interval = 100,
   },
}
