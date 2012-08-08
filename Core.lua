NerienOvaleScripts = LibStub("AceAddon-3.0"):NewAddon("NerienOvaleScripts", "AceConsole-3.0")
NerienOvaleScripts:RegisterChatCommand("ovale-restore", "RestoreDefaultScript")

NerienOvaleScripts.script = { }

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

-- This function touches deeply into Ovale table internals to change the default
-- code used as well as forcing Ovale to recompile the code.
--
local ovaleHookRun = false
function NerienOvaleScripts:OvaleHook()
	-- Ensure this function only runs once.
	if ovaleHookRun then return end

	-- Ensure this function only executes after Ovale has set its own defaults.
	local Ovale = _G.Ovale
	if not Ovale or type(Ovale) ~= "table" then return end
	if not Ovale.firstInit then return end

	-- Make a copy of the old defaults table for Ovale.db, change the default code string,
	-- then set that as the new defaults table for Ovale.db.
	local defaultDB = deepCopy(Ovale.db.defaults.profile)
	local _, classToken = UnitClass("player")
	defaultDB.code = self.script[classToken]
	Ovale.db:RegisterDefaults({ profile = defaultDB })

	-- Force a recompile of the code with the new code string.
	if Ovale.db.profile.code then
		Ovale.needCompile = true
	end
	ovaleHookRun = true
end

function NerienOvaleScripts:OnEnable()
	self:OvaleHook()
end

function NerienOvaleScripts:RestoreDefaultScript()
	local Ovale = _G.Ovale
	if not Ovale or type(Ovale) ~= "table" then return end
	if not Ovale.firstInit then return end

	Ovale.db.profile.code = Ovale.db.defaults.profile.code
	if Ovale.db.profile.code then
		Ovale.needCompile = true
	end
end