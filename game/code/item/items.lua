local Crowbar, Wrench, Pipe, Poolstick, Bat, Rake, Shovel, Sledge = unpack(require('code.item.items.melee_blunt_weaponry'))
local Knife, Pitchfork, Axe, Pickaxe, Katanna = unpack(require('code.item.items.melee_pierce_weaponry'))
local Pistol, Magnum, Shotgun, Rifle, Bow, Flare, Molotov = unpack(require('code.item.items.ranged_weaponry'))
local FAK, Bandage, Syringe, Vaccine, Antidote, Scanner = unpack(require('code.item.items.medical'))
local Generator, Transmitter, Terminal = unpack(require('code.item.items.machinery'))
local Fuel, Barricade, Toolbox = unpack(require('code.item.items.tools'))
local Radio, GPS, Flashlight, Pheromone = unpack(require('code.item.items.gadget'))
local Book, Bottle, Newspaper = unpack(require('code.item.items.junk'))
local Magazine, Shell, Clip, Quiver = unpack(require('code.item.items.ammo'))
local Leather, Kevlar, Riotsuit, Firesuit, Biosuit = unpack(require('code.item.items.armor'))

local Items = {
  -- MELEE BLUNT WEAPONRY
  Crowbar, Wrench, Pipe, Poolstick, Bat, Rake, Shovel, Sledge, 
  -- MELEE PIERCE WEAPONRY
  Knife, Pitchfork, Axe, Pickaxe, Katanna,
  -- RANGED WEAPONRY
  Pistol, Magnum, Shotgun, Rifle, Bow, Flare, Molotov,
  -- MEDICAL
  FAK, Bandage, Syringe, Vaccine, Antidote, Scanner,
  -- MACHINERY
  Generator, Transmitter, Terminal,
  -- TOOLS
  Fuel, Barricade, Toolbox,
  -- GADGET
  Radio, GPS, Flashlight, Pheromone, --'cellphone', 'sampler'
  -- JUNK
  Book, Bottle, Newspaper,
  -- AMMO
  Magazine, Shell, Clip, Quiver,
  -- ARMOR
  Leather, Kevlar, Riotsuit, Firesuit, Biosuit,
}

for _, Class in ipairs(Items) do 
  Items[Class.name] = Class 
end

return Items