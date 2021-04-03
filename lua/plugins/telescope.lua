local telescope = require 'telescope'

telescope.setup {
  extensions = {media_files = {filetypes = {'png', 'jpg', 'pdf'}}}
}

telescope.load_extension 'media_files'
