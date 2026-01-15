local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    ["@lsp.type.comment"] = {},
    ["@lsp.type.comment.c"] = { link = "@comment" },
    ["@lsp.type.comment.cpp"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@interface" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.namespace.python"] = { link = "@variable" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.variable.svelte"] = { link = "@variable" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.variable.constant"] = { link = "@constant" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    LspCodeLens = { fg = palette.gray },
    LspCodeLensSeparator = { fg = palette.bg4 },
    LspInlayHint = { fg = palette.gray, bg = palette.bg1, blend = 25 },
    LspReferenceRead = { bg = palette.bg_second },
    LspReferenceText = { bg = palette.bg_second },
    LspReferenceWrite = { bg = palette.bg_second },
    LspSignatureActiveParameter = { fg = palette.bg_main, bg = palette.green_lite },
    LspReferenceTarget = { fg = palette.fg1, bg = palette.bg_second },
  }
end

return M
