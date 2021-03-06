-- ################# Basic settings ################ --

-- ================= File management ================= --

-- swapfile has global & local config, eventhough help says otherwise
vim.o.swapfile = false -- can open already open files
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.autoread = true -- auto file change detection

-- Triger `autoread` when files changes on disk
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
  { command = [[if mode() != 'c' | checktime | endif]] }
)
-- Notification after file change
vim.api.nvim_create_autocmd(
  "FileChangedShellPost",
  {
    callback = function ()
      vim.api.nvim_echo({{"File changed on disk. Buffer reloaded.", "WarningMsg"}}, true)
    end
  }
)


-- ================= Scrolling ================= --

vim.o.scrolloff = 8 -- start scrolling when 8 lines away from margins


-- ================= Indentation ================= --

-- pay attention to 'vim.bo' (buffer local options) and 'vim.o' (global options)
-- see :help options.txt

-- for some reason these values need to be set in both o and bo objects
-- eventhough these options are supposed to be local to buffer
vim.o.tabstop = 2					-- maximum width of tab character (measured in spaces)
vim.bo.tabstop = 2
vim.o.shiftwidth = 2 	    -- size of indent (measured in spaces), should equal tabstop
vim.bo.shiftwidth = 2
vim.o.softtabstop = 2 	  -- should be the same as the other two above
vim.bo.softtabstop = 2
vim.o.expandtab = true    -- expand tabs to spaces
vim.bo.expandtab = true    -- expand tabs to spaces
vim.o.smartindent = true  -- smart indenting on new line for C-like programs
vim.bo.smartindent = true
vim.o.autoindent = true   -- copy the indentation from previous line
vim.bo.autoindent = true
vim.o.smarttab = true 	  -- tab infront of a line inserts blanks based on shiftwidth


-- ================= Number column ================= --

vim.wo.number = true
vim.wo.relativenumber = true


-- ================= Search ================= --

vim.o.ignorecase = true -- Ignorecase when searching
vim.o.incsearch = true	-- start searching on each keystroke
vim.o.smartcase = true	-- ignore case when lowercase, match case when capital case is used
vim.o.hlsearch = true		-- highlight the search results


-- ================= Performance ================= --

vim.o.lazyredraw = true -- useful for when executing macros.
vim.o.ttimeoutlen = 10  -- ms to wait for a key code seq to complete


-- ================= Misc ================= --

vim.wo.wrap = false -- don't wrap long text into multiple lines
vim.wo.cc = '81'
vim.o.history = 10000 -- numbers of entries in history for ':' commands and search patterns (10000 = max)
vim.o.updatetime = 100 -- used for CursorHold event (for document highlighting detection)
vim.o.mouse = 'nv' -- allow mose in normal & visual mode

-- better autocomplete behaviour
-- menuone - show popup menu also when there is only one match available
-- preview - show extra information about currently selected completion
-- noinsert - do not insert any text for match until the user selects it from the menu
vim.o.completeopt='menuone,preview,noinsert'

-- allows hidden buffers
-- this means that a modified buffer doesn't need to be saved when changing
-- tabs/windows.
vim.o.hidden=true
