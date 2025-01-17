AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
util.AddNetworkString "metrostroi-signal"
util.AddNetworkString "metrostroi-signal-state"
CreateConVar("metrostroi_ars_independent",0,{FCVAR_ARCHIVE},"Enable independent ARS codes")
function ENT:SetSprite(index,active,model,scale,brightness,pos,color)
	if active and self.Sprites[index] then return end
	if not active and not self.Sprites[index] then return end
	if not active and self.Sprites[index] then
		SafeRemoveEntity(self.Sprites[index])
		self.Sprites[index] = nil
	end

	if active then
		local sprite = ents.Create("env_sprite")
		sprite:SetParent(self)
		sprite:SetLocalPos(pos)
		sprite:SetLocalAngles(self:GetAngles())

		-- Set parameters
		sprite:SetKeyValue("rendercolor",
			Format("%i %i %i",
				color.r*brightness,
				color.g*brightness,
				color.b*brightness
			)
		)
		sprite:SetKeyValue("rendermode", 9) -- 9: WGlow, 3: Glow
		sprite:SetKeyValue("renderfx", 14)
		sprite:SetKeyValue("model", model)
		sprite:SetKeyValue("scale", scale)
		sprite:SetKeyValue("spawnflags", 1)

		-- Turn sprite on
		sprite:Spawn()
		self.Sprites[index] = sprite
	end
end
function ENT:OpenRoute(route)
	self.LastOpenedRoute = route
	if self.Routes[route].Manual then self.Routes[route].IsOpened = true end
	if not self.Routes[route].Switches then return end
	local Switches = string.Explode(",",self.Routes[route].Switches)

	for i1 =1, #Switches do
		if not Switches[i1] or Switches[i1] == "" then continue end

		local SwitchState = Switches[i1]:sub(-1,-1) == "-"
		local SwitchName = Switches[i1]:sub(1,-2)
		--if not self.Switches[SwitchName] then self.Switches[SwitchName] = Metrostroi.GetSwitchByName(SwitchName) end
		if not Metrostroi.GetSwitchByName(SwitchName) then print(self.Name,"switch not found") continue end
		--If route go right from this switch - add it
		if SwitchState ~= (Metrostroi.GetSwitchByName(SwitchName):GetSignal() ~= 0) then
			Metrostroi.GetSwitchByName(SwitchName):SendSignal(SwitchState and "alt" or "main",nil,true)
			--RunConsoleCommand("say","changing",SwitchName)
		end
	end
end

function ENT:CloseRoute(route)
	if self.Routes[route].Manual then self.Routes[route].IsOpened = false end
	if not self.Routes[route].Switches then return end

	local Switches = string.Explode(",",self.Routes[route].Switches)
	for i1 =1, #Switches do
		if not Switches[i1] or Switches[i1] == "" then continue end

		--local SwitchState = Switches[i1]:sub(-1,-1) == "-"
		local SwitchName = Switches[i1]:sub(1,-2)
		--if not self.Switches[SwitchName] then self.Switches[SwitchName] = Metrostroi.GetSwitchByName(SwitchName) end
		if not Metrostroi.GetSwitchByName(SwitchName) then print(self.Name,"switch not found") continue end
		--If route go right from this switch - add it
		if SwitchState ~= (Metrostroi.GetSwitchByName(SwitchName):GetSignal() ~= 0) then
			Metrostroi.GetSwitchByName(SwitchName):SendSignal("main",nil,true)
			--RunConsoleCommand("say","changing",SwitchName)
		end
	end
end

