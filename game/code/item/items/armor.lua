local class = require('code.libs.middleclass')
local Item = require('code.item.item')
local IsArmor = require('code.item.mixin.is_armor')
local broadcastEvent = require('code.server.event')
string.replace = require('code.libs.replace')

-------------------------------------------------------------------

local Armor = class('Armor', Item):include(IsArmor)

Armor.ap = {cost = 1} -- default AP cost for armor

function Armor:activate(player)
  if player.equipment:isActive('armor') then -- remove old armor and put into inventory 
    local old_armor = player.equipment.armor
    player.inventory:insert(old_armor) 
  end
  player.equipment:add('armor', self)
  
  --------------------------------------------
  -----------   M E S S A G E   --------------
  --------------------------------------------
  
  local msg = 'You equip a {armor}.'
  msg = msg:replace(self) -- This should work? Needs to be tested

  --------------------------------------------
  ---------   B R O A D C A S T   ------------
  --------------------------------------------
  
  local event = {'armor', player}
  player.log:insert(msg, event)
end

-------------------------------------------------------------------

local Leather = class('Leather', Armor)

Leather.FULL_NAME = 'leather jacket'
Leather.WEIGHT = 5
Leather.DURABILITY = 4
Leather.CATEGORY = 'military'

Leather.armor = {}
Leather.armor.resistance = {blunt=1}

-------------------------------------------------------------------

local Kevlar = class('Kevlar', Armor)

Kevlar.FULL_NAME = 'kevlar armor'
Kevlar.WEIGHT = 12
Kevlar.DURABILITY = 8
Kevlar.CATEGORY = 'military'

Kevlar.armor = {}
Kevlar.armor.resistance = {
  {bullet=4, brute=2, pierce=2}, -- 8 points (4 points of melee)
  {bullet=3, brute=2, pierce=1}, -- 6 points (3 points of melee)
  {bullet=2, brute=1, pierce=1}, -- 4 points (2 points of melee)
  {bullet=1, brute=1},           -- 2 points (1 points of melee)
}

-------------------------------------------------------------------

local Riotsuit = class('Riotsuit', Armor)

Riotsuit.FULL_NAME = 'riotsuit'
Riotsuit.WEIGHT = 25
Riotsuit.DURABILITY = 16
Riotsuit.CATEGORY = 'military'

Riotsuit.armor = {}
Riotsuit.armor.resistance = {
  {brute=4, pierce=4},  -- 8 points melee
  {brute=4, pierce=3},  -- 7 points melee
  {brute=3, pierce=3},  -- 6 points melee
  {brute=3, pierce=2},  -- 5 points melee
}

-------------------------------------------------------------------

local Firesuit = class('Firesuit', Armor)

Firesuit.FULL_NAME = 'firesuit'
Firesuit.WEIGHT = 10
Firesuit.DURABILITY = 12
Firesuit.CATEGORY = 'engineering'

-- need to make this resistant to molotov attacks
Firesuit.armor = {}
Firesuit.armor.resistance = {
  {acid=1},
  {acid=2},
  {acid=3},
  {acid=4},
}

-------------------------------------------------------------------

local Biosuit = class('Biosuit', Armor)

Biosuit.FULL_NAME = 'biosuit'
Biosuit.WEIGHT = 7
Biosuit.DURABILITY = 2
Biosuit.CATEGORY = 'research'

Biosuit.armor = {}
Biosuit.armor.resistance = {}  -- fix this?

return {Leather, Kevlar, Riotsuit, Firesuit, Biosuit}