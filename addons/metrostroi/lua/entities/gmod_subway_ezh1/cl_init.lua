﻿include("shared.lua")


--------------------------------------------------------------------------------
ENT.ClientProps = {}
ENT.ButtonMap = {}

-- Main panel

ENT.ButtonMap["Main"] = {
	pos = Vector(451.5+9.635,-31.92,-5.71),
	ang = Angle(0,-93,90-50),
	width = 315,
	height = 240,
	scale = 0.0588,

	buttons = {
		----Лампы
		{ID = "GreenRP",x=42.2+41.3*3,y=58.4, radius=20, tooltip="Зеленая РП: Зелёная лампа реле перегрузки (Сигнализация перегрузки)\nRP: Green overload relay light (overload relay open on current train)"},
		{ID = "RedRP",	x=42.2+41.2*4,y=58.4, radius=20, tooltip="Красная РП: Красная лампа реле перегрузки\nRP: Red overload relay light (power circuits failed to assemble)"},
		{ID = "SD",		x=42.2+41.3*5,y=58.4, radius=20, tooltip="Синяя лампа СД: Сигнализация дверей поезда\nBlue door state light (doors are closed)"},
		----Кнопки

		{ID = "DIPonSet",			x=35.8+44*0, y=127.3, radius=20, tooltip="КУ4:Включение освещения\nTurn interior lights on"},
		{ID = "DIPoffSet",		x=35.8+44*1, y=127.3, radius=20, tooltip="КУ5:Отключение освещения\nTurn interior lights off"},
		{ID = "VozvratRPSet",	x=35.8+44*2, y=127.3, radius=20, tooltip="КУ9:Возврат РП\nReset overload relay"},
		{ID = "KSNSet",				x=35.8+44*3, y=127.3, radius=20,  tooltip="КУ8:Принудительное срабатывание РП на неисправном вагоне (сигнализация неисправности)\nKSN: Failure indication button"},
		{ID = "KDPSet",				x=35.8+44*5, y=127.3, radius=20, tooltip="КДП:Правые двери\nKDP: Right doors open"},

		{ID = "KDLSet",				x=96.8, y=171.8, radius=20, tooltip="КУ12: Кнопка левых дверей\nKDL: Left doors open"},
		{ID = "KRZDSet",			x=195.5, y=171.8, radius=20, tooltip="КУ10: Кнопка резервного закрытия дверей\nKRZD: Emergency door closing"},

		----Down Panel
		{ID = "KU1Toggle",			x=49,y=190,radius=20, tooltip="КУ1:Включение мотор-компрессора\nTurn motor-compressor on"},
		{ID = "VUD1Toggle",		x=245,y=190,radius=20, tooltip="КУ2: Закрытие дверей\nKU2: Door control toggle (close doors)"},	
		
	}
}

Metrostroi.ClientPropForButton("DIPon",{
	panel = "Main",
	button = "DIPonSet",
	model = "models/metrostroi_train/81-703/cabin_button_red.mdl",
	ang = 90,
	z = 2,
})
Metrostroi.ClientPropForButton("VozvratRP",{
	panel = "Main",
	button = "VozvratRPSet",
	model = "models/metrostroi_train/81-703/cabin_button_black.mdl",
	ang = 90,
	z = 2,
})

Metrostroi.ClientPropForButton("DIPoff",{
	panel = "Main",
	button = "DIPoffSet",
	model = "models/metrostroi_train/81-703/cabin_button_black.mdl",
	ang = 90,
	z = 2,
})
Metrostroi.ClientPropForButton("KSN",{
	panel = "Main",
	button = "KSNSet",
	model = "models/metrostroi_train/81-703/cabin_button_black.mdl",
	ang = 90,
	z = 2,
})
Metrostroi.ClientPropForButton("KDP",{
	panel = "Main",
	button = "KDPSet",
	model = "models/metrostroi_train/81-703/cabin_button_black.mdl",
	ang = 90,
	z = 2,
})

Metrostroi.ClientPropForButton("KDL",{
	panel = "Main",
	button = "KDLSet",
	model = "models/metrostroi_train/81-703/cabin_button_red.mdl",
	ang = 90,
	z = 2,
})
Metrostroi.ClientPropForButton("KRZD",{
	panel = "Main",
	button = "KRZDSet",
	model = "models/metrostroi_train/81-703/cabin_button_black.mdl",
	ang = 90,
	z = 2,
})

Metrostroi.ClientPropForButton("VUD",{
	panel = "Main",
	button = "VUD1Toggle",
	model = "models/metrostroi_train/switches/vudblack.mdl",
	z=-25,
})
Metrostroi.ClientPropForButton("KU1",{
	panel = "Main",
	button = "KU1Toggle",
	model = "models/metrostroi_train/switches/vudblack.mdl",
	z=-25,
})

Metrostroi.ClientPropForButton("GreenRP",{
	panel = "Main",
	button = "GreenRP",
	model = "models/metrostroi_train/81-703/cabin_lamp_green.mdl",
	z=9,
})
Metrostroi.ClientPropForButton("RedRP",{
	panel = "Main",
	button = "RedRP",
	model = "models/metrostroi_train/81-703/cabin_lamp_red4.mdl",
	z=9,
})
Metrostroi.ClientPropForButton("SD",{
	panel = "Main",
	button = "SD",
	model = "models/metrostroi_train/81-703/cabin_lamp_white.mdl",
	z=9,
})





ENT.ButtonMap["Back2"] = {
	pos = Vector(405.5,25.9,4.0),
	ang = Angle(0,90,90),
	width = 280,
	height = 340,
	scale = 0.1088,

	buttons = {
	{x=0, y=12, w=280, h=130, tooltip="Блок высоковольтных предохранителей\nBlock Fuse HV fuses"},
	{x=0, y=170, w=300, h=270, tooltip="Ящик с аппаратами для подзаряда аккумуляторной батареи и дверной воздухораспределитель\nThe box with the devices for battery recharging and door pressure diffuser"},
	{x=280, y=170, w=80, h=300, tooltip="Печка\nThe heater"},
	}
}




--VU1 Panel
ENT.ButtonMap["VU1"] = {
	pos = Vector(455,45,46),
	ang = Angle(0,270,110),
	width = 100,
	height = 110,
	scale = 0.0625,

	buttons = {
		
	}
}


--VU Panel
ENT.ButtonMap["VU"] = {
	pos = Vector(456+7.6,-16.15,23.0),
	ang = Angle(0,270,90),
	width = 100,
	height = 220,
	scale = 0.0625,

	buttons = {
		{ID = "VUToggle", x=0, y=110, w=100, h=110, tooltip="ВУ: Выключатель Управления\nVUToggle"},

	}
}
Metrostroi.ClientPropForButton("VU",{
	panel = "VU",
	button = "VUToggle",
	model = "models/metrostroi_train/Equipment/vu22_brown.mdl",
	z=20,
	ang = 180,
})

ENT.ButtonMap["Stopkran"] = {
	pos = Vector(454+6,14,20.7),
	ang = Angle(0,-90,90),
	width = 200,
	height = 1300,
	scale = 0.1/2,
		buttons = {
			{ID = "STOPKRANToggle",x=0, y=0, w=200, h=1300, tooltip="Стопкран\nEmergency brake"},
	}
}





ENT.ButtonMap["Tsepi"] = {
	pos = Vector(456+7.6,-16.15,10.5),
	ang = Angle(0,273,90),
	width = 85,
	height = 50,
	scale = 0.0625,

	buttons = {
		--{ID = "VUSToggle", x=0, y=0, w=100, h=110, tooltip="Прожектор\nVUSoggle"},
		{x=0,y=0,w=85,h=50,tooltip="Напряжение цепей управления"},
	}
}

