local root_files = {
  ".clangd",
  ".clang-tidy",
  ".clang-format",
  "compile_commands.json",
  "compile_flags.txt",
  "configure.ac", -- AutoTools
}

local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { "utf-8" },
}

return {
  default_config = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
    capabilities = default_capabilities,
  },
  docs = {
    description = [[
https://clangd.llvm.org/installation.html
- **NOTE:** Clang >= 11 is recommended! See [#23](https://github.com/neovim/nvim-lsp/issues/23).
- If `compile_commands.json` lives in a build directory, you should
  symlink it to the root of your source tree.
  ```
  ln -s /path/to/myproject/build/compile_commands.json /path/to/myproject/
  ```
- clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
  specified as compile_commands.json, see https://clangd.llvm.org/installation#compile_commandsjson
]],
    default_config = {
      root_dir = [[
        root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        )
      ]],
      capabilities = [[default capabilities, with offsetEncoding utf-8]],
    },
  },
}
