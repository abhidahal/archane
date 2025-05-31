return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  keys = {
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>>",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
  },

  ---@type snacks.Config
  opts = {
    dashboard = {
      sections = {
        {
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "B",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3 | cat",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 4,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3 | cat",
              key = "p",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 4,
            },
            {
              icon = " ",
              title = "Git Branches",
              cmd = "echo 'Local Branch' && git branch  --color=always --format='%(color:yellow)%(refname:short)%(color:reset) %(upstream:short)%(color:green) %(committerdate:relative)%(color:reset)' && echo '\nRemote Branches' && git branch -a -r --abbrev=7 --color=always --format='%(color:yellow)%(refname:short)%(color:reset) %(upstream:short)%(color:green) %(committerdate:relative)%(color:reset)'",
              key = "b",
              action = function()
                Snacks.lazygit({ cwd = LazyVim.root.git(), args = { "branch" } })
              end,
              height = 10,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              key = "s",
              action = function()
                Snacks.lazygit({ cwd = LazyVim.root.git() })
              end,
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    },
    scroll = { enabled = true },
    scratch = {
      ft = function()
        return "markdown"
      end,
    },
    filekey = {
      branch = false,
      count = false,
      ft = false,
      cwd = false,
    },
    styles = {
      scratch = {
        position = "right",
        relative = "editor",
        height = 0.4,
        width = 0.4,
      },
    },
  },
}
