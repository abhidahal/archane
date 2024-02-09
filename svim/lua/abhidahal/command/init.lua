vim.api.nvim_create_user_command("Sudow", function()
  vim.cmd("w ! input=\"$(< /dev/stdin)\" && echo \""
  .. vim.fn.input("Password > ")
  .. "\" | sudo -S echo $input | sudo tee % > /dev/null")
end, {})

vim.api.nvim_create_user_command("Config", function()

end, {})
