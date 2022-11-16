local status_ok, lspconf = pcall(require, "lspconfig")
if not status_ok then
  return
end


require "user.lsp.lsp-signature"
require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

local util = lspconf.util
local function get_typescript_server_path(root_dir)

  local global_ts = '/home/justin/.nvm/versions/node/v18.12.1/lib/node_modules/typescript/lib' -- TODO: $(which tsc)
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

lspconf.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
}
