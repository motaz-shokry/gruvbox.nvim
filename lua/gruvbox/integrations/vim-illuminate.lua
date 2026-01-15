-- RRethy/vim-illuminate
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    IlluminatedWordRead = { link = "LspReferenceRead" },
    IlluminatedWordText = { link = "LspReferenceText" },
    IlluminatedWordWrite = { link = "LspReferenceWrite" },
  }
end

return M