ENT.ButtonMap["AVMain"] = {
	pos = Vector(403.5,40.8,42),
	ang = Angle(0,90,90),
	width = 335,
	height = 380,
	scale = 0.0625,

	buttons = {
		{ID = "AV8BToggle", x=0, y=0, w=300, h=380, tooltip="АВ-8Б: Автоматическй выключатель (Вспомогательные цепи высокого напряжения)\n"},
	}
}
Metrostroi.ClientPropForButton("AV8B",{
	panel = "AVMain",
	button = "AV8BToggle",
	model = "models/metrostroi_train/switches/automain.mdl",
	z=43,
	skin=1
})

---AV1 Panel
ENT.ButtonMap["AV1"] = {
	pos = Vector(403.5,41,16),
	ang = Angle(0,90,90),
	width = 290+0,
	height = 155,
	scale = 0.0625,

	buttons = {
		{ID = "VU3Toggle", x=0, y=0, w=100, h=140, tooltip="ВУ3: Освещение кабины\n"},
		{ID = "VU2Toggle", x=100, y=0, w=100, h=140, tooltip="ВУ2: Аварийное освещение 25В\n"},
		{ID = "VU1Toggle", x=200, y=0, w=100, h=140, tooltip="ВУ1: Печь отопления кабины ПТ-6\n"},
	}
}
for k,v in pairs(ENT.ButtonMap["AV1"].buttons) do
	if not v.ID then continue end
	Metrostroi.ClientPropForButton(v.ID:sub(0,-7),{
		panel = "AV1",
		button = v.ID,
		model = "models/metrostroi_train/Equipment/vu22_brown.mdl",
		z=10,
		ang = 180,
	})
end

ENT.ButtonMap["AV2"] = {
	pos = Vector(403.5,30.40,31.1),
	ang = Angle(0,90,90),
	width = 180,
	height = 136,
	scale = 0.0625,

	buttons = {
		{ID = "RSTToggle", x=0, y=0, w=180, h=136, tooltip="+50В: Радиооповещение и поездная радио связь\nRST: Radio 50V"},
		{ID = "RSTPl", x=42, y=75, radius=60, tooltip="Пломба РСТ +50В\nRST plomb"},
	}
}
for k,v in pairs(ENT.ButtonMap["AV2"].buttons) do
	if not v.ID then continue end
	if v.ID:find("Pl") then
		Metrostroi.ClientPropForButton(v.ID,{
			panel = "AV2",
			button = v.ID,
			model = "models/metrostroi_train/switches/autoplombr.mdl",
			z=18,
			propname = false,
			ang=0,
		})
		continue
	end
	Metrostroi.ClientPropForButton(v.ID:sub(0,-7),{
		panel = "AV2",
		button = v.ID,
		model = "models/metrostroi_train/Equipment/vu22_brown.mdl",
		z=20,
		ang = 180,
	})
end


-- Announcer panel
ENT.ButtonMap["AnnouncerDisplay"] = {
	pos = Vector(449.3,-53,17.4),
	ang = Angle(0,-0,90),
	width = 10,
	height = 10,
	scale = 0.012,
}

-- Battery panel
ENT.ButtonMap["Battery"] = {
	pos = Vector(403.5,23.24,20.5),
	ang = Angle(0,90,90),
	width = 250,
	height = 136,
	scale = 0.0625,

	buttons = {
		{ID = "VBToggle", x=0, y=0, w=250, h=136, tooltip="АБ: Выключатель аккумуляторной батареи (Вспомогательные цепи низкого напряжения)\nVB: Battery on/off"},
	}
}
Metrostroi.ClientPropForButton("VB",{
	panel = "Battery",
	button = "VBToggle",
	model = "models/metrostroi_train/Equipment/vu22_brown_3.mdl",
	z=15,
	ang = 180,
})

-- Parking brake panel
ENT.ButtonMap["ParkingBrake"] = {
	pos = Vector(460,46.0,-2.0),
	ang = Angle(0,-70,90),
	width = 400,
	height = 400,
	scale = 0.0625,

	buttons = {
		{ID = "ParkingBrakeLeft",x=0, y=0, w=200, h=400, tooltip="Поворот колеса ручного тормоза"},
		{ID = "ParkingBrakeRight",x=200, y=0, w=200, h=400, tooltip="Поворот колеса ручного тормоза"},
	}
}

-- Train driver helpers panel
ENT.ButtonMap["HelperPanel"] = {
	pos = Vector(452.5,61.5,18.44),
	ang = Angle(0,-17.5,90),
	width = 60,
	height = 188,
	scale = 0.0625,

	buttons = {
		{ID = "VDLSet",     x=30, y=42, radius=30, tooltip="ВДЛ: Выключатель левых дверей\nVDL: Left doors open"},
		{ID = "VUD2LToggle", x=0, y=110, w=60,h=20, tooltip="Блокировка ВУД2\nVUD2 lock"},
		{ID = "VUD2Toggle", x=30, y=138, radius=30, tooltip="ВУД2: Выключатель управления дверьми\nVUD2: Door control toggle (close doors)"},
	}
}
Metrostroi.ClientPropForButton("VUD2",{
	panel = "HelperPanel",
	button = "VUD2Toggle",
	model = "models/metrostroi_train/switches/vudblack.mdl",
	z = 0,
})
Metrostroi.ClientPropForButton("VUD2l",{
	panel = "HelperPanel",
	button = "VUD2Toggle",
	model = "models/metrostroi_train/switches/vudlock.mdl",
	z = 0,
})
Metrostroi.ClientPropForButton("VDL",{
	panel = "HelperPanel",
	button = "VDLSet",
	model = "models/metrostroi_train/switches/vudblack.mdl",
	z = 0,
})

-- Help panel
--[[ENT.ButtonMap["Help"] = {
	pos = Vector(406,-45,52),
	ang = Angle(0,90,90),
	width = 28,
	height = 20,
	scale = 0.5,

	buttons = {
		{ID = "ShowHelp", x=0, y=0, w=28,h=20, tooltip="Помощь в вождении поезда\nShow help on driving the train"},
	}
}]]

-- Pneumatic instrument panel 2
ENT.ButtonMap["PneumaticManometer"] = {
	pos = Vector(451.73+7.6,-54,14.04),
	ang = Angle(0,-144,90),
	width = 76,
	height = 70,
	scale = 0.0625,

	buttons = {
		{x=68,y=65,radius=68,tooltip="Давление в магистралях (красная: тормозной, чёрная: напорной)\nPressure in pneumatic lines (red: brake line, black: train line)"},
	}
}
-- Pneumatic instrument panel
ENT.ButtonMap["PneumaticPanels"] = {
	pos = Vector(454.07+7.6,-50.11,5.9),
	ang = Angle(0,-90-27,90),

	width = 76,
	height = 70,
	scale = 0.0625,

	buttons = {
		{x=38,y=35,radius=35,tooltip="Тормозной манометр: Давление в тормозных цилиндрах (ТЦ)\nBrake cylinder pressure"},
	}
}
ENT.ButtonMap["DriverValveBLDisconnect"] = {
	pos = Vector(443.5+7,-53,-37.61),
	ang = Angle(-90,0,0),
	width = 200,
	height = 90,
	scale = 0.0625,

	buttons = {
		{ID = "DriverValveBLDisconnectToggle", x=0, y=0, w=200, h=90, tooltip="Кран двойной тяги тормозной магистрали\nTrain line disconnect valve"},
	}
}
ENT.ButtonMap["DriverValveTLDisconnect"] = {
	pos = Vector(447+5,-46,-31),
	ang = Angle(-90,-10,0),
	width = 200,
	height = 90,
	scale = 0.0625,

	buttons = {
		{ID = "DriverValveTLDisconnectToggle", x=0, y=0, w=200, h=90, tooltip="Кран двойной тяги напорной магистрали\nBrake line disconnect valve"},
	}
}
ENT.ButtonMap["Meters"] = {
	pos = Vector(461.65213,-56.696617,37.528275),
	ang = Angle(0,-148,90),
	width = 73,
	height = 140,
	scale = 0.0625,

	buttons = {
		{x=13, y=22, w=60, h=50, tooltip="Вольтметр высокого напряжения (кВ)\nHV voltmeter (kV)"},
		{x=13, y=81, w=60, h=50, tooltip="Амперметр (А)\nTotal ampermeter (A)"},
	}
}


