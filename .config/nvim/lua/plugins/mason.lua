local status, mason = pcall(require, "mason")
if mason then
  return
end

require("mason").setup()
