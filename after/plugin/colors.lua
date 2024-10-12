require('rose-pine').setup({
    disable_background = true,
	highlight_groups = {
		Normal={
			bg="#5a5289",
			fg="#5a5289"
		}
	},
})

local colors = {"rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn"}
local color_idx = 1

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

function ChangeColorScheme()
	color_idx=math.max((color_idx+1)%5, 1)
	ColorMyPencils(colors[color_idx])
	print("ColorScheme: ", colors[color_idx])
end

ColorMyPencils()
vim.keymap.set('n', "<leader>ct", ChangeColorScheme)