--These values should be identical to those drawing the schedule
local col1w = 80 -- 1st Column width
local col2w = 32 -- The other column widths
local rowtall = 30 -- Row height, includes -only- the usable space and not any lines

local rowamount = 16 -- How many rows to show (total)
--[[ENT.ButtonMap["Schedule"] = {
	pos = Vector(442.1,-60.7,26),
	ang = Angle(0,-110,90),
	width = (col1w + 2 + (1 + col2w) * 3),
	height = (rowtall+1)*rowamount+1,
	scale = 0.0625/2,

	buttons = {
		{x=1, y=1, w=col1w, h=rowtall, tooltip="М №\nRoute number"},
		{x=1, y=rowtall*2+3, w=col1w, h=rowtall, tooltip="П №\nPath number"},

		{x=col1w+2, y=1, w=col2w*3+2, h=rowtall, tooltip="ВРЕМЯ ХОДА\nTotal schedule time"},
		{x=col1w+2, y=rowtall+2, w=col2w*3+2, h=rowtall, tooltip="ИНТ\nTrain interval"},

		{x=col1w+2, y=rowtall*2+3, w=col2w, h=rowtall, tooltip="ЧАС\nHour"},
		{x=col1w+col2w+3, y=rowtall*2+3, w=col2w, h=rowtall, tooltip="МИН\nMinute"},
		{x=col1w+col2w*2+4, y=rowtall*2+3, w=col2w, h=rowtall, tooltip="СЕК\nSecond"},
		{x=col1w+2, y=rowtall*3+4, w=col2w*3+2, h=(rowtall+1)*(rowamount-3)-1, tooltip="Arrival times"}, -- NEEDS TRANSLATING

		{x=1, y=rowtall*3+4, w=col1w, h=(rowtall+1)*(rowamount-3)-1, tooltip="Station name"}, -- NEEDS TRANSLATING
	}
}]]

-- Temporary panels (possibly temporary)
ENT.ButtonMap["FrontPneumatic"] = {
	pos = Vector(475,-45.0,-50.0),
	ang = Angle(0,90,90),
	width = 900,
	height = 100,
	scale = 0.1,
	buttons = {
		{ID = "FrontBrakeLineIsolationToggle",x=150, y=50, radius=32, tooltip="Концевой кран тормозной магистрали"},
		{ID = "FrontTrainLineIsolationToggle",x=750, y=50, radius=32, tooltip="Концевой кран напорной магистрали"},
	}
}
ENT.ButtonMap["RearPneumatic"] = {
	pos = Vector(-475,45.0,-50.0),
	ang = Angle(0,270,90),
	width = 900,
	height = 100,
	scale = 0.1,
	buttons = {
		{ID = "RearTrainLineIsolationToggle",x=150, y=50, radius=32, tooltip="Концевой кран напорной магистрали"},
		{ID = "RearBrakeLineIsolationToggle",x=750, y=50, radius=32, tooltip="Концевой кран тормозной магистрали"},
	}
}
ENT.ButtonMap["GV"] = {
	pos = Vector(139,66,-54),
	ang = Angle(0,180,90),
	width = 170,
	height = 170,
	scale = 0.1,
	buttons = {
		{ID = "GVToggle",x=0, y=0, w= 170,h = 170, tooltip="Главный выключатель"},
	}
}
ENT.ButtonMap["AirDistributor"] = {
	pos = Vector(-168,68.6,-50),
	ang = Angle(0,180,90),
	width = 170,
	height = 80,
	scale = 0.1,
	buttons = {
		{ID = "AirDistributorDisconnectToggle",x=0, y=0, w= 170,h = 80, tooltip="Выключение воздухораспределителя"},
	}
}


-- UAVA
ENT.ButtonMap["UAVAPanel"] = {
	pos = Vector(444+5,56,-5),
	ang = Angle(0,-70,90),
	width = 230,
	height = 170,
	scale = 0.0625,

	buttons = {
		{ID = "UAVAToggle",x=230/2, y=0, w=230/2, h=170, tooltip="УАВА: Универсальный Автоматический Выключатель Автостопа\nUAVA: Universal Automatic Autostop Disabler"},
		{ID = "UAVAContactSet",x=0, y=0, w=230/2, h=170, tooltip="УАВА: Универсальный Автоматический Выключатель Автостопа (восстановление контактов)\nUAVA: Universal Automatic Autostop Disabler(contacts reset)"},
	}
}



-- Wagon numbers
ENT.ButtonMap["TrainNumber1"] = {
	pos = Vector(-440,-68,-11),
	ang = Angle(0,0,90),
	width = 130,
	height = 55,
	scale = 0.20,
}
ENT.ButtonMap["TrainNumber2"] = {
	pos = Vector(416,68,-11),
	ang = Angle(0,180,90),
	width = 130,
	height = 55,
	scale = 0.20,
}

ENT.ButtonMap["InfoTableSelect"] = {
	pos = Vector(454.0+12.15,-27.0,50.0),
	ang = Angle(0,-90,90),
	width = 250,
	height = 100,
	scale = 0.1,


	buttons = {
		{ID = "PrevSign",x=0,y=0,w=50,h=100, tooltip="Предыдущая надпись\nPrevious sign"},
		{ID = "NextSign",x=50,y=0,w=50,h=100, tooltip="Следующая надпись\nNext sign"},

		{ID = "Num2P",x=150,y=0,w=50,h=50, tooltip="Маршрут: Увеличить число 2\nRoute: Increase 2nd number"},
		{ID = "Num2M",x=150,y=50,w=50,h=50, tooltip="Маршрут: Уменьшить число 2\nRoute: Decrease 2nd number"},
		{ID = "Num1P",x=200,y=0,w=50,h=50, tooltip="Маршрут: Увеличить число 1\nRoute: Increase 1st number"},
		{ID = "Num1M",x=200,y=50,w=50,h=50, tooltip="Маршрут: Уменьшить число 1\nRoute: Decrease 1st number"},
	}
}

ENT.ButtonMap["Front"] = {
	pos = Vector(468,16,43.4),
	ang = Angle(0,-90,90),
	width = 650,
	height = 1780,
	scale = 0.1/2,
	buttons = {
		{ID = "FrontDoor",x=0,y=0,w=650,h=1780, tooltip="Передняя дверь\nFront door"},
	}
}

ENT.ButtonMap["CabinDoor"] = {
	pos = Vector(416,64,43.4),
	ang = Angle(0,0,90),
	width = 642,
	height = 1780,
	scale = 0.1/2,
	buttons = {
		{ID = "CabinDoor1",x=0,y=0,w=642,h=1780, tooltip="Дверь в кабину машиниста\nCabin door"},
	}
}

ENT.ButtonMap["PassengerDoor"] = {
	pos = Vector(384,-16,43.4),
	ang = Angle(0,90,90),
	width = 642,
	height = 1900,
	scale = 0.1/2,
	buttons = {
		{ID = "PassengerDoor",x=0,y=0,w=642,h=1900, tooltip="Дверь из салона\nPassenger door"},
	}
}

