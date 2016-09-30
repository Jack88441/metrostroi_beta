﻿--------------------------------------------------------------------------------
-- Электрические цепи 81-704-81-710 (Е, Еж, Ем)
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_707_Electric")

function TRAIN_SYSTEM:Initialize()
	print(1)
	self.TrainSolver = "E"
	self.ThyristorController = true

	-- Load all functions from base
	Metrostroi.BaseSystems["Electric"].Initialize(self)
	for k,v in pairs(Metrostroi.BaseSystems["Electric"]) do
		if type(v) == "function" then
			self[k] = v
		end
	end
end

function TRAIN_SYSTEM:Inputs(...)
	return Metrostroi.BaseSystems["Electric"].Inputs(self,...)
end
function TRAIN_SYSTEM:Outputs(...)
	return Metrostroi.BaseSystems["Electric"].Outputs(self,...)
end
function TRAIN_SYSTEM:TriggerInput(...)
	return Metrostroi.BaseSystems["Electric"].TriggerInput(self,...)
end
function TRAIN_SYSTEM:Think(...)
	return Metrostroi.BaseSystems["Electric"].Think(self,...)
end