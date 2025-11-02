# Neovim Keymaps Reference

## Gitsigns (Git Integration)

### Navigation
- `]c` - Jump to next hunk
- `[c` - Jump to previous hunk

### Actions
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hS` - Stage entire buffer
- `<leader>hR` - Reset entire buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hd` - Diff this file

### Text Objects
- `ih` - Select hunk (works in visual and operator modes)

## LSP (Language Server Protocol)

### Navigation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Go to references
- `K` - Hover (shows type/documentation)

## Buffer Management

### Commands
- `:buffers` or `:ls` - List all open buffers
- `:b N` - Switch to buffer number N
- `:b filename` - Switch to buffer by partial filename
- `:bn` - Next buffer
- `:bp` - Previous buffer
- `:bfirst` - First buffer
- `:blast` - Last buffer

## Window Management

### Resize Windows
- `Ctrl-w` `>` - Increase width
- `Ctrl-w` `<` - Decrease width
- `Ctrl-w` `+` - Increase height
- `Ctrl-w` `-` - Decrease height
- `Ctrl-w` `=` - Make all windows equal size
- `Ctrl-w` `|` - Maximize width
- `Ctrl-w` `_` - Maximize height
- `Ctrl-w` `o` - Make current window only

### Resize with count
- `Ctrl-w` `5` `>` - Increase width by 5 columns
- `Ctrl-w` `10` `+` - Increase height by 10 lines

### Commands
- `:resize N` - Set height to N lines
- `:vertical resize N` - Set width to N columns
- `:resize +N` / `:resize -N` - Increase/decrease height by N

## Quickfix/Location List

### Commands
- `:copen` - Open quickfix window
- `:cclose` - Close quickfix window
- `:lopen` - Open location list
- `:lclose` - Close location list