--------------------------------------------------------------------------------
ENT.ClientPropsInitialized = false
ENT.ClientProps["brake"] = {
	model = "models/metrostroi_train/81-703/cabin_cran_334.mdl",
	pos = Vector(448.62+7.6,-51.69,-3.0),
	ang = Angle(0,-133,0),
}
ENT.ClientProps["controller"] = {
	model = "models/metrostroi_train/81-707/kv_ezh.mdl",
	pos = Vector(451.36+6.4,-24.73,-3.5),
	ang = Angle(0,180+15,0)
}


ENT.ClientProps["reverser"] = {
	model = "models/metrostroi/81-717/reverser.mdl",
	pos = Vector(451.36+6.4,-24.38,-3.9),
	ang = Angle(0,45,90)
}
ENT.ClientProps["brake_disconnect"] = {
	model = "models/metrostroi_train/81-707/cran1.mdl",
	pos = Vector(442.0+7.6,-55.40,-27.21),
	ang = Angle(0,92,-90),
}
ENT.ClientProps["train_disconnect"] = {
	model = "models/metrostroi_train/81-707/cran3.mdl",
	pos = Vector(444.782483+8.1,-50.646734,-27.333017),
	ang = Angle(90,-106,90),
}


ENT.ClientProps["parking_brake"] = {
	model = "models/metrostroi_train/81-703/cabin_parking.mdl",
	pos = Vector(449.118378+7.6,33.493385,-14.713276),
	ang = Angle(-90.000000,8.000000,0.000000),
}

--------------------------------------------------------------------------------
ENT.ClientProps["train_line"] = {
	model = "models/metrostroi_train/Equipment/arrow_nm.mdl",
	pos = Vector(448.20+7.94,-54.81,12.1-2.56),
	ang = Angle(-90,-90-48,90)
}
ENT.ClientProps["brake_line"] = {
	model = "models/metrostroi_train/Equipment/arrow_tm.mdl",
	pos = Vector(448.20+7.95,-54.84,12.1-2.56),
	ang = Angle(-90,-90-48,90)
}

ENT.ClientProps["brake_cylinder"] = {
	model = "models/metrostroi_train/Equipment/arrow_nm.mdl",
	pos = Vector(453.199+7.4,-52.52,2.73000),
	ang = Angle(222,80,-90.000000),
}
----------------------------------------------------------------
ENT.ClientProps["voltmeter"] = {
	model = "models/metrostroi_train/Equipment/arrow_volt3.mdl",
	pos = Vector(450.284607+6.25,-57.887834,30.2),
	ang = Angle(90,35,-90)
}

ENT.ClientProps["ampermeter"] = {
	model = "models/metrostroi_train/Equipment/arrow_volt3.mdl",
	pos = Vector(450.284607+6.25,-57.887834,26.3),
	ang = Angle(90,35,-90)
}

ENT.ClientProps["volt1"] = {
	model = "models/metrostroi_train/Equipment/arrow_volt1.mdl",
	pos = Vector(458.81455+4.2,-19.63349,1.2),
	ang = Angle(50,-90,90),
}



--------------------------------------------------------------------------------
ENT.ClientProps["gv"] = {
	model = "models/metrostroi/81-717/gv.mdl",
	pos = Vector(130,62.5,-65),
	ang = Angle(-90,0,-90)
}
ENT.ClientProps["gv_wrench"] = {
	model = "models/metrostroi/81-717/reverser.mdl",
	pos = Vector(130,62.5,-65),
	ang = Angle(0,0,0)
}
--------------------------------------------------------------------------------
--[[ENT.ClientProps["book"] = {
	model = "models/props_lab/binderredlabel.mdl",
	pos = Vector(401.763123,-32.429512,48.305576),
	ang = Angle(53,0,90),
}]]



ENT.ClientProps["Ema_salon"] = {
	model = "models/metrostroi_train/81-707/81-708_salon.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0)
}
ENT.ClientProps["Ema_salon2"] = {
	model = "models/metrostroi_train/81-508/81-508_underwagon.mdl",
	pos = Vector(0,1,-18),
	ang = Angle(0,0,0)
}
ENT.ClientProps["Lamps_emer"] = {
	model = "models/metrostroi_train/81-508/81-508_lamps_emer.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0)
}
ENT.ClientProps["Lamps_full"] = {
	model = "models/metrostroi_train/81-508/81-508_lamps.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0)
}

ENT.ClientProps["FrontBrake"] = {--
	model = "models/metrostroi_train/81/tmiso.mdl",
	pos = Vector(445, -30, -68),
	ang = Angle(0,-90,0)
}
ENT.ClientProps["FrontTrain"] = {--
	model = "models/metrostroi_train/81/nmsio.mdl",
	pos = Vector(445, 30, -68),
	ang = Angle(0,-90,0)
}
ENT.ClientProps["RearBrake"] = {--
	model = "models/metrostroi_train/81/tmiso.mdl",
	pos = Vector(-450+7, -30, -68),
	ang = Angle(0,90,0)
}
ENT.ClientProps["RearTrain"] = {--
	model = "models/metrostroi_train/81/nmsio.mdl",
	pos = Vector(-450+7, 30, -68),
	ang = Angle(0,90,0)
}

ENT.ClientProps["FrontBrake"] = {--
	model = "models/metrostroi_train/81/tmiso.mdl",
	pos = Vector(445, -30, -68),
	ang = Angle(0,-90,0)
}
ENT.ClientProps["FrontTrain"] = {--
	model = "models/metrostroi_train/81/nmsio.mdl",
	pos = Vector(445, 30, -68),
	ang = Angle(0,-90,0)
}
ENT.ClientProps["RearBrake"] = {--
	model = "models/metrostroi_train/81/tmiso.mdl",
	pos = Vector(-450+7, -30, -68),
	ang = Angle(0,90,0)
}
ENT.ClientProps["RearTrain"] = {--
	model = "models/metrostroi_train/81/nmsio.mdl",
	pos = Vector(-450+7, 30, -68),
	ang = Angle(0,90,0)
}

	
--------------------------------------------------------------------------------
-- Add doors
local function GetDoorPosition(i,k,j)
	if j == 0
	then return Vector(344.9-0.1*k     - 233.6*i,-63.86*(1-2.02*k),-5.75)
	else return Vector(344.9-0.1*(1-k) - 233.6*i,-63.86*(1-2.02*k),-5.75)
	end
end
for i=0,3 do
	for k=0,1 do
		ENT.ClientProps["door"..i.."x"..k.."a"] = {
			model = "models/metrostroi_train/81-707/81-707_door_right.mdl",
			pos = GetDoorPosition(i,k,0),
			ang = Angle(0,90 + 180*k,0)
		}
		ENT.ClientProps["door"..i.."x"..k.."b"] = {
			model = "models/metrostroi_train/81-707/81-707_door_left.mdl",
			pos = GetDoorPosition(i,k,1),
			ang = Angle(0,90 + 180*k,0)
		}
	end
end
ENT.ClientProps["door1"] = {
	model = "models/metrostroi_train/81-707/81-707_door_tor.mdl",
	pos = Vector(460.62+7.4,-14.53,-7.23),
	ang = Angle(0,-90,0),
}
ENT.ClientProps["door2"] = {
	model = "models/metrostroi_train/81-707/81-707_door_tor.mdl",
	pos = Vector(-462.6-8,16.53,-7.24),
	ang = Angle(0,90,0),
}
ENT.ClientProps["door3"] = {
	model = "models/metrostroi_train/81-508/81-508_door_pass.mdl",
	pos = Vector(396.7+5.5,17.84,-10),
	ang = Angle(0,-90,0),
}
ENT.ClientProps["door4"] = {
	model = "models/metrostroi_train/81-707/81-707_door_cab.mdl",
	pos = Vector(411.17+7.6,66.05,-6.38),
	ang = Angle(0,-90,0),
}
--[[ENT.ClientProps["UAVA"] = {
	model = "models/metrostroi/81-717/uava_body.mdl",
	pos = Vector(400,61,-8),--Vector(415.0,-58.5,-18.2),
	ang = Angle(0,0,0)
}]]
ENT.ClientProps["UAVALever"] = {
	model = "models/metrostroi_train/81-703/cabin_uava.mdl",
	pos = Vector(449+7.7,56.0,-10.24349),
	ang = Angle(0,-90,90)
}

