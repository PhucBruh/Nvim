if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here

  vim.o.guifont = "Iosevka Nerd Font:h13" -- text below applies for VimScript
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0

  -- padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- Helper function for transparency formatting
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- Helper function for transparency formatting
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- vim.g.neovide_transparency = 0.95
  -- vim.g.transparency = 0.95

  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 3.0
  vim.g.neovide_floating_blur_amount_y = 3.0

  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.5

  vim.g.neovide_cursor_vfx_mode = "sonicboom"

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_underline_stroke_scale = 1.2

  if vim.g.GtkGuiLoaded then vim.g.NVIM_GTK_NO_HEADERBAR = 1 end
end

vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = "NVIM"

vim.o.foldcolumn = "2"
