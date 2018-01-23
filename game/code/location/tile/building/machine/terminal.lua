local class = require('code.libs.middleclass')
local Machine = require('code.location.tile.building.machine.machine')

local Terminal = class('Terminal', Machine)
local MAX_HP = 7
local operations = {}

Terminal.FULL_NAME = 'terminal'
Terminal.DURABILITY = 100
Terminal.CATEGORY = 'engineering'
Terminal.ap = {cost = 3, modifier = {gadget = -1, terminal = -1}}

function Terminal:initialize(building) 
  Machine.initialize(self, building)
end

function Terminal:install() 
  self.hp = MAX_HP
end

------------------------------------------------------

--function Terminal:client_criteria() end

--function Terminal:server_criteria() end

function Terminal:activate(player)
	local map = player:getMap()
  local zombies_num, zombies_levels, zombies_pos = map.terminal_network:access(self, player)

print('-----------')
print('Terminal network has been accessed')
print('Total zombies is: ', zombies_num)
print('Total zombie experience levels are: ', zombies_levels)
print('Zombie positions are the following: ', zombies_pos)

	-- need to do something with data on player UI

end

return Terminal