local keymap = vim.keymap
-- unbind Q
keymap.set('n', 'Q', '<nop>')
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- Replace the current word
keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit window [V]ertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit window [H]orizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make [S]plits [E]qual size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'close current split' })

-- Change size of current window horizontally (not working for some reason)
-- keymap.set('n', "<M-,>", "<c-w>5<", { desc = "decrease the width of the current split [<]"})
-- keymap.set('n', "<M-.>", "<c-w>5>", { desc = "increase the width of the current split [>]"})
-- keymap.set('n', "<M-=>", "<C-W>->", { desc = "decrease the height of the current spl+t [-]"})
-- keymap.set('n', "<M-=>", "<C-W>+>", { desc = "increase the height of the current split [+]"})

-- tab mangement
keymap.set('n', '<leader>to', '<cmd>tabnew %<CR>', { desc = '[T]ab [O]pen' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab e[X]it' })
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = '[T]ab [N]ext' })
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = '[T]ab [P]rev' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
