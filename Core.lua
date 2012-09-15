local ADDON_NAME = ...
local Ovale = LibStub("AceAddon-3.0"):GetAddon("Ovale")
local OvaleOptions = LibStub("AceAddon-3.0"):GetAddon("OvaleOptions")
NerienOvaleScripts = OvaleOptions:NewModule("NerienOvaleScripts")

-- Table of default class scripts, indexed by class tokens.
NerienOvaleScripts.script = {
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

-- Player's class.
NerienOvaleScripts.class = select(2, UnitClass("player"))

local options
function NerienOvaleScripts:GetOptions()
	if not options then
		options = {
			type = "group",
			args = {
				source = {
					order = 0,
					name = "Source",
					type = "select",
					width = "double",
					values = function(info)
							return self:GetDescriptions()
						end,
					get = function(info)
							return OvaleOptions.db.profile.source
						end,
					set = function(info, v)
							local oldSource = OvaleOptions.db.profile.source
							if oldSource ~= v then
								OvaleOptions.db.profile.source = v
								self:SetDefaultScript()
							end
						end,
					validate = function(info, v)
							local descTbl = self:GetDescriptions()
							for src in pairs(descTbl) do
								if src == v then
									return true
								end
							end
							return false
						end,
				},
				codeDisplay = {
					name = "Code",
					type = "input",
					multiline = 15,
					width = "full",
					disabled = true,
					dropdownHidden = true, cmdHidden = true,
					get = function(info)
							local source = OvaleOptions.db.profile.source
							local code = self.script[self.class][source].code
							if code then
								return string.gsub(code, "\t", "    ")
							else
								return ""
							end
						end,
					set = function(info, v) end,
				},
			},
		}
	end
	return options
end

local descriptions
function NerienOvaleScripts:GetDescriptions()
	if not descriptions then
		descriptions = { }
		for src, tbl in pairs(self.script[self.class]) do
			descriptions[src] = tbl.desc
		end
	end
	return descriptions
end

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

-- This function sets the default script to the chosen class script, falling back
-- to using Ovale's default class script.
--
-- This function touches deeply into Ovale table internals to change the default
-- code used as well as forcing Ovale to recompile the code and should really be
-- part of Ovale itself.
--
function NerienOvaleScripts:SetDefaultScript()
	local code = ""

	if self.script[self.class].Ovale then
		code = self.script[self.class].Ovale.code
	end

	local source = OvaleOptions.db.profile.source
	if self.script[self.class][source] then
		code = self.script[self.class][source].code
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

local firstInit = false
function NerienOvaleScripts:FirstInit()
	if firstInit then
		return
	end
	firstInit = true

	-- Add a "source" member to the defaults table for Ovale that is manipulated in this addon.
	local defaults = deepCopy(OvaleOptions.db.defaults)
	for _, tbl in pairs(defaults) do
		if type(tbl) == "table" then
			tbl.source = "Ovale"
		end
	end
	OvaleOptions.db:RegisterDefaults(defaults)

	local addonTitle = GetAddOnMetadata(ADDON_NAME, "Title")
	LibStub("AceConfig-3.0"):RegisterOptionsTable(addonTitle, self:GetOptions())
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonTitle)
end

function NerienOvaleScripts:OnEnable()
	self:FirstInit()
	self:SetDefaultScript()
end

function NerienOvaleScripts:OnDisable()
	self:SetDefaultScript()
end