function ENT:SayHook(ply, comm)
	if comm:sub(1,8) == "!sactiv " then
		comm = comm:sub(9,-1):upper()

		comm = string.Explode(":",comm)
		if self.Routes then
			for k,v in pairs(self.Routes) do
				if (v.RouteName and v.RouteName:upper() == comm[1] or comm[1] == "*") and v.Emer then
					if self.LastOpenedRoute and k ~= self.LastOpenedRoute then self:CloseRoute(self.LastOpenedRoute) end
					v.IsOpened = true
					break
				end
			end
		end
	elseif comm:sub(1,10) == "!sdeactiv " then
		comm = comm:sub(11,-1):upper()

		comm = string.Explode(":",comm)
		if self.Routes then
			for k,v in pairs(self.Routes) do
				if (v.RouteName and v.RouteName:upper() == comm[1] or comm[1] == "*") and v.Emer then
					v.IsOpened = false
					break
				end
			end
		end
	elseif comm:sub(1,8) == "!sclose " then
		comm = comm:sub(9,-1):upper()

		comm = string.Explode(":",comm)
		if comm[1] == self.Name then
			if self.Routes[1] and self.Routes[1].Manual then
				self:CloseRoute(1)
			else
				if not self.Close then
					self.Close = true
				end
				if self.InvationSignal then
					self.InvationSignal = false
				end
				if (self.LastOpenedRoute and self.LastOpenedRoute == 1) or self.Routes[1].Repeater then
					self:CloseRoute(1)
				else
					self:OpenRoute(1)
				end
			end
		elseif self.Routes then
			for k,v in pairs(self.Routes) do
				if v.RouteName and v.RouteName:upper() == comm[1] then
					if self.LastOpenedRoute and k ~= self.LastOpenedRoute then self:CloseRoute(self.LastOpenedRoute) end
					self:CloseRoute(k)
				end
			end
		end
	elseif comm:sub(1,7) == "!sopen " then
		comm = comm:sub(8,-1):upper()
		comm = string.Explode(":",comm)
		if comm[1] == self.Name then
			RunConsoleCommand("say",comm)
			if comm[2] then
				if self.NextSignals[comm[2]] then
					local Route
					for k,v in pairs(self.Routes) do
						if v.NextSignal == comm[2] then Route = k break end
					end
					self:OpenRoute(Route)
				end
			else
				if self.Routes[1] and self.Routes[1].Manual then
					self:OpenRoute(1)
				elseif self.Close then
					self.Close = false
				end
			end
		elseif self.Routes then
			for k,v in pairs(self.Routes) do
				if v.RouteName and v.RouteName:upper() == comm[1] then
					if self.LastOpenedRoute and k ~= self.LastOpenedRoute then self:CloseRoute(self.LastOpenedRoute) end
					self:OpenRoute(k)
				end
			end
		end
	elseif comm:sub(1,7) == "!sopps " then
		comm = comm:sub(8,-1):upper()
		comm = string.Explode(":",comm)
		if comm[1] == self.Name then
			self.InvationSignal = true
		end
	elseif comm:sub(1,7) == "!sclps " then
		comm = comm:sub(8,-1):upper()
		comm = string.Explode(":",comm)
		if comm[1] == self.Name then
			self.InvationSignal = false
		end
	end
end
ENT.ARSOrder = "04678"
function ENT:Initialize()
	self:SetModel("models/metrostroi/signals/mus/ars_box.mdl")
	self.Sprites = {}
	self.Sig = ""
	hook.Add("PlayerSay","metrostroi-signal-say"..self:EntIndex(), function(ply, comm) self:SayHook(ply,comm) end)
	self.FreeBS = 1
	self.OldBSState = 1
	self.OutputARS = 1
	self.EnableDelay = {}
	self.PostInitalized = true

	self.Controllers = nil
end

function ENT:PreInitalize()
	self.AutostopOverride = nil
	if not self.Routes or self.Routes[1].NextSignal == "" then
		self.AutostopOverride = true
	end
	if self.Sprites then
		for k,v in pairs(self.Sprites) do
			SafeRemoveEntity(v)
			self.Sprites[k] = nil
		end
	end
	self.NextSignals = {}
	--self.Switches = {}
	for k,v in ipairs(self.Routes) do
		if v.NextSignal == "" then
			self.NextSignals[""] = nil--self
		elseif v.NextSignal == "*" then
		else
			self.NextSignals[v.NextSignal] = Metrostroi.GetSignalByName(v.NextSignal)
			if not self.NextSignals[v.NextSignal] then
				print(Format("Metrostroi: Signal %s, signal not found(%s)", self.Name, v.NextSignal))
				self.AutostopOverride = true
			end
		end
	end
	self.MU = false
	for k,v in ipairs(self.Lenses) do
		if v:find("M") then self.MU = true break end
	end
