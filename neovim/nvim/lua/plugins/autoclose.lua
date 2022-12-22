local ok, _ = pcall(require, "autoclose")
if not ok then
	return
end

_.setup({})
