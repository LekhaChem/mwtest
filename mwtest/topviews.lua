local json = require('cjson')

local pages = {}

local function process(data)
  for _, v in ipairs(data) do
    if pages[v.article] then
      pages[v.article] = pages[v.article] + v.views
    else
      pages[v.article] = v.views
    end
  end
end

for i = 1, 12 do
  local month = string.format("%02d", i)
  local f = io.open('topviews/topviews-2019_' .. month .. '.json', "rb")
  local data = json.decode(f:read('*a'))
  process(data)
  f:close()
end

local toplist = {}
for k, v in pairs(pages) do
  if k ~= 'Wiki' then
    toplist[#toplist + 1] = {
      article = k,
      views = v
    }
  end
end

table.sort(toplist, function(a, b)
  return a.views > b.views
end)

local f = io.open("mwtest/topviews.txt", "wb")
for i, v in ipairs(toplist) do
  f:write(i .. '\t' .. v.article .. '\t' .. v.views .. '\n')
end
f:close()


