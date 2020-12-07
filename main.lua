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
	end
end
