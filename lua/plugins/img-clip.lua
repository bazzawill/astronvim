return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>,", desc = "Notes" },
    { "<leader>,p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
