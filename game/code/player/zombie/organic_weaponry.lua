local class = require('code.libs.middleclass')
local IsWeapon = require('code.item.mixin.is_weapon')

-------------------------------------------------------------------

local Claw = class('Claw'):include(IsWeapon)

Claw.FULL_NAME = 'claw'

Claw.weapon = {
  ATTACK_STYLE = 'melee',
  DAMAGE_TYPE = 'blunt',
  GROUP = {'arm'},
  DICE = '1d3',
  ACCURACY = 0.99, --0.25
  CRITICAL = 0.05,
  ORGANIC = 'zombie',
  STATUS_EFFECT = 'entangle',
  MASTER_SKILL = 'claw_adv',
}

function Claw:__tostring() return tostring(self.class) end

-------------------------------------------------------------------

local Bite = class('Bite'):include(IsWeapon)

Bite.FULL_NAME = 'bite'

Bite.weapon = {
  ATTACK_STYLE = 'melee',
  DAMAGE_TYPE = 'pierce',
  GROUP = {'teeth'},
  DICE = '1d4+1',
  ACCURACY = 0.20,
  CRITICAL = 0.05,
  ORGANIC = 'zombie',
  STATUS_EFFECT = 'infection',
  MASTER_SKILL = 'bite_adv',
}

function Bite:__tostring() return tostring(self.class) end

-------------------------------------------------------------------

--[[  Moved to skill activation
weapon.acid = {}
weapon.acid.FULL_NAME = 'stomach acid'
weapon.acid.ATTACK_STYLE = 'ranged'
weapon.acid.DAMAGE_TYPE = 'scorch'
weapon.acid.GROUP = {'stomach'}
weapon.acid.DICE = '5d2'
weapon.acid.ACCURACY = 0.15
weapon.acid.CRITICAL = 0.30
weapon.acid.ORGANIC = 'zombie'
--]]

return {Claw, Bite}