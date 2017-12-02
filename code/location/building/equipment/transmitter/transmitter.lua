local class = require('code.libs.middleclass')
local EquipmentBase = require('code.location.building.equipment.equipment_base')

local Transmitter = class('Transmitter', EquipmentBase)
local MAX_HP = 7
local operations = {'broadcast', 'retune'}

function Transmitter:initialize() 
  equipment.initialize(self)
  self.freq = 0
end

function Transmitter:install() 
  self.hp = MAX_HP 
  self.freq = math.random(1, 1024)
end

function Transmitter:broadcast(player, message, condition) channel:transmit(self.freq, player, message, condition) end

function Transmitter:retune(player, new_freq)  
  local receiver = self:getBuilding()
  channel:remove(self.freq, receiver)
  channel:insert(new_freq, receiver)
  self.freq = freq  
end

function Transmitter:getOperations() return operations end 

function Transmitter:hasOperations() return true end

return Transmitter