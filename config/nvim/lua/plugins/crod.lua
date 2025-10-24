local discord = require("config.discord")

return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    editor = {
      client = discord.client_id,
    },
  },
}
