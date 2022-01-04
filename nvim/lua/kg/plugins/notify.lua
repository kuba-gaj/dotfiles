local present, notify = pcall(require, 'notify')

if not (present) then
	return
end

vim.notify = notify

notify.setup({
  stages = "static",
  render = "minimal",
  timeout = 500
})
