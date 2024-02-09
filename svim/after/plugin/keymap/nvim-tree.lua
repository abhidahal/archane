local Remap = require("abhidahal.keymap")
local nnoremap = Remap.nnoremap

local function is_dir(path)
	local f = io.open(path, "r")
	if f then
		local _, _, code = f:read(1)
		f:close()
		return code == 21
	end
	return false
end

local nvim_tree_api = require("nvim-tree.api")
nnoremap("<C-b>", nvim_tree_api.tree.toggle)
nnoremap("<leader>i", function()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		local node = nvim_tree_api.tree.get_node_under_cursor()
		nvim_tree_api.tree.change_root_to_node()
		local cd = nil
		if node.absolute_path then
			if is_dir(node.absolute_path) then
				cd = node.absolute_path
			end
		else
			cd = ".."
		end
		if cd then
			vim.cmd("cd " .. cd)
		end
	end
end)
