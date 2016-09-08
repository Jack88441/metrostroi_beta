﻿--------------------------------------------------------------------------------
-- Панель управления E
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_508_Panel")

function TRAIN_SYSTEM:Initialize()
	-- Выключатель батареи (ВБ)
	self.Train:LoadSystem("VB","Relay","Switch", {av3 = true})

	-- Buttons on the panel
	self.Train:LoadSystem("DoorSelect","Relay","Switch", {switch = true, normally_closed = false })
	self.Train:LoadSystem("DIPon","Relay","Switch", {button = true})
	self.Train:LoadSystem("DIPoff","Relay","Switch", {button = true})
	self.Train:LoadSystem("VozvratRP","Relay","Switch", {button = true})
	self.Train:LoadSystem("RezMK","Relay","Switch", {vud = true})
	self.Train:LoadSystem("KU1","Relay","Switch", {switch = true})
	self.Train:LoadSystem("VAH","Relay","Switch", {switch = true})
	self.Train:LoadSystem("VAD","Relay","Switch", {switch = true})
	self.Train:LoadSystem("VUS","Relay","Switch", {switch = true})
	self.Train:LoadSystem("VUD1","Relay","Switch", { normally_closed = true, vud = true })
	self.Train:LoadSystem("VUD2","Relay","Switch", { normally_closed = true, vud = true }) -- Doors close
	self.Train.VUD2:TriggerInput("Block",1)
	self.Train:LoadSystem("VUD2L","Relay","Switch", { krishka = true }) -- Doors close
	self.Train:LoadSystem("VDL","Relay","Switch", {switch = true}) -- Doors left open
	self.Train:LoadSystem("KDL","Relay","Switch", {button = true})
	self.Train:LoadSystem("KDP","Relay","Switch", {button = true})
	self.Train:LoadSystem("KRZD","Relay","Switch", {button = true})
	self.Train:LoadSystem("KSN","Relay","Switch", {button = true})
	self.Train:LoadSystem("VZ1","Relay","Switch", {button = true})
	self.Train:LoadSystem("OtklAVU","Relay","Switch", {switch = true})
	self.Train:LoadSystem("ARS","Relay","Switch", {av = true})
	self.Train:LoadSystem("ALS","Relay","Switch", {switch = true})
	self.Train:LoadSystem("KVT","Relay","Switch", {button = true})
	--self.Train:LoadSystem("KB","Relay","Switch", {button = true})
	self.Train:LoadSystem("KRP","Relay","Switch", {vud = true})


	self.Train:LoadSystem("R_UNch","Relay","Switch", {switch = true})
	self.Train:LoadSystem("R_ZS","Relay","Switch", {switch = true})
	self.Train:LoadSystem("R_G","Relay","Switch", {switch = true})
	self.Train:LoadSystem("R_Radio","Relay","Switch", {switch = true})
	self.Train:LoadSystem("R_Program1","Relay","Switch", {programm = true})
	self.Train:LoadSystem("R_Program2","Relay","Switch", {programm = true})
	self.Train:LoadSystem("RC1","Relay","Switch",{ normally_closed = true })

	--self.Train:LoadSystem("Radio13","Relay","Switch", {button = true})
	--self.Train:LoadSystem("ARS13","Relay","Switch", {button = true})

	-- Педаль бдительности (ПБ)
	self.Train:LoadSystem("PB","Relay","Switch", {pb = true})

	-- Автоматические выключатели (АВ)
	self.Train:LoadSystem("VU3","Relay","Switch", {av = true})

	self.Train:LoadSystem("VU1","Relay","Switch", {av = true})
	self.Train:LoadSystem("VU2","Relay","Switch", {av = true})
	self.Train:LoadSystem("AV8B","Relay","Switch", {mainav = true})
	self.Train:LoadSystem("VU","Relay","Switch", {av = true, normally_closed = false})
	self.Train:LoadSystem("KDLK","Relay","Switch", { normally_closed = true })
	self.Train:LoadSystem("VDLK","Relay","Switch", { normally_closed = true })
	self.Train:LoadSystem("KDPK","Relay","Switch", { normally_closed = true })
	self.Train:LoadSystem("KAHK","Relay","Switch", { normally_closed = true })
	self.Train:LoadSystem("L_3","Relay","Switch",{switch = true})

	self.Train:LoadSystem("RST","Relay","Switch", {av = true})

	-- Map of AV switches to indexes on panel
	self:InitializeAVMap()

	self.CabinLight = 0
	self.HeadLights1 = 0
	self.HeadLights2 = 0
	self.HeadLights3 = 0
	self.RedLightLeft = 0
	self.RedLightRight = 0
	self.EmergencyLight = 0
	self.GreenRP = 0
	self.RedRP = 0
	self.KUP = 0
	self.V1 = 0
	self.AVU = 0
	self.Ring = 0
	self.SD = 0
	self.TrainBrakes = 0
	self.TrainRP = 0
	self.TrainDoors = 0
end

function TRAIN_SYSTEM:ClientInitialize()
	self:InitializeAVMap()
end

function TRAIN_SYSTEM:Outputs()
	return { "CabinLight", "HeadLights1", "HeadLights2", "HeadLights3",
			 "RedLightLeft", "RedLightRight", "EmergencyLight",
			 "GreenRP", "RedRP", "KUP", "V1", "AVU", "Ring", "SD",
			 "TrainBrakes", "TrainRP", "TrainDoors" }
end

function TRAIN_SYSTEM:InitializeAVMap()
	self.AVMap = {
		  61,55,54,56,27,21,10,53,43,45,42,41,
		"VU",64,63,50,51,23,14,75, 1, 2, 3,17,
		  62,29, 5, 6, 8,20,25,22,30,39,44,80,
		  65,"L_5",24,32,31,16,13,12, 7, 9,46,47
	}
end
