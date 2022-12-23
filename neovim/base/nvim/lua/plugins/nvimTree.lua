local ok, _ = pcall(require, "nvim-tree")
if not ok then
	return
end
_.setup()
