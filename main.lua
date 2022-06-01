local ADDON_NAME, Private = ...
do
	local name = "Nerien's Ovale Scripts"
	local ovale = LibStub and LibStub:GetLibrary("ovale")
	local scripts = ovale and ovale.ioc and ovale.ioc.scripts
	if scripts then
		-- Export
		Private.name = name
		Private.scripts = scripts
		Private.initialized = true
		do
			-- backwards compatibility for Ovale<=9.0.43
			if not scripts.registerScript then
				scripts.registerScript = scripts.RegisterScript
			end
		end
		do
			if LibStub then
				-- Insert Unity bonus IDs into runeforgeBonusId table.
				local dbc = LibStub:GetLibrary("ovale/engine/dbc", true)
				if dbc and dbc.runeforgeBonusId then
					local t = dbc.runeforgeBonusId
					t[364758] = 8119 -- death knight
					t[364824] = 8120 -- demon hunter
					t[364814] = 8121 -- druid
					t[364743] = 8122 -- hunter
					t[364852] = 8123 -- mage
					t[364857] = 8124 -- monk
					t[364642] = 8125 -- paladin
					t[364911] = 8126 -- priest
					t[364922] = 8127 -- rogue
					t[364738] = 8128 -- shaman
					t[364939] = 8129 -- warlock
					t[364929] = 8130 -- warrior
				end
			end
		end
	end
end