ENT.ClientProps["RedLights"] = {
	model = "models/metrostroi_train/81-703/81-703_red_light.mdl",
	pos = Vector(-23+7.2,1,-191),
	ang = Angle(0,0,0.000000),
}
ENT.ClientProps["DistantLights"] = {
	model = "models/metrostroi_train/81-703/81-703_projcetor_light.mdl",
	pos = Vector(-23+8.0,1,-191),
	ang = Angle(00.000000,0.000000,0.000000),
}
ENT.ClientProps["WhiteLights"] = {
	model = "models/metrostroi_train/81-703/81-703_front_light.mdl",
	pos = Vector(-23+7.6,1,-191),
	ang = Angle(0,0,0),
}



ENT.Texture = "7"
ENT.OldTexture = nil
--local X = Material( "metrostroi_skins/81-717/6.png")

function ENT:UpdateTextures() 
	local texture = Metrostroi.Skins["train"][self:GetNW2String("texture")]
	local passtexture = Metrostroi.Skins["pass"][self:GetNW2String("passtexture")]
	local cabintexture = Metrostroi.Skins["cab"][self:GetNW2String("cabtexture")]
	for _,self in pairs(self.ClientEnts) do
		if not IsValid(self) then continue end
		for k,v in pairs(self:GetMaterials()) do
			local tex = string.Explode("/",v)
			tex = tex[#tex]
			if cabintexture and cabintexture.textures[tex] then
				self:SetSubMaterial(k-1,cabintexture.textures[tex])
			end
			if passtexture and passtexture.textures[tex] then
				self:SetSubMaterial(k-1,passtexture.textures[tex])
			end
			if texture and texture.textures[tex] then
				self:SetSubMaterial(k-1,texture.textures[tex])
			end
		end
	end
end
--------------------------------------------------------------------------------
function ENT:Think()
	self.BaseClass.Think(self)
	if self.Texture ~= self:GetNW2String("texture") then
		self.Texture = self:GetNW2String("texture")
		self:UpdateTextures()
	end
	if self.PassTexture ~= self:GetNW2String("passtexture") then
		self.PassTexture = self:GetNW2String("passtexture")
		self:UpdateTextures()
	end
	if self.CabinTexture ~= self:GetNW2String("cabtexture") then
		self.CabinTexture = self:GetNW2String("cabtexture")
		self:UpdateTextures()
	end
	--print(self.FrontDoor,self:GetPackedBool(114))
	--print(self.RearDoor,self:GetPackedBool(156))
	--[[
	if self.FrontDoor < 90 and self:GetPackedBool(157) or self.FrontDoor > 0 and not self:GetPackedBool(157) then
		--local FrontDoorData = self.ClientProps["door1"]
		--FrontDoor:SetLocalPos(FrontDoorData.pos + Vector(-2,-0,0))
		self.FrontDoor = math.max(0,math.min(90,self.FrontDoor + (self:GetPackedBool(157)  and 1 or -1)*self.DeltaTime*180))
		self:ApplyMatrix("door1",Vector(0,-16,0),Angle(0,self.FrontDoor,0))
		if not self.ButtonMapMatrix["InfoTable"] then
			self.ButtonMapMatrix["InfoTable"] = {}
			self.ButtonMapMatrix["InfoTable"].scale = 0.1/2
		end
		self.ButtonMapMatrix["InfoTable"].ang = Angle(0,90+self.FrontDoor,90)
		self.ButtonMapMatrix["InfoTable"].pos = Vector(458.0,-16.0,12.0) + Vector(0,1.5,0)*self.FrontDoor/90

	end
	]]
	local transient = (self.Transient or 0)*0.05
	if (self.Transient or 0) ~= 0.0 then self.Transient = 0.0 end

	-- Parking brake animation
	self.ParkingBrakeAngle = self.ParkingBrakeAngle or 0
	self.TrueBrakeAngle = self.TrueBrakeAngle or 0
	self.TrueBrakeAngle = self.TrueBrakeAngle + (self.ParkingBrakeAngle - self.TrueBrakeAngle)*2.0*(self.DeltaTime or 0)
	if self.ClientEnts and self.ClientEnts["parking_brake"] then
		self.ClientEnts["parking_brake"]:SetPoseParameter("position",1.0-((self.TrueBrakeAngle % 360)/360))
	end
	local Lamps = self:GetPackedBool(20) and 0.6 or 1
	self:ShowHideSmooth("Lamps_emer",self:Animate("lamps_emer",self:GetPackedBool("Lamps_emer") and Lamps or 0,0,1,6,false))
	self:ShowHideSmooth("Lamps_full",self:Animate("lamps_full",self:GetPackedBool("Lamps_full") and Lamps or 0,0,1,6,false))

	--self:ShowHideSmooth("RK",self:Animate("RK_hs",self:GetPackedBool("RK") and 1 or 0,0,1,5,false))
	--self:ShowHideSmooth("LVD",self:Animate("LVD_hs",self:GetPackedBool("LVD") and 1 or 0,0,1,5,false))
	--self:ShowHideSmooth("LST",self:Animate("LST_hs",self:GetPackedBool("LST") and 1 or 0,0,1,5,false))
	--self:ShowHideSmooth("GreenRP",self:Animate("GreenRP_hs",self:GetPackedBool(36) and 1 or 0,0,1,5,false))
	
	self:ShowHideSmooth("RedRP",self:Animate("RedRP_hs",self:GetPackedBool(35) and 1 or 0,0,1,5,false) + self:Animate("RedLSN_hs",self:GetPackedBool(131) and 1 or 0,0,0.4,5,false))
	self:ShowHideSmooth("SN",self:Animate("GreenRP_hs",self:GetPackedBool(131) and 1 or 0,0,0.7,8,false))
	self:ShowHideSmooth("GreenRP",self:Animate("RedRP_hs",self:GetPackedBool(36) and 1 or 0,0,1,5,false))
	self:ShowHideSmooth("SD",self:Animate("Doors_hs",self:GetPackedBool(40) and 0 or 1,0,1,5,false))
	self:ShowHideSmooth("Red",self:GetPackedBool(37) and 1 or 0,0,1,5,false)
	
	self:Animate("GreenRP",				self:GetPackedBool("KSN") and 0 or 1, 	0,1, 12, false)
	
	---SCECIAL EM-509 EM-509 and Ezh with no ARS
	self:Animate("UKS",				self:GetPackedBool(134) and 1 or 0, 	0,1, 5, false)
	self:Animate("KRR",				self:GetPackedBool(163) and 1 or 0,0,1, 16, false)
	self:Animate("KRP",				self:GetPackedBool(113) and 1 or 0,0,1, 16, false)


	self:Animate("AV8B",self:GetPackedBool("AV8B") and 1 or 0, 	0,1, 8, false)

	self:Animate("RST",self:GetPackedBool("RST") and 0 or 1, 	0,1, 12, false)
	self:Animate("VSOSD",self:GetPackedBool("VSOSD") and 0 or 1, 	0,1, 12, false)
	self:HideButton("RSTToggle",self:GetPackedBool("RSTPl"))
	self:HideButton("RSTPl",not self:GetPackedBool("RSTPl"))

	self:SetCSBodygroup("RSTPl",1,self:GetPackedBool("RSTPl") and 0 or 1)

	self:Animate("VU1",self:GetPackedBool("VU1") and 1 or 0, 	0,1, 12, false)
	self:Animate("VU3",self:GetPackedBool("VU3") and 1 or 0, 	0,1, 12, false)
	self:Animate("VU2",self:GetPackedBool("VU2") and 1 or 0, 	0,1, 12, false)

	self:Animate("VU",self:GetPackedBool("VU") and 1 or 0, 	0,1, 12, false)
	self:Animate("RezMK",self:GetPackedBool("RezMK") and 1 or 0, 	0,1, 7, false)

	self:Animate("VRD",self:GetPackedBool("VRD") and 0 or 1, 	0,1, 12, false)

	self:Animate("VB",self:GetPackedBool("VB") and 1 or 0, 	0,1, 8, false)

	self:ShowHideSmooth("RadioLamp",self:Animate("radiolamp",self:GetPackedBool("VPR") and 1 or 0,0,1,5,false))
	self:ShowHideSmooth("RadioLamp1",self.Anims["radiolamp"].val)

	self:ShowHideSmooth("RedLights",self:Animate("redlights",self:GetPackedBool("RedLight") and 1 or 0,0,1,5,false))
	self:ShowHideSmooth("WhiteLights",self:Animate("whitelights",self:GetPackedBool("HeadLights2") and 1 or 0,0,1,5,false))
	self:ShowHideSmooth("DistantLights",self:Animate("distantlights",self:GetPackedBool("HeadLights1") and 1 or 0,0,1,5,false))

	self:Animate("KDL",self:GetPackedBool("KDL") and 1 or 0, 	0,1, 12, false)
	self:Animate("DIPon",self:GetPackedBool("DIPon") and 1 or 0, 	0,1, 12, false)
	self:Animate("DIPoff",self:GetPackedBool("DIPoff") and 1 or 0, 	0,1, 12, false)
	self:Animate("VozvratRP",self:GetPackedBool("VozvratRP") and 1 or 0, 	0,1, 12, false)
	self:Animate("KSN",self:GetPackedBool("KSN") and 1 or 0, 	0,1, 12, false)
	self:Animate("KDP",self:GetPackedBool("KDP") and 1 or 0, 	0,1, 12, false)
	self:Animate("DoorSelect",self:GetPackedBool(55) and 1 or 0, 	0,1, 12, false)
	

	self:Animate("KU1",self:GetPackedBool("KU1") and 1 or 0, 	0,1, 7, false)
	self:Animate("VUD",self:GetPackedBool("VUD1") and 1 or 0, 	0,1, 7, false)

	self:Animate("KRZD",			self:GetPackedBool(17) and 1 or 0, 	0,1, 16, false)
	self:Animate("VDL",self:GetPackedBool("VDL") and 1 or 0, 	0,1, 7, false)
	self:ShowHideSmooth("KTLamp",self:Animate("KT_hs",self:GetPackedBool(47) and 1 or 0,0,1,5,false))
	self:Animate("Ring",self:GetPackedBool("Ring") and 1 or 0, 	0,1, 12, false)
	self:Animate("VUS",self:GetPackedBool("VUS") and 1 or 0, 	0,1, 12, false)
	self:Animate("KAK",self:GetPackedBool("KAK") and 1 or 0, 	0,1, 12, false)
	self:Animate("VAutodrive",self:GetPackedBool("VAutodrive") and 1 or 0, 	0,1, 12, false)

	self:HideButton("VUD2Toggle",self:GetPackedBool("VUD2Bl"))
	self:HideButton("VUD2LToggle",self:GetPackedBool("VUD2LBl"))
	self:Animate("VUD2",self:GetPackedBool("VUD2") and 0 or 1, 	0,1, 7, false)
	self:Animate("VUD2l",self:GetPackedBool("VUD2L") and 1 or 0, 	0,1, 7, false)

	--self:Animate("PB",self:GetPackedBool("PB") and 1 or 0,0,0.2,  12,false)

	self:Animate("brake_disconnect",self:GetPackedBool("DriverValveBLDisconnect") and 0 or 1,0.25,0.5,  4,false)
	self:Animate("train_disconnect",self:GetPackedBool("DriverValveTLDisconnect") and 1 or 0,0.25,0,  4,false)
	
	self:Animate("UAVALever",	self:GetPackedBool(152) and 0 or 1, 	0,0.25, 128,  3,false)
	
	----CRAN AIR
	---
	local valve = self:GetPackedBool(6) -- 6- DriverValveDisconnect
		if not self:GetPackedBool(22) then
		valve = self:GetPackedBool("DriverValveTLDisconnect")
		end
	self:SetSoundState("cran1",math.min(1,self:GetPackedRatio(4)/50*(valve and 1 or 0)),1)

	--KRU
	if (self.Transient or 0) ~= 0.0 then self.Transient = 0.0 end
	self.KRUPos = self.KRUPos or 0
	if self:GetPackedBool(27)
	then self.KRUPos = self.KRUPos + (0.0 - self.KRUPos)*8.0*self.DeltaTime
	else self.KRUPos = 1.0
	end
	
	-- Simulate pressure gauges getting stuck a little
	self:Animate("brake", 		1-self:GetPackedRatio(0), 			0.00, 0.48,  256,24)
	self:Animate("controller",		self:GetPackedRatio(1),				0, 0.31,  2,false)
	self:Animate("reverser",		self:GetPackedRatio(2),				0.26, 0.35,  4,false)
	self:Animate("volt1", 			self:GetPackedRatio(10),			0,0.14,90,2)
	self:ShowHide("reverser",		self:GetPackedBool(0))
	self:ShowHide("reverser2",		not self:GetPackedBool(0) and not self:GetPackedBool(27))
	self:Animate("krureverser",		0.5+(0.5-self.KRUPos*0.5)-0.5*(self:GetPackedRatio(2)/2),		1, 1,  3,false)
	self:ShowHide("krureverser",	self:GetPackedBool(27))
	
	
	
	---Animate brakes
	self:Animate("brake_line",		self:GetPackedRatio(4),				0.2, 0.85,  359,2)--,,0.01)
	self:Animate("train_line",		self:GetPackedRatio(5)-transient,	0.2, 0.85,  359,2)--,,0.01)
	self:Animate("brake_cylinder",	self:GetPackedRatio(6),	 			0, 0.95,  359,2)--,,0.03)
	self:Animate("voltmeter",		self:GetPackedRatio(7),				0, 0.145)
	self:Animate("ampermeter",		self:GetPackedRatio(8),				0, 0.24,				nil, nil,  256,2,0.01)


	local wheel_radius = 0.5*44.1 -- units
	local speed = self:GetPackedRatio(3)*100
	local ang_vel = speed/(2*math.pi*wheel_radius)

	-- Rotate wheel
	--self.Angle = ((self.Angle or math.random()) + ang_vel*self.DeltaTime) % 1.0
   -- self:Animate("speed1", 			self:GetPackedRatio("Speed") + math.sin(math.pi*8*self.Angle)*2/120,			0.495, 0.746,				nil, nil,  256,2,0.01)
	--self:Animate("speed1", 			self:GetPackedRatio("Speed") + math.sin(math.pi*8*self.Angle)*1/120,			0.495, 0.716,				nil, nil,  256,2,0.01) -EMA
	--self:Animate("speed1", 			/120,			0.495, 0.716,				nil, nil,  256,2,0.01) -?

	self:Animate("OtklAVU",			self:GetPackedBool(19) and 0 or 1, 	0,1, 16, false)
	self:Animate("door1",	self:GetPackedBool(157) and (self.Door1 or 0.99) or 0,0,0.22, 1024, 1)
	self:Animate("door3",	self:GetPackedBool(158) and (self.Door2 or 0.99) or 0,0,0.25, 1024, 1)
	self:Animate("door2",	self:GetPackedBool(156) and (self.Door3 or 0.99) or 0,0,0.25, 1024, 1)
	self:Animate("door4",	self:GetPackedBool(159) and (self.Door2 or 0.99) or 0,1,0.77, 1024, 1)

	self:Animate("FrontBrake", self:GetNW2Bool("FbI") and 0 or 1,0,0.35, 3, false)
	self:Animate("FrontTrain",	self:GetNW2Bool("FtI") and 0 or 1,0,0.35, 3, false)
	self:Animate("RearBrake",	self:GetNW2Bool("RbI") and 1 or 0,0,0.35, 3, false)
	self:Animate("RearTrain",	self:GetNW2Bool("RtI") and 1 or 0,0,0.35, 3, false)

	self:ShowHideSmooth("AVULight_light",self:Animate("AVUl",self:GetPackedBool(38) and 1 or 0,0,1,10,false))

	-- Main switch
	if self.LastValue ~= self:GetPackedBool(5) then
		self.ResetTime = CurTime()+1.5
		self.LastValue = self:GetPackedBool(5)
	end
	self:Animate("gv_wrench",	(self:GetPackedBool(5) and 1 or 0), 	0,0.51, 128,  1,false)
	self:ShowHide("gv_wrench",	CurTime() < self.ResetTime)

	-- Animate doors
	for i=0,4 do
		for k=0,1 do
			local n_l = "door"..i.."x"..k.."a"
			local n_r = "door"..i.."x"..k.."b"
			self:Animate(n_l,self:GetPackedBool(21+(1-k)*4) and 1 or 0,0,1, 0.8 + (-0.2+0.4*math.random()),0)
			self:Animate(n_r,self:GetPackedBool(21+(1-k)*4) and 1 or 0,0,1, 0.8 + (-0.2+0.4*math.random()),0)
		end
	end

	-- Brake-related sounds
	local brakeLinedPdT = self:GetPackedRatio(9)
	local dT = self.DeltaTime
	self.BrakeLineRamp1 = self.BrakeLineRamp1 or 0

	if (brakeLinedPdT > -0.001)
	then self.BrakeLineRamp1 = self.BrakeLineRamp1 + 4.0*(0-self.BrakeLineRamp1)*dT
	else self.BrakeLineRamp1 = self.BrakeLineRamp1 + 4.0*((-0.6*brakeLinedPdT)-self.BrakeLineRamp1)*dT
	end
	self.BrakeLineRamp1 = math.Clamp(self.BrakeLineRamp1,0,1)
	self:SetSoundState("release2",self.BrakeLineRamp1^1.65,1.0)

	self.BrakeLineRamp2 = self.BrakeLineRamp2 or 0
	if (brakeLinedPdT < 0.001)
	then self.BrakeLineRamp2 = self.BrakeLineRamp2 + 4.0*(0-self.BrakeLineRamp2)*dT
	else self.BrakeLineRamp2 = self.BrakeLineRamp2 + 8.0*(0.1*brakeLinedPdT-self.BrakeLineRamp2)*dT
	end
	self.BrakeLineRamp2 = math.Clamp(self.BrakeLineRamp2,0,1)
	self:SetSoundState("release4",self.BrakeLineRamp2 + math.max(0,self.BrakeLineRamp1/2-0.15),1.0)

	self:SetSoundState("cran1",math.min(1,self:GetPackedRatio(4)/50*(self:GetPackedBool(6) and 1 or 0)),1.0)

	-- Digits
	if self:GetPackedBool(32) then 
		local speed = self:GetPackedRatio("Speed")*100.0
		if IsValid(self.ClientEnts["speedo1"])then
			self.ClientEnts["speedo1"]:SetSkin(math.floor(speed)%10)
		end
		if IsValid(self.ClientEnts["speedo2"])then
			self.ClientEnts["speedo2"]:SetSkin(math.floor(speed/10))
		end
	end
	self:ShowHide("speedo1",self:GetPackedBool(32))
	self:ShowHide("speedo2",self:GetPackedBool(32))
	
	--- Чтобы лампы не загорались с выкл БВ
		self:ShowHide("SD",self:GetPackedBool(32))
		
		
	-- Compressor
	local state = self:GetPackedBool(20)
	self.PreviousCompressorState = self.PreviousCompressorState or false
	if self.PreviousCompressorState ~= state then
		self.PreviousCompressorState = state
		if 	state then
			self:SetSoundState("compressor_ezh",1,1)
		else
			self:SetSoundState("compressor_ezh",0,1)
			self:SetSoundState("compressor_ezh_end",0,1)
			self:SetSoundState("compressor_ezh_end",1,1)
			--self:PlayOnce("compressor_e_end",nil,1,nil,true)
		end
	end
	
	-- ARS/ringer alert
	state = self:GetPackedBool(39)
	self.PreviousAlertState = self.PreviousAlertState or false
	if self.PreviousAlertState ~= state then
		self.PreviousAlertState = state
		if state then
			self:SetSoundState("ring_old",0,1)
		else
			self:SetSoundState("ring_old",0,0)
			self:SetSoundState("ring_old_end",0,1)
			self:SetSoundState("ring_old_end",0,1)
			--self:PlayOnce("ring4_end","cabin",0,101)
		end
	end

	state = self:GetPackedBool("VPR")
	self.PreviousVPRState = self.PreviousVPRState or false
	if self.PreviousVPRState ~= state then
		self.PreviousVPRState = state
		if state then
			self:SetSoundState("vpr",1,1)
		else
			self:SetSoundState("vpr",0,0)
			self:PlayOnce("vpr_end","cabin",1)
		end
	end

	-- RK rotation
	if self:GetPackedBool(112) then self.RKTimer = CurTime() end
	state = (CurTime() - (self.RKTimer or 0)) < 0.2
	self.PreviousRKState = self.PreviousRKState or false
	if self.PreviousRKState ~= state then
		self.PreviousRKState = state
		if state then
			self:SetSoundState("rk_spin",0.7,1,nil,0.75)
		else
			self:SetSoundState("rk_spin",0,0,nil,0.75)
			self:SetSoundState("rk_stop",0,1,nil,0.75)
			self:SetSoundState("rk_stop",0.7,1,nil,0.75)
		end
	end

	--DIP sound
	--self:SetSoundState("cran1",self:GetPackedBool(32) and 1 or 0,1.0)
