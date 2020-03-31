local copas = require('copas')
local chttp = require('copas.http')
local MediaWikiApi = require('mwtest/mwapi')
local http = require('socket.http')
local https = require('ssl.https')
local json = require('rapidjson')

function string.trim(s)
  return s:match'^%s*([^#]*[^#%s])' or ''
end

function ipattern(pattern)
  -- find an optional '%' (group 1) followed by any character (group 2)
  local p = pattern:gsub("(%%?)(.)", function(percent, letter)
    if percent ~= "" or not letter:match("%a") then
      -- if the '%' matched, or `letter` is not a letter, return "as is"
      return percent .. letter
    else
      -- else, return a case-insensitive character class of the matched letter
      return string.format("[%s%s]", letter:lower(), letter:upper())
    end
  end)

  return p
end

function getGroupMembers(group_id)
  local res = {}
  local _, code, resheaders, _ = http.request {
    url = 'http://127.0.0.1:5700/get_group_member_list?group_id=' .. group_id, -- CoolQ API
    -- url = 'http://127.0.0.1:5777/get_group_member_list.json', -- local copy of the above result
    -- headers = reqheaders,
    sink = ltn12.sink.table(res)
  }

  return code == 200 and json.decode(table.concat(res)) or res
end

function httpsget(req)
  MediaWikiApi.trace('Performing HTTP request')
  local res = {}
  local _, code, resheaders, _ = https.request {
    url = 'https://zh.wikipedia.org/w/api.php?' .. MediaWikiApi.createRequestBody(req),
    protocol = 'tlsv1_2',
    headers = {
      ['User-Agent'] = string.format('mediawikilua %d.%d', 0, 2),
    },
    sink = ltn12.sink.table(res)
  }

  MediaWikiApi.trace('  Result status:', code)
  return table.concat(res), code
end

-- Copas Async Request
function chttpsget(req)
  MediaWikiApi.trace('CHTTP request')
  local res = {}
  local _, code, resheaders, _ = chttp.request {
    url = 'https://zh.wikipedia.org/w/api.php?' .. MediaWikiApi.createRequestBody(req),
    protocol = 'tlsv1_2',
    headers = {
      ['User-Agent'] = string.format('mediawikilua %d.%d', 0, 2),
    },
    sink = ltn12.sink.table(res)
  }

  MediaWikiApi.trace('  Result status:', code)
  return table.concat(res), code
end

function getManyUserInfo(userlist)
  local res, code = httpsget {
    action = 'query',
    list = 'users',
    ususers = userlist,
    format = 'json'
  }
  return code == 200 and json.decode(res) or {}
end

local fake_users = {}

function processUserInfo(result_list)
  if result_list.batchcomplete then
    for _,v in ipairs(result_list.query.users) do
      if v.missing then
        copas.addthread(function ()
          local res, code = chttpsget {
            action = 'query',
            meta = 'globaluserinfo',
            guiuser = v.name,
            format = 'json'
          }
          if code == 200 then
            local globalUser = json.decode(res)
            if globalUser.query.globaluserinfo.missing then
              table.insert(fake_users, v.name)
            end
          end
        end)
      end
    end
    copas.loop()
  end
end

local templist = {}

for _,v in ipairs(getGroupMembers(730483299).data) do
  local card = v.card:trim():gsub('：', ':')
  local uname = card:match(ipattern('user:%s*(.*)'))
  if uname and v.join_time >= os.time({ year=2019, month=9, day=1 }) then
    table.insert(templist, uname)
  end
  if #templist == 50 then
    -- copas.addthread(getManyUserInfo, templist:concat('|'))
    processUserInfo(getManyUserInfo(table.concat(templist, '|')))
    templist = {}
  end
end

if #templist > 0 then
  processUserInfo(getManyUserInfo(table.concat(templist, '|')))
end

local f = io.open("mwtest/fake.txt", "a")
for _,v in ipairs(fake_users) do
  f:write(v .. '\n')
end
f:close()