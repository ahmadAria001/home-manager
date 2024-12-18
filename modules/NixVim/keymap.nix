{self, ...}: {
  programs.nixvim.keymaps = [
	{
	  action = "<cmd>NvimTreeToggle<CR>";
	  key = "<C-n>";
	  mode = "n";
	  options = {
	    desc = "Toggle NvimTree file explorer";
	  };
	}
	{
	  action = "<cmd>NvimTreeFocus<CR>";
	  key = "<leader>e";
	  mode = "n";
	  options = {
	    desc = "Focus on NvimTree file explorer";
	  };
	}
	{
	  action = "gcc";
	  key = "<leader>/";
	  mode = "n";
	  options = {
	    remap = true;
	    desc = "Toggle comment (line) in normal mode";
	  };
	}
	{
	  action = "gc";
	  key = "<leader>/";
	  mode = "v";
	  options = {
	    remap = true;
	    desc = "Toggle comment (selection) in visual mode";
	  };
	}
	{
	  action = "<cmd>Telescope live_grep<CR>";
	  key = "<leader>fw";
	  mode = "n";
	  options = {
	    desc = "Search text with live grep using Telescope";
	  };
	}
	{
	  action = "<cmd>Telescope find_files<CR>";
	  key = "<leader>ff";
	  mode = "n";
	  options = {
	    desc = "Find files using Telescope";
	  };
	}
	{
	  action = "<cmd>Telescope git_commits<CR>";
	  key = "<leader>fg";
	  mode = "n";
	  options = {
	    desc = "Browse Git commits using Telescope";
	  };
	}
	{
	  action = "<cmd>Telescope oldfiles<CR>";
	  key = "<leader>fh";
	  mode = "n";
	  options = {
	    desc = "Find recently opened files using Telescope";
	  };
	}
	{
	  action = "<cmd>Telescope colorscheme<CR>";
	  key = "<leader>ch";
	  mode = "n";
	  options = {
	    desc = "Browse and change colorscheme using Telescope";
	  };
	}
	{
	  action = "<cmd>Telescope man_pages<CR>";
	  key = "<leader>fm";
	  mode = "n";
	  options = {
	    desc = "Search man pages using Telescope";
	  };
	}

    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferPrevious<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>BufferClose<cr>";
      options = {
        desc = "Close Buffer";
      };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "switch window left";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "switch window right";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "switch window down";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "switch window up";
      };
    }
    {
      mode = "t";
      key = "<C-x>";
      action = "<C-\\><C-N>";
      options = {
        desc = "switch window up";
      };
    }
    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>ToggleTerm<cr>";
      options = {
        desc = "open terminal";
      };
    }
    {
      mode = "v";
      key = "y";
      action = "<Leader>\"+y";
      options = {
        desc = "yank/copy selected";
      };
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = ''        function()
        				  format { lsp_fallback = true }
        				end'';
      options = {
        desc = "yank/copy selected";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>cm";
      action = ''
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end
      '';
      options = {
        desc = "Format with Conform";
      };
    }

    {
      mode = "t";
      key = "<ESC>";
      action = "<C-\\><C-N>";
      options = {
        desc = "Exit Terminal Mode";
      };
    }

    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>set nu!<CR>";
      options = {
        desc = "Toggle line number";
      };
    }

    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>set rnu!<CR>";
      options = {
        desc = "Toggle relative number";
      };
    }

    {
      mode = "x";
      key = "<leader>cc";
      action = "<cmd>CodeSnap<cr>";
      options = {
        desc = "Save selected code snapshot into clipboard";
      };
    }

    {
      mode = "x";
      key = "<leader>cs";
      action = "<cmd>CodeSnapSave<cr";
      options = {
        desc = "Save selected code snapshot in ~/Pictures/Screenshots";
      };
    }
  ];
}
