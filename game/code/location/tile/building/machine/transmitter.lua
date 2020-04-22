local class = require('code.libs.middleclass')
local Machine = require('code.location.tile.building.machine.machine')

local Transmitter = class('Transmitter', Machine)
local MAX_HP = 7
local operations = {'broadcast', 'retune'}

Transmitter.FULL_NAME = 'transmitter'
Transmitter.DURABILITY = 100
Transmitter.CATEGORY = 'engineering'
Transmitter.ap = {cost = 3, modifier = {tech = -1, radio_tech = -1}} -- this might not be the correct way to do this (need seperate ap costs for actions? retune, transmit, etc.?)

function Transmitter:initialize(buiilding) 
  self.hp = MAX_HP 
  self.freq = math.random(1, 1024)
  Machine.initialize(self, building)  
end

function Transmitter:broadcast(player, message) 
  channel:transmit(self.freq, player, message, self.condition) 
end

function Transmitter:retune(player, new_freq)  
  local receiver = self:getBuilding()
  channel:remove(self.freq, receiver)
  channel:insert(new_freq, receiver)
  self.freq = freq  
end

--function Transmitter:getOperations() return operations end 
--function Transmitter:hasOperations() return true end

return Transmitter