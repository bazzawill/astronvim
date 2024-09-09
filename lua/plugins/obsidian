return {
  "epwalsh/obsidian.nvim",
  -- the obsidian vault in this default config  ~/obsidian-vault
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  event = { "BufReadPre  */vaults/personal/*.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gf"] = {
              function()
                if require("obsidian").util.cursor_on_markdown_link() then
                  return "<Cmd>ObsidianFollowLink<CR>"
                else
                  return "gf"
                end
              end,
              desc = "Obsidian Follow Link",
            },
            -- Obsidian --
            ["<leader>,"] = { name = "Notes" },
            ["<leader>,o"] = { "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian" },
            ["<leader>,n"] = {
              function()
                vim.ui.input(
                  { prompt = "Note Name" },
                  function(noteName) vim.cmd { cmd = "ObsidianNew", args = { noteName } } end
                )
              end,
              desc = "New Note",
            },
            ["<leader>,r"] = {
              function()
                vim.ui.input({ prompt = "Expression: " }, function(input)
                  -- require("obsidian").Rename (input)
                  vim.cmd { cmd = "ObsidianRename ", args = input }
                end)
              end,
              desc = "Rename Note",
            },
            ["<leader>,S"] = { "<cmd>ObsidianSearch<cr>", desc = "Search Notes" },
            ["<leader>,s"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Search Notes" },
            ["<leader>,p"] = { "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },
          },
        },
      },
    },
  },

  opts = {
    conceallevel = 1,
    dir = vim.env.HOME .. "/vaults/personal", -- specify the vault location. no need to call 'vim.fn.expand' here
    use_advanced_uri = true,
    finder = "telescope.nvim",

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = vim.ui.open or function(url) require("astrocore").system_open(url) end,
  },
}
