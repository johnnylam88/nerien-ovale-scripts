local Ovale = LibStub("AceAddon-3.0"):GetAddon("Ovale")
local OvaleOptions = LibStub("AceAddon-3.0"):GetAddon("OvaleOptions")
NerienOvaleScripts = OvaleOptions:NewModule("NerienOvaleScripts")

-- Table of default class scripts, indexed by class tokens.
NerienOvaleScripts.script = { }
NerienOvaleScripts.defaut = NerienOvaleScripts.script

-- Return a deep copy of a table, preserving metatables.
local function deepCopy(t)
	if type(t) ~= "table" then return t end
	local mt = getmetatable(t)
	local result = { }
	for k,v in pairs(t) do
		if type(v) == "table" then
			v = deepCopy(v)
		end
		result[k] = v
	end
	setmetatable(result, mt)
	return result
end

-- This function sets the default script to the class script from the latest enabled
-- module, falling back to using Ovale's default class script.
--
-- This function touches deeply into Ovale table internals to change the default
-- code used as well as forcing Ovale to recompile the code and should really be
-- part of Ovale itself.
--
function NerienOvaleScripts:SetDefaultScript()
	local code = ""
	local _, classToken = UnitClass("player")

	if Ovale.defaut and Ovale.defaut[classToken] then
		code = Ovale.defaut[classToken]
	end
	for name, module in OvaleOptions:IterateModules() do
		-- Expect that each module has a "defaut" table indexed by class token containing
		-- class scripts.
		if module:IsEnabled() and module.defaut and module.defaut[classToken] then
			code = module.defaut[classToken]
		end
	end

	-- Make a copy of the old defaults table for OvaleOptions.db, change the default code string,
	-- then set that as the new defaults table for OvaleOptions.db.
	local defaults = deepCopy(OvaleOptions.db.defaults)
	for _, tbl in pairs(defaults) do
		if type(tbl) == "table" and tbl.code then
			tbl.code = code
		end
	end
	OvaleOptions.db:RegisterDefaults(defaults)

	-- Force a recompile of the code with the new code string.
	if OvaleOptions.db.profile.code then
		Ovale.needCompile = true
	end
end

function NerienOvaleScripts:OnEnable()
	self:SetDefaultScript()
end

function NerienOvaleScripts:OnDisable()
	self:SetDefaultScript()
end