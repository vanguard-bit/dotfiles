return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = { "clangd", "--compile-commands-dir=." },
      },
    },
  },
}
