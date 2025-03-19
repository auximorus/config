local opt = require("core.options")
local maps = require("core.mappings")
local wk = require("which-key")
local set = vim.opt
local G = vim.g
local B = vim.b
local W = vim.w
local T = vim.t

G.mapleader = " "
-- Options
for k, v in pairs(opt.val) do
  set[k] = v
end

for k, v in pairs(opt.bools) do
  set[k] = v
end

-- for k,v in pairs(opt.lsts) do
-- set[k] = v
-- end

for k, v in pairs(opt.strs) do
  set[k] = v
end

-- Mappings
function create_mapping(maptable)
  for mod, vals in pairs(maptable) do
    -- print(type(mod))
    local cmdtable = { mode = mod }
    for short, cmd in pairs(vals) do
      -- print(short,cmd[1],cmd[2])
      table.insert(cmdtable, { short, cmd[1], desc = cmd[2] })
    end
    wk.add({ cmdtable })
  end
end

function create_group_mapping(group_key, group_name, group_table)
  for mod, vals in pairs(group_table) do
    -- print(type(mod))
    local cmdtable = { mode = mod, { group_key, group = group_name } }
    for short, cmd in pairs(vals) do
      -- print(short,cmd[1],cmd[2])
      table.insert(cmdtable, { short, cmd[1], desc = cmd[2] })
    end
    wk.add({ cmdtable })
  end
end

create_mapping(maps.general)
create_mapping(maps.lsp)
create_group_mapping("<leader>f", "Telescope", maps.telescope)