end
function ENT:PostInitalize()
	if not self.Routes or #self.Routes == 0 then print(self, "NEED SETUP") return end
	for k,v in ipairs(self.Routes) do
		if v.NextSignal == "*" and self.TrackPosition then
			local sig
			local cursig = self
			while true do
				cursig = Metrostroi.GetARSJoint(cursig.TrackPosition.node1,cursig.TrackPosition.x,cursig.TrackDir,false)
				if not IsValid(cursig) then break end
				sig = cursig
				if not cursig.PassOcc then break end
			end
			if IsValid(sig) then
				self.NextSignals["*"] = sig
			else
				self.AutostopOverride = true
				print(Format("Metrostroi: Signal %s, cant automaticly find signal", self.Name))
			end
		end
	end
	local pos = self.TrackPosition
	local node = pos and pos.node1 or nil
	self.Node = node

	self.SwitchesFunction = {}
	self.Switches = {}
	for i = 1,#self.Routes do
		if not self.Routes[i].Switches then continue end

		local Switches = string.Explode(",",self.Routes[i].Switches)
		local SwitchesTbl = {}
		--local GoodSwitches = true
		--Checking all route switches
		for i1 =1, #Switches do
			if not Switches[i1] or Switches[i1] == "" then continue end

			local SwitchState = Switches[i1]:sub(-1,-1) == "-"
			local SwitchName = Switches[i1]:sub(1,-2)
			if not Metrostroi.GetSwitchByName(SwitchName) then print(Format("Metrostroi: %s, switch not found(%s)", self.Name, SwitchName)) continue end
			--If route go right from this switch - add it
			table.insert(SwitchesTbl,{n = SwitchName,s = SwitchState})
		end
		self.Switches[i] = SwitchesTbl
		if #SwitchesTbl == 0 then continue end
		self.SwitchesFunction[i] = function()
			local GoodSwitches = true
			for i1 = 1,#self.Switches[i] do
				if not self.Switches[i][i1] or not IsValid(Metrostroi.GetSwitchByName(self.Switches[i][i1].n)) then continue end
				if self.Switches[i][i1].s ~= (Metrostroi.GetSwitchByName(self.Switches[i][i1].n):GetSignal() > 0) then
					GoodSwitches = false
					break
				end
			end
			return GoodSwitches
		end
	end
	for k,v in pairs(self.Routes) do
		if not v.Lights then continue end
		v.LightsExploded = string.Explode("-",v.Lights)
	end
	if not self.RouteNumberSetup or not self.RouteNumberSetup:find("W") then
		self.GoodInvationSignal = 0
		local index = 1
		for k,v in ipairs(self.Lenses) do
			if v ~= "M" then
				for i = 1,#v do
					if v[i] == "W" then self.GoodInvationSignal = index end
					index = index + 1
				end
			end
		end
	else
		self.GoodInvationSignal = -1
	end
	if self.Left then
		self:SetModel("models/metrostroi/signals/mus/ars_box_mittor.mdl")
	else
		self:SetModel("models/metrostroi/signals/mus/ars_box.mdl")
	end
	self.PostInitalized = false

end

function ENT:OnRemove()
	Metrostroi.UpdateSignalEntities()
	hook.Remove("PlayerSay","metrostroi-signal-say"..self:EntIndex())
	Metrostroi.PostSignalInitialize()
end

function ENT:GetARS(ARSID)
	if self.OverrideTrackOccupied then return ARSID == 0 end
	if Metrostroi.Voltage < 50 then return false end
	if not self.ARSSpeedLimit then return false end
	local nxt = self.ARSNextSpeedLimit ~= 2 and self.ARSNextSpeedLimit or 0
	return self.ARSSpeedLimit == ARSID or (nxt == ARSID and self.ARSSpeedLimit > nxt and GetConVarNumber("metrostroi_ars_sfreq") > 0)
end
function ENT:Get325Hz(ln)
	if self.OverrideTrackOccupied then return false end
	return (self.ARSSpeedLimit == 0 or ln) and self.Approve0
