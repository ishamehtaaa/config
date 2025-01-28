-- Load core configurations
require('core.options')
require('core.keymaps')
require('core.plugins')
require('core.plugin_config').setup()

-- Python specific settings
vim.g.python3_host_prog = '/usr/bin/python3'
