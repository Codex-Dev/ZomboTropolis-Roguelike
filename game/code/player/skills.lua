local class = require('code.libs.middleclass')
local bit = require('plugin.bit')
local band, bor, bxor, bnot, rshift = bit.band, bit.bor, bit.bxor, bit.bnot, bit.rshift

local Skills = class('Skills')

function Skills:initialize(skill_list)
  self.flags = {}
  for _, category in pairs(skill_list.order.category) do self.flags[category] = 0 end
  self.list = skill_list  
end

function Skills:getFlags(category) return self.flags[category] end

local function countSetFlags(bits)  -- count the number of set bits
  local count = 0
  while bits > 0 do
    count = count + band(bits, 1)
    bits = rshift(bits, 1)
  end
--print('total skill count ='..count)  
  return count
end

function Skills:countFlags(category)
  local count = 0
  if category == 'skills' then -- seperates skill bitflags from classes (ie. isolate skill bitflags)  
    for flag_category, flags in pairs(self.flags) do
      if flag_category ~= 'classes' then 
        count = count + countSetFlags(flags) 
      end
    end
  elseif category == 'classes' then -- seperates class bitflags from skills  (ie. isolate class bitflags)  
    count = countSetFlags(self.flags.classes)
  else -- count all skills in specific class (ie. isolate [category] bitflags) 
    count = countSetFlags(self.flags[category])
  end
  return count
end

local class_cost = {100, 300, 600, 1000}

function Skills:getCost(mode)
  local cost, total_flags
  if mode == 'skills' then  
    total_flags = self:countFlags('skills')
    cost = (.2*(total_flags)^2 + .25*(total_flags) + 50)
  elseif mode == 'classes' then
    total_flags = self:countFlags('classes')
    cost = class_cost[total_flags+1]
  end
  return math.floor(cost + 0.5)
end

-- class prices, 100, 300, 600, 1000
-- skill buy formula (y = .2*(x)^2 + .25*(x) + 50)
function Skills:buy(player, skill)
  local xp = player.stats:get('xp')
  
  local class = self.list:isClass(skill)  
  local cost = (class and self:getCost('classes') ) or self:getCost('skills')  
  local required_flags = self.list:getRequiredFlags(skill)
print('[skills:buy]', 'player.xp='..xp, 'skill['..skill..'] cost='..cost)  
--print('required_flags = ', required_flags)  
  
  -- should return error msgs?
  assert(xp >= cost, 'Not enough xp')
  assert(player:isStanding(), 'Player must revive first')
  assert(not player.skills:check(skill), 'Already have skill')  
  
  for category, flags in pairs(required_flags) do
    assert(flags == 0 or player.skills:checkFlag(category, flags), 'Missing required skills')
  end
  
  player.stats:update('xp', (-1)*cost)  
  player.skills:add(skill)  
end

function Skills:checkFlag(category, flag) return 
--print('required flag = '..flag, 'current flags = '..self:getFlags())  
  band(self:getFlags(category), flag) == flag end

function Skills:check(skill) return self:checkFlag(self.list:getCategory(skill), self.list.flag[skill]) end

function Skills:add(skill) 
  local category = self.list:getCategory(skill)
  self.flags[category] = bor(self.flags[category], self.list.flag[skill]) 
end

return Skills