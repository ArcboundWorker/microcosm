--[[
rocks (exhaustable)

	FILE THEME SONG:
	https://www.youtube.com/watch?v=1RsfF-U-DsU

]]

AddCSLuaFile()

ENT.Type = "anim"

ENT.rockTable = {"models/props_wasteland/rockgranite04c.mdl"}

function ENT:Initialize()
	if SERVER then
		self:SetModel(self.rockTable[math.random(#self.rockTable)])

		--self:PhysicsInitStandard()
		--self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		--stop movement
		--self:SetMoveType(0)

		local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:SetMass(1000)
		end
	end

	self.health = 3000
	self.max = self.health
end


function ENT:OnTakeDamage(damageto)
	self.health = self.health - damageto:GetDamage()
	self:SetModelScale( self.health/self.max, 0.2)
	if self.health <= 0 then
		self:EmitSound("physics/concrete/boulder_impact_hard"..math.random(4)..".wav")
		--[[for i = 1,math.random(10,25) do
			local ent1 = ents.Create("3p8_rock_s")
			if ( !IsValid( ent1 ) ) then return end
			ent1:SetPos(self:GetPos()+Vector(math.random(-128, 128),math.random(-128, 128),math.random(-16, 128)))
			ent1:Spawn()
		end]]
		self:Remove()		
	end
end