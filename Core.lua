local _, module = ...

-- Table of default class scripts, indexed by class tokens.
module.script = {
	DEATHKNIGHT = { },
	DRUID = { },
	HUNTER = { },
	MAGE = { },
	MONK = { },
	PALADIN = { },
	PRIEST = { },
	ROGUE = { },
	SHAMAN = { },
	WARLOCK = { },
	WARRIOR = { },
}

local Ovale = LibStub("AceAddon-3.0"):GetAddon("Ovale")
module.OvaleScripts = Ovale:GetModule("OvaleScripts")

function module:OnEnable()
	playerClass = select(2, UnitClass("player"))
	for class, tbl in pairs(self.script) do
		for source, srcTbl in pairs(tbl) do
			self.OvaleScripts:RegisterScript(class, source, srcTbl.desc, srcTbl.code)
		end
	end
end

function module:OnDisable()
	for class, tbl in pairs(self.script) do
		for source in pairs(tbl) do
			self.OvaleScripts:UnregisterScript(class, source)
		end
	end
end

local NerienOvaleScripts = module.OvaleScripts:NewModule("NerienOvaleScripts", module)