end
function ENT:GetMaxARS()
	local ARSCodes = self.Routes[1].ARSCodes
	if not self.Routes[1] or not ARSCodes then return 1 end
	return tonumber(ARSCodes[#ARSCodes]) or 1
end
function ENT:GetMaxARSNext()
	local Routes = self.NextSignalLink and self.NextSignalLink.Routes or self.Routes
	local ARSCodes = Routes[1] and Routes[1].ARSCodes
	local code = tonumber(ARSCodes[#ARSCodes]) or 1
	local This = self:GetMaxARS()
	if not ARSCodes then return This end
	if code > This then return This end
	--if not ARSCodes then return 1 end
	return tonumber(ARSCodes[#ARSCodes]) or 1
end

function ENT:ARSLogic(tim)
	--print(self.FoundedAll)
	--if not self.FoundedAll then return end
	if not self.Routes or not self.NextSignals then return end

	-- Check track occuping
	if not self.Routes[self.Route or 1].Repeater  then
		if Metrostroi.Voltage > 50 and not self.Close and not self.KGU then --not self.OverrideTrackOccupied and
			if self.Node and  self.TrackPosition then
				self.Occupied,self.OccupiedBy,self.OccupiedByNow = Metrostroi.IsTrackOccupied(self.Node, self.TrackPosition.x,self.TrackPosition.forward,self.ARSOnly and "ars" or "light", self)
			end
			if self.Routes[self.Route] and self.Routes[self.Route].Manual then
				self.Occupied = self.Occupied or not self.Routes[self.Route].IsOpened
			end
			if self.OccupiedByNowOld ~= self.OccupiedByNow then
				self.InvationSignal = false
				self.OccupiedByNowOld = self.OccupiedByNow
			end
			--if self.Name == "AU477" then print( self.OccupiedBy) end
		else
			self.NextSignalLink = nil
			self.Occupied = Metrostroi.Voltage < 50 or self.Close or self.KGU --self.OverrideTrackOccupied or
		end
		if self.Occupied then
			if self.Routes[self.Route or 1].Manual then self.Routes[self.Route or 1].IsOpened = false end
		end
		if self.Occupied or not self.NextSignalLink or not self.NextSignalLink.FreeBS then
			self.FreeBS = 0
		else
			self.FreeBS = math.min(10,self.NextSignalLink.FreeBS + 1)
		end
		if self.FreeBS - (self.OldBSState or self.FreeBS) > 1 then
			local Free = self.FreeBS
			timer.Simple(tim+0.1,function()
				if not IsValid(self) then return end
				if self.NextSignalLink and self.NextSignalLink.FreeBS + 1 - self.OldBSState > 1 then
					self.FreeBS = Free
					self.OldBSState = Free
				end
			end)
			self.FreeBS = self.OldBSState
		end
		self.OldBSState = self.FreeBS
		if self.FreeBS == 1 then
			self.OccupiedBy = self
		elseif self.FreeBS > 1 then
			self.AutostopEnt = nil
		end
		if self.OccupiedByNow ~= self.AutostopEnt and self.AutostopEnt ~= self.CurrentAutostopEnt then
			self.AutostopEnt = nil
		end
	end
	if self.OldRoute ~= self.Route then
		self.InvationSignal = false
		self.OldRoute = self.Route
	end
	--Removing NSL
	self.NextSignalLink = nil
	--Set the first route, if no switches in route or no switches
	--or not self.Switches
	if #self.Routes == 1 and (self.Routes[1].Switches == "" or not self.Routes[1].Switches) then
		self.NextSignalLink = self.NextSignals[self.Routes[1].NextSignal]
		self.Route = 1
	else
		local route
		--Finding right route
		for i = 1,#self.Routes do

			--If all switches right - get this route!
			if self.SwitchesFunction[i] and self.SwitchesFunction[i]() and (not self.Routes[i].Manual and not self.Routes[i].Emer or self.Routes[i].IsOpened) then
				--if self.Route ~= i then
				route = i
					--self.NextSignalLink = nil
				--end
			elseif not self.SwitchesFunction[i] and (not self.Routes[i].Manual and not self.Routes[i].Emer or self.Routes[i].IsOpened) then
				route = i
				--self.NextSignalLink = nil
			end
		end
		if self.Route ~= route and (not self.Routes[route] or not self.Routes[route].Emer) then
			self.Route = route
			self.NextSignalLink = nil
		else
			if self.Route ~= route then self.Route = route end
			self.NextSignalLink = self.Routes[route] and self.NextSignals[self.Routes[route].NextSignal]
		end
	end
	if not self.NextSignalLink then
		if self.Occupied then
			self.NextSignalLink = self
			self.FreeBS = 0
			--self.Route = 1
		end
	end
	if self.Routes[self.Route] then
		if self.Routes[self.Route or 1].Repeater then
			self.RealName = IsValid(self.NextSignalLink) and self.NextSignalLink.RealName or self.Name
		else
			self.RealName = self.Name
		end
		if self.Routes[self.Route or 1].Repeater then
			self.RealName = IsValid(self.NextSignalLink) and self.NextSignalLink.Name or self.Name
			self.ARSSpeedLimit = IsValid(self.NextSignalLink) and self.NextSignalLink.ARSSpeedLimit or 1
			self.ARSNextSpeedLimit = IsValid(self.NextSignalLink) and self.NextSignalLink.ARSNextSpeedLimit or 1
			self.FreeBS = IsValid(self.NextSignalLink) and self.NextSignalLink.FreeBS or 0
		elseif self.Routes[self.Route].ARSCodes then
			local ARSCodes = self.Routes[self.Route].ARSCodes
			self.ARSNextSpeedLimit = IsValid(self.NextSignalLink) and self.NextSignalLink.ARSSpeedLimit or tonumber(ARSCodes[1])
			if GetConVarNumber("metrostroi_ars_independent") > 0 then
				self.ARSSpeedLimit = tonumber(ARSCodes[#ARSCodes] or "1")
			else
				local curr = ARSCodes[math.min(#ARSCodes, self.FreeBS+1)]
				local max = tonumber(ARSCodes[#ARSCodes])--FIXME
				if curr == "1" or curr == "0" or curr == "2" or self.ARSNextSpeedLimit == nil or not max then
					self.ARSSpeedLimit = IsValid(self.NextSignalLink) and tonumber(curr) or tonumber(ARSCodes[1] or "1")
				else
					if self.ARSNextSpeedLimit == 4 and max >= 6 then
						self.ARSSpeedLimit = 6
					elseif  self.ARSNextSpeedLimit == 0 or self.ARSNextSpeedLimit == 2 or self.ARSNextSpeedLimit == 1 and max >= 4 then
						self.ARSSpeedLimit = 4
					else
						self.ARSSpeedLimit = math.min(max,self.ARSNextSpeedLimit + 1)
					end
				end
			end
		end
	end
	if self.Occupied or not self.NextSignalLink or not self.NextSignalLink.FreeBS then
		if self.Routes[self.Route or 1].Manual then self.Routes[self.Route or 1].IsOpened = false end
	end
end

function ENT:Think()
	if self.PostInitalized then return end

	self.PrevTime = self.PrevTime or 0
	if (CurTime() - self.PrevTime) > 1.0 then
		self.PrevTime = CurTime()+math.random(0.5,1.5)
		self:ARSLogic(self.PrevTime - CurTime())
	end

	self.RouteNumberOverrite = nil
	local number = ""
	if self.MU or self.ARSOnly or self.RouteNumberSetup and self.RouteNumberSetup ~= "" or self.RouteNumber and self.RouteNumber ~= "" then
		if self.NextSignalLink then
			if not self.NextSignalLink.AutoEnabled and not self.AutoEnabled then
				self.RouteNumberOverrite = self.NextSignalLink.RouteNumberOverrite ~= "" and self.NextSignalLink.RouteNumberOverrite or self.NextSignalLink.RouteNumber
			else
				self.RouteNumberOverrite = self.RouteNumber
			end
			if self.NextSignalLink.RouteNumberOverrite and not self.AutoEnabled and (self.Routes[self.Route or 1].EnRou or self.InvationSignal) then
				number = number..self.NextSignalLink.RouteNumberOverrite
			end
			if self.NextSignalLink.RouteNumber and (self.Routes[self.Route or 1].EnRou and not self.AutoEnabled or self.InvationSignal) then
				number = number..self.NextSignalLink.RouteNumber
			end
			--print(self.Name,self.NextSignalLink.RouteNumberOverrite)
			self.RouteNumberOverrite = (self.RouteNumberOverrite or "")..number
		else
			self.RouteNumberOverrite = self.RouteNumber
		end
	end
	if self.InvationSignal and self.GoodInvationSignal == -1 then
		number = number.."W"
	end
	if self.KGU then number = number.."K" end
	if number then self:SetNW2String("Number",number) end

	if self.ARSOnly or Metrostroi.Voltage <= 50  then
		if self.Sprites then
			for k,v in pairs(self.Sprites) do
				SafeRemoveEntity(v)
				self.Sprites[k] = nil
			end
			if self.ARSOnly and self.Sprites then
				self.Sprites = nil
			end
		end
		self:SetNW2String("Signal","")
		self.AutoEnabled = not self.ARSOnly and Metrostroi.Voltage <= 50
		return
	end

	self.AutoEnabled = false
	self.Red = nil
	if not self.Routes[self.Route or 1].Lights then return end
	local Route = self.Routes[self.Route or 1]
	local index = 1
	local offset = self.RenderOffset[self.SignalType] or Vector(0,0,0)
	self.Sig = ""
	for k,v in ipairs(self.Lenses) do
		if self.Routes[self.Route or 1].Repeater and IsValid(self.NextSignalLink) and (not self.Routes[self.Route or 1].Lights or self.Routes[self.Route or 1].Lights == "") then
			break
		end
		if v ~= "M" then
			--get the some models data
			local data = #v ~= 1 and self.TrafficLightModels[self.SignalType][#v-1] or self.TrafficLightModels[self.SignalType][self.Signal_IS]
			if not data then continue end
			for i = 1,#v do
				--Get the LightID and check, is this light must light up
				local LightID = IsValid(self.NextSignalLink) and math.min(#Route.LightsExploded,self.FreeBS+1) or 1
				local AverageState = Route.LightsExploded[LightID]:find(tostring(index)) or ((v[i] == "W" and self.InvationSignal and self.GoodInvationSignal == index) and 1 or 0)
				local MustBlink = (v[i] == "W" and self.InvationSignal and self.GoodInvationSignal == index) or (AverageState > 0 and Route.LightsExploded[LightID][AverageState+1] == "b") --Blinking, when next is "b" (or it's invasion signal')
				self.Sig = self.Sig..(AverageState > 0 and (MustBlink and 2 or 1) or 0)

				if v[i] == "R" and AverageState > 0 then
					self.AutoEnabled = not self.NonAutoStop
					if self.Red == nil then self.Red = true end
				elseif AverageState > 0 then
					self.Red = false
				end
				index = index + 1
			end
		end
	end
	if self.Routes[self.Route or 1].Repeater and IsValid(self.NextSignalLink) and (not self.Routes[self.Route or 1].Lights or self.Routes[self.Route or 1].Lights == "")then
		self.Sig = self.NextSignalLink.Sig
	end
	if self.Controllers then
		for k,v in pairs(self.Controllers) do
			if self.Sig ~= v.Sig then
				local LightID = IsValid(self.NextSignalLink) and math.min(#Route.LightsExploded,self.FreeBS+1) or 1
				local lights = Route.LightsExploded[LightID]
				v:TriggerOutput("LenseEnabled",self,Route.LightsExploded[LightID])
				v.Sig = self.Sig
			end
			if v.OldIS ~= self.InvationSignal then
				if self.InvationSignal then
					v:TriggerOutput("LenseEnabled",self,"I")
				else
					v:TriggerOutput("LenseDisabled",self,"I")
				end
				v.OldIS = self.InvationSignal
			end
		end
	end
	self:SetNW2String("Signal",self.Sig)
	if not self.AutostopPresent then self:SetNW2Bool("Autostop",self.AutoEnabled) end
	self.Oldsig = self.Sig

	self:NextThink(CurTime() + 0.25)
	return true
end

--Net functions
--Send update, if parameters have been changed
function ENT:SendUpdate(ply)
	net.Start("metrostroi-signal")
		net.WriteEntity(self)
		net.WriteInt(self.SignalType or 0,3)
		net.WriteString(self.Name or "NOT LOADED")
		net.WriteString(self.ARSOnly and "ARSOnly" or self.LensesStr)
		net.WriteString(self.SignalType == 0 and self.RouteNumberSetup or "")
		net.WriteBool(self.Left)
		net.WriteBool(self.Double)
		net.WriteBool(self.DoubleL)
		net.WriteBool(not self.NonAutoStop)
	if ply then net.Send(ply) else net.Broadcast() end
end

--On receive update request, we send update
net.Receive("metrostroi-signal", function(_, ply)
	local ent = net.ReadEntity()
	if not IsValid(ent) or not ent.SendUpdate then return end
	ent:SendUpdate(ply)
end)
