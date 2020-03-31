--[[
Author: Alexander Misel
]]
local json = require('rapidjson')
local topview_data = {}

local pop_file = io.open("mwtest/sci.txt", "rb")
local pop_str = pop_file:read('*a')
if pop_str:len() > 10 then
  topview_data = json.decode(pop_str)
  print(#topview_data.list)
end
pop_file:close()

local new_len = #topview_data.list

for i, v in ipairs(topview_data.list) do
  v.article = v.article:gsub(' ', '_')
end

local f = io.open("mwtest/popf.txt", "wb")
f:write(json.encode(topview_data))
f:close()