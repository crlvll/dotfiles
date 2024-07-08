return {
	-- install without yarn or npm
	"iamcco/markdown-preview.nvim",
	cmd = {
		"MarkdownPreviewToggle",
		"MarkdownPreview",
		"MarkdownPreviewStop",
	},
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,

	keys = {
		{ "<leader>md", "<cmd>MarkdownPreview<cr>", desc = "Open Markdown Preview" },
	},
}
