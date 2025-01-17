--------------------------------------------------------------------------------
-- Источник питания БПСН
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("BPSN")

function TRAIN_SYSTEM:Initialize()
	self.XR3 = {
		[2] = 0,
		[3] = 0,
		[4] = 0,
		[5] = 0, -- Out only
		[6] = 0,
		[7] = 0,
	}
	self.XT3_1 = 0 -- General (battery) output
	self.XT3_4 = 0 -- Output for passenger lights
	self.XT1_2 = 0
	
	self.XT3_1ext = 0 -- External
	self.Active = 0
	self.LightsActive = 0
	self.Train:LoadSystem("ConverterProtection","Relay","Switch", {button = true})
end

function TRAIN_SYSTEM:Inputs()
	return { "XR3.2", "XR3.3", "XR3.4", "XR3.5", "XR3.6", "XR3.7", "XT3.1" }
end

function TRAIN_SYSTEM:Outputs()
	return { "XT3_1", "XT3_4", "XT1_2", "LightsActive" }
end


function TRAIN_SYSTEM:TriggerInput(name,value)
	if name == "XT3.1" then
		self.XT3_1ext = value
	else
		local idx = tonumber(string.sub(name,5,6)) or 0
		if self.XR3[idx] then
			if value > 0.5 
			then self.XR3[idx] = 1.0
			else self.XR3[idx] = 0.0
			end
		end
	end
end

function TRAIN_SYSTEM:Think()
	local Train = self.Train
	self.Train:WriteTrainWire(35,self.Train.RZP.Value)
	self.Train:WriteTrainWire(36,self.Train.ConverterProtection.Value)
	self.Train.RPU:TriggerInput("Set",self.Train:ReadTrainWire(36))
	if self.Train.RZP.Value > 0.5 and self.Train:ReadTrainWire(36) > 0 then
		self.Train.RZP:TriggerInput("Open",self.Train.A27.Value)
	end
	-- Get high-voltage input
	self.XT1_2 = Train.Electric.Aux750V * Train.KPP.Value * 1 -- P4
	-- Get battery input
	local XT3_1 = self.XT3_1ext
	
	-- Check if enable signal is present
	if self.XR3[2] > 0 then self.Active = 1 else self.Active = 0 end
	--self.LightsActive = 1
	--if self.XR3[3] > 0 then self.Active = 0 self.LightsActive = 0 end
	--if self.XR3[4] > 0 then self.LightsActive = 1 end
	--if self.XR3[6] > 0 then self.Active = 1 end
	--if self.XR3[7] > 0 then self.LightsActive = 1 end
	
	-- Undervoltage/overvoltage
	local voltage_bat = XT3_1
	if (self.XT1_2 > 550) and (self.XT1_2 < 975) then voltage_bat = 75 end
	if voltage_bat < 55 then self.Active = 0 self.LightsActive = 0 end
	if voltage_bat > 85 then self.Active = 0 self.LightsActive = 0 end
	if self.XT1_2 > 1000 then self.Train.RZP:TriggerInput("Close",1) end
	local voltage = 0
	if (self.XT1_2 > 550) and (self.XT1_2 < 975) then voltage = 75 end
	if voltage < 55 then self.Active = 0 self.LightsActive = 0 end
	-- Generate output
	self.XT3_1 = voltage * self.Active
	self.XT3_4 = voltage * self.Active
	Train.KPP:TriggerInput("Open",1.0 - self.Active)
	
	if self.Active == 0 and self.Active ~= self.NextActive and not self.ActiveTimer  then
		self.ActiveTimer = CurTime() + 1.3
	end
	if self.ActiveTimer  and CurTime() - self.ActiveTimer  > 0 then self.NextActive = 0 self.ActiveTimer = nil end
	if self.Active == 1 then 
		if self.ActiveTimer then self.ActiveTimer = nil  end
		self.NextActive = 1
	end
	 self.LightsActive = self.NextActive
end