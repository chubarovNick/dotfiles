local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup {
  nextls = {
    enable = false -- defaults to false
  },
  credo = {
    enable = false 
  },
  elixirls = {
    enable = true
  }
}

