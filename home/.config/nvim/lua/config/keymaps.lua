-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local vim = vim

vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-s>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<leader>n", "nzzzv")
-- vim.keymap.set("n", "<leader>m", "Nzzzv")

--[[vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)--]]

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-z>", "<Esc>")
--godly telescope remaps
-- vim.keymap.set("n", "\"", ":Telescope registers<CR>")
-- vim.keymap.set("n", "<leader>rb", ":Telescope buffers<CR>")

-- vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("v", "ccb", ":|%s/\\%V./&/g")
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/AppData/Local/nvim/lua/The Vanguard/lazy.lua<CR>")
-- vim.keymap.set("n", "km", "<cmd>e ~/AppData/Local/nvim/lua/The Vanguard/carzyconfig/remap.lua<CR>")
-- vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)
--cmake nightmare
-- vim.keymap.set("n", "cm", ":w<CR><C-w>v<C-w>12><C-w>l:term<CR>|irm -rf build<CR>cmake -H. -Bbuild<CR>")
-- vim.keymap.set("t", "<C-x>", "cmake --build build<CR>")
-- vim.keymap.set("t", "<C-k>", "build\\debug\\a.exe<CR>")
vim.keymap.set("t", "1`", "<C-\\><C-n>:bd! %<CR>")
vim.keymap.set("n", "1`", ":bd! %<CR>")

vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Left>", "<C-w>h")

--for compiling
vim.keymap.set(
  "n",
  "pyy",
  ':w <CR><C-w>v<C-w>l:term<CR><C-w>h:redir @a<CR>:!echo %<CR>:redir END<CR>:tabnew<CR>"apjjwwve"zy:bd!<CR><C-w>l12<C-w><ipython .py<Left><Left><Left><C-\\><C-n>"zpi<CR>',
  { silent = true }
)
vim.keymap.set(
  "n",
  "py",
  ':w <CR>:redir @a<CR>:!echo %<CR>:redir END<CR>:tabnew<CR>"apjjwwve"zy:bd!<CR><C-w>lipython .py<Left><Left><Left><C-\\><C-n>"zpi<CR>',
  { silent = true }
)
vim.keymap.set("n", "pz", ':redir @a<CR>:!echo %<CR>:redir END<CR>:tabnew<CR>"apjjwwve"zy:bd!<CR>')
-- vim.keymap.set(
--   "n",
--   "cpp",
--   ':w <bar> !c++ "%" -o "C:/Users/Prajwal/OneDrive/Desktop/new/Newfolder/nvimoutput/a.exe"<CR><CR><C-w>li<ESC>a.exe<CR>',
--   { silent = true }
-- )
vim.keymap.set("n", "sh", ':w <bar> !chmod +x "%" && source "%"<CR>', { silent = true })
-- vim.keymap.set(
--   "n",
--   "c!",
--   ':w <bar> !gcc "%" -o "C:/Users/Prajwal/OneDrive/Desktop/new/Newfolder/nvimoutput/a.exe" -lncursesw -DNCURSES_STATIC <CR>'
-- )
-- vim.keymap.set("n", "!^", "<C-w>lia.exe<CR>")
-- vim.keymap.set(
--   "n",
--   "jv",
--   ':w <bar> !javac -d "C:/Users/Prajwal/OneDrive/Desktop/new/Newfolder/nvimoutput/" "%"<CR> <C-w>lijava ',
--   { silent = true }
-- )

vim.keymap.set("n", "zz", ":norm! Vyp<CR>_wwwRj<C-[>wwwwRj<C-[>wwwwRj<C-[>$a<CR>}<CR>}<C-[>Vkkk=jo")
-- for(int i=0;i<3;i++){

vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
vim.keymap.set("n", "r", "<C-r>") --redo
vim.keymap.set("n", "<leader><leader>", ":w<CR>")
vim.keymap.set("n", "n", ":n<CR>")
vim.keymap.set("n", "m", ":N<CR>")
vim.keymap.set({ "n", "v" }, "<leader>x", '"_x') --delete but not to register
vim.keymap.set("n", "<leader>w", "<C-w>w")
vim.keymap.set("n", "<leader>wf", "<C-w>o")
vim.keymap.set("n", "<leader>wq", "<C-w>q")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

--lazyvim keymaps
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
vim.keymap.set("n", "<leader>fn", ":enew<CR>")
-- vim.keymap.set("n","<leader>te","<C-w>s:term<CR>13<C-w>-")
vim.keymap.set("n", "<leader>t<leader>", ":term<CR>")
-- vim.keymap.set(
--   "n",
--   "te",
--   '<C-w>v10<C-w>><C-w>l:term<CR>icd "C:\\Users\\Prajwal\\OneDrive\\Desktop\\new\\Newfolder\\nvimoutput"<CR><C-\\><C-n><C-w>h'
-- )
-- vim.keymap.set(
--   "n",
--   "cf",
--   ':w <bar> !gcc "%" -o "C:/Users/Prajwal/OneDrive/Desktop/new/Newfolder/nvimoutput/a.exe"<CR><CR><C-w>li<ESC>a.exe<CR>',
--   { silent = true }
-- )
-- vim.keymap.set("t", "C!", "<C-\\><C-n>:bd! %<CR>")
-- vim.keymap.set(
--   "n",
--   "ru",
--   '<C-w>s10<C-w>+<C-w>j:term<CR>icd "C:\\Users\\Prajwal\\OneDrive\\Desktop\\new\\Newfolder\\hello_world"<CR>cargo run<CR><C-\\><C-n>:tab split<CR>:tabp<CR>i'
-- )
vim.keymap.set("t", "bn", "<C-\\><C-n>:tabn<CR>i")
vim.keymap.set("n", "rs", "<C-w>jicargo run<CR>")
-- Terminal Mappings
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.set("t", "<C-up>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-left>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-down>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-right>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
vim.keymap.set("n", "||", ":tab split<CR>")
--vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
--vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
--vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
--vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
--vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
--vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
--vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
-- vim.keymap.set({ "i", "v" }, "<S-Tab>", "<cmd>Telescope symbols<CR>")
--copy error messages
vim.keymap.set("n", "<leader>ce", "<cmd>let @* = execute('messages')<CR>")
--temp fix
vim.keymap.set("n", "<leader>0", "<cmd>colorscheme carbonfox<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>colorscheme nightfox<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>colorscheme nordfox<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>colorscheme nightfly<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>colorscheme rose-pine<CR>")
vim.keymap.set("n", "<leader>5", "<cmd>colorscheme tokyonight<CR>")
vim.keymap.set("n", "<leader>6", "<cmd>colorscheme tokyonight-night<CR>")
vim.keymap.set("n", "<leader>7", "<cmd>colorscheme blue-moon<CR>")
--yanky
-- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
-- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
-- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
-- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

-- vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
-- vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
--debugger keymaps
-- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)
--
--
vim.keymap.set("n", "gxc", ":call Open_link()<CR>")
vim.keymap.set("n", "gxx", 'yiW:!"/bin/firefox" <C-R>"<CR>')