end

function ENT:Draw()
	self.BaseClass.Draw(self)
end

function ENT:DrawPost()
	--local dc = render.GetLightColor(self:LocalToWorld(Vector(460.0,0.0,5.0)))
	if self.InfoTableTimeout and (CurTime() < self.InfoTableTimeout) then
		self:DrawOnPanel("InfoTableSelect",function()
			draw.Text({
				text = self:GetNW2String("RouteNumber",""),
				font = "MetrostroiSubway_InfoPanel",--..self:GetNW2Int("Style",1),
				pos = { 140, -50 },
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = Color(255,0,0,255)})
			draw.Text({
				text = self:GetNW2String("FrontText",""),
				font = "MetrostroiSubway_InfoPanel",--..self:GetNW2Int("Style",1),
				pos = { 140, -100 },
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_CENTER,
				color = Color(255,0,0,255)})
		end)
	end

	

--[[
	self:DrawOnPanel("IGLA",function()
		local plus = ((not self:GetPackedBool(32) or not self:GetPackedBool(78)) and 1 or 0)
		surface.SetDrawColor(50 - plus*40,255 - plus*220,40 - plus*40)
		surface.DrawRect(0,-4,360,60)
		if not self:GetPackedBool(32) or not self:GetPackedBool(78) then return end
		local text1 = ""
		local text2 = ""
		local C1 = Color(0,0,0,255)
		local C2 = Color(50,200,50,255)
		local flash = false
		local T = self:GetPackedRatio(11)
		local Ptrain = self:GetPackedRatio(5)*16.0
		local Pcyl = self:GetPackedRatio(6)*6.0
		local date = os.date("!*t",os_time)
		-- Default IGLA text
		text1 = "IGLA-01K     RK TEMP"
		text2 = Format("%02d:%02d:%02d       %3d C",date.hour,date.min,date.sec,T)

		-- Modifiers and conditions
		if self:GetPackedBool(25) then text1 = " !!  Right Doors !!" end
		if self:GetPackedBool(21) then text1 = " !!  Left Doors  !!" end

		if T > 300 then text1 = "Temperature warning!" end

		if self:GetPackedBool(50) and (Pcyl > 1.1) then
			text1 = "FAIL PNEUMATIC BRAKE"
			flash = true
		end
		if self:GetPackedBool(35) and
		   self:GetPackedBool(28) then
			text1 = "FAIL AVU/BRAKE PRESS"
			flash = true
		end
		if self:GetPackedBool(35) and
		   (not self:GetPackedBool(40)) then
			text1 = "FAIL SD/DOORS OPEN  "
			flash = true
		end
		if self:GetPackedBool(36) then
			text1 = "FAIL OVERLOAD RELAY "
			flash = true
		end
		if Ptrain < 5.5 then
			text1 = "FAIL TRAIN LINE LEAK"
			flash = true
		end

		if T > 400 then flash = true end
		if T > 500 then text1 = "!Disengage circuits!" end
		if T > 750 then text1 = " !! PIZDA POEZDU !! " end

		-- Draw text
		if flash and ((RealTime() % 1.0) > 0.5) then
			C2,C1 = C1,C2
		end
		for i=1,20 do
			surface.SetDrawColor(C2)
			surface.DrawRect(3+(i-1)*17.7+1,0+4,16,22)
			draw.DrawText(string.upper(text1[i] or ""),"MetrostroiSubway_IGLA",3+(i-1)*17.7,0+0,C1)
		end
		for i=1,20 do
			surface.SetDrawColor(C2)
			surface.DrawRect(3+(i-1)*17.7+1,0+24+4,16,22)
			draw.DrawText(string.upper(text2[i] or ""),"MetrostroiSubway_IGLA",3+(i-1)*17.7,0+24,C1)
		end
	end)
	]]
	--[[
	self:DrawOnPanel("DURADisplay",function()
		if not self:GetPackedBool(32) or not self:GetPackedBool(24) then return end
		local function GetColor(id, text)
			if text then
				return self:GetPackedBool(id) and Color(255,0,0) or Color(0,0,0)
			else
				return not self:GetPackedBool(id) and Color(255,255,255) or Color(0,0,0)
			end
		end
		surface.SetAlphaMultiplier(0.4)
		surface.SetDrawColor(255,255,255)
		surface.DrawRect(0,3+22.8*0,211,22.8) -- 120
		surface.SetAlphaMultiplier(1.0)
		draw.DrawText("DURA V 1.0","MetrostroiSubway_IGLA",0,0+22.8*0, Color(0,0,0,255))

		surface.SetAlphaMultiplier(0.4)
		surface.SetDrawColor(GetColor(31)) surface.SetAlphaMultiplier(0.4)
		surface.DrawRect(0,3+22.8*1,211,23) -- 120
		surface.SetAlphaMultiplier(1.0)
		draw.DrawText("Channel:" .. (self:GetPackedBool(31) and "2" or "1"),"MetrostroiSubway_IGLA",0,0+22.8*1,GetColor(31, true))

		surface.SetAlphaMultiplier(0.4)
		surface.SetDrawColor(GetColor(153)) surface.SetAlphaMultiplier(0.4)
		surface.DrawRect(0,3+22.8*2,211,23) -- 120
		surface.SetAlphaMultiplier(1.0)
		draw.DrawText("Channel1:" .. (self:GetPackedBool(153) and "Alt" or "Main"),"MetrostroiSubway_IGLA",0,0+22.8*2,GetColor(153, true))

		surface.SetAlphaMultiplier(0.4)
		surface.SetDrawColor(GetColor(154))
		surface.DrawRect(0,3+22.8*3,211,23) -- 120
		surface.SetAlphaMultiplier(1.0)
		draw.DrawText("Channel2:" .. (self:GetPackedBool(154) and "Alt" or "Main"),"MetrostroiSubway_IGLA",0,0+22.8*3,GetColor(154, true))
		surface.SetAlphaMultiplier(0.4)
		surface.SetDrawColor(255,255,255)
		surface.DrawRect(0,3+22.8*4,211,23) -- 120
		surface.SetAlphaMultiplier(1)
	end)]]

	--[[self:DrawOnPanel("FrontPneumatic",function()
		draw.DrawText(self:GetNW2Bool("FbI") and "Isolated" or "Open","Trebuchet24",150,0,Color(0,0,0,255))
		draw.DrawText(self:GetNW2Bool("FtI") and "Isolated" or "Open","Trebuchet24",670,0,Color(0,0,0,255))
	end)
	self:DrawOnPanel("RearPneumatic",function()
		draw.DrawText(self:GetNW2Bool("RbI") and "Isolated" or "Open","Trebuchet24",150,0,Color(0,0,0,255))
		draw.DrawText(self:GetNW2Bool("RtI") and "Isolated" or "Open","Trebuchet24",670,0,Color(0,0,0,255))
	end)
	self:DrawOnPanel("AirDistributor",function()
		draw.DrawText(self:GetNW2Bool("AD") and "Air Distributor ON" or "Air Distributor OFF","Trebuchet24",0,0,Color(0,0,0,255))
	end)]]

	-- Draw train numbers
	local dc = render.GetLightColor(self:GetPos())
	self:DrawOnPanel("TrainNumber1",function()
		draw.DrawText(Format("%04d",self:EntIndex()),"MetrostroiSubway_LargeText3",0,0,Color(255*dc.x,255*dc.y,255*dc.z,255))
	end)
	self:DrawOnPanel("TrainNumber2",function()
		draw.DrawText(Format("%04d",self:EntIndex()),"MetrostroiSubway_LargeText3",0,0,Color(255*dc.x,255*dc.y,255*dc.z,255))
	end)
