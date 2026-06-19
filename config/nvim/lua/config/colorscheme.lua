
return {
    -- {
    --     'projekt0n/github-nvim-theme',
    --     name = 'github-theme',
    --     config = function () 
    --         vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    --         vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    --         vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    --     end
    -- },
    {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
	    auto_integrations = true,
	    flavour = "mocha",
	    transparent_background = true,
	    float = {
	        transparent = true,
	    },
	    custom_highlights = function(colors)
		return {
		    netrwMarkFile = { bg = colors.surface1, style = { "bold" } },
		}
	    end,
	}
    }
}
