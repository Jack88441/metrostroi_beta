ENT.Type            = "anim"

ENT.PrintName       = "Metro Clock (small)"
ENT.Category		= "Metrostroi (utility)"

ENT.Spawnable       = true
ENT.AdminSpawnable  = false

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "IntervalResetTime")
end
