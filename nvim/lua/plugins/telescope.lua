---@type LazyPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      file_ignore_patterns = { "node_modules", "%.git/" },
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
    })
    return opts
  end,
  keys = {
    {
      "<C-p>",
      function() require("telescope.builtin").find_files() end,
      desc = "Find files",
    },
    {
      "<Leader>fw",
      function() require("telescope.builtin").grep_string { search = vim.fn.expand "<cword>" } end,
      desc = "Grep word under cursor",
    },
  },
}