end


function ENT:OnButtonPressed(button)
	if button == "ShowHelp" then
		RunConsoleCommand("metrostroi_train_manual")
	end
	local bp_press = self:GetPackedRatio(6)
	local blocked_l = self:GetPackedBool(132) and 0 or 1
	local blocked_r = self:GetPackedBool(133) and 0 or 1
	if button == "ParkingBrakeLeft" then
		self.ParkingBrakeAngle = (self.ParkingBrakeAngle or 0) - blocked_l*45
	end
	if button == "ParkingBrakeRight" then
		self.ParkingBrakeAngle = (self.ParkingBrakeAngle or 0) + blocked_r*45
	end
	if button == "ShowHelp" then
		RunConsoleCommand("metrostroi_train_manual")
	end

	if button == "PrevSign" then
		self.InfoTableTimeout = CurTime() + 2.0
	end
	if button == "NextSign" then
		self.InfoTableTimeout = CurTime() + 2.0
	end

	if button and button:sub(1,3) == "Num" then
		self.InfoTableTimeout = CurTime() + 2.0
	end
end

function ENT:DrawPost()
---Циферблат

---Временное решение для спидометра

	--[[self:DrawOnPanel("ARS",function()
		if not self:GetPackedBool(32) then return end

		local speed = self:GetPackedRatio("Speed")*100 --print (self:GetPackedRatio("Speed")*100)
		local d1 = math.floor(speed) % 10
		local d2 = math.floor(speed / 10) % 10
		self:DrawDigit((196+0) *10,	35*10, d2, 0.75, 0.65)--0.75, 0.55
		self:DrawDigit((196+10)*10,	35*10, d1, 0.75, 0.65)--0.75, 0.55


		surface.SetAlphaMultiplier(1.0)
	end)]]
		
end