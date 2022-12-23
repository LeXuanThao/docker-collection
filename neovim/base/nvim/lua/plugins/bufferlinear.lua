local ok, _ = pcall(require, "bufferline")
if not ok then
	return
end

_.setup()

