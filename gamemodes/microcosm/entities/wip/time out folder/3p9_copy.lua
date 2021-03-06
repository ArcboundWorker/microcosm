--[[
	3p8
	Uses:		Required for the gamemode to work.
				Initializes all the global variables.
				Spawns plants
				Spawns planets
				Spawns cities
					cities spawn shops
					and teleporters

	Todo:		

]]

AddCSLuaFile()

ENT.Type = "anim"

ENT.Model = "models/props_combine/breenglobe.mdl"

--need a list of ENT. variables for city/shop positions
--ENT.OasisCityPos = Vector(2373, -802, 0)
--Hillfort Version
ENT.OasisShopPos = Vector(0, 0, 0)
--Edgewood version
--ENT.OasisShopPos = Vector(1097, 3475, 48)

--ENT.BlkLbCityPos = Vector(2533, -959, 0)
ENT.BlkLbShopPos = Vector(-5444, 1544, 92)
ENT.oblcmShopPos = Vector(-3765, 6125, -448)
ENT.wggShopPos = Vector(1188, 7649, -123)

OW_CITY_POS = 	{
					Vector(535, 60, 1488), --OasisCityPos
					Vector(958, 571, 1488), --BlkLbCityPos
					Vector(100, 604, 1488), --oblcomp
					Vector(1029, -348, 1488) --Western GG wgg
				}

--ENT.TeleOffset = Vector(0,0,64)
--not really in the overworld OW
OW_CITY_TELE_POS = 	{
						Vector(2454, 900, 128) + Vector(0,0,60), --Oasis
						Vector(-5212, 1233, 92) + Vector(0,0,60), --BlkLb
						Vector(-4698, 6323, -448) + Vector(0,0,60), --oblcm
						Vector(804, 8757, -139) + Vector(0,0,60) --Western GG wgg
					}

ENT.sunPos = Vector(0,0,2208)

ENT.Tower1Pos = Vector(309, 624, 1495)
ENT.Tower2Pos = Vector(55, 439, 1495)

--has the following format
	--name="what it will show up as in the shop",
	--desc="the description of the item in the shop",
	--cost=1 --cost of the item in the shop
	--pv="models/hunter/misc/sphere025x025.mdl" --the preview model in the shop
	--ent="the_ent_name"
	--soundSell="ambient/levels/labs/coinslot1.wav" --noise to make when sold

--The array all buyable and sellable items
ENT.ItemList = {
	{
		name="Coconut",
		desc="In some tribal societies the more coconuts you have, the more powerful you are.",
		cost=200,
		pv="models/hunter/misc/sphere025x025.mdl",
		ent="3p8_kookospahkina_puu",
		soundSell="ambient/levels/labs/coinslot1.wav"
		--softcap=50, --would be used for the shop/villager AI to signal a sell order
	},
	{
		name="Potato",
		desc="Might be a beautiful french fry some day.",
		cost=200,
		pv="models/props_phx/misc/potato.mdl",
		ent="3p8_potato_ent",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Potato Head",
		desc="Is somebody coming back to life? A new species? Good for science. Thanks.",
		cost=1000,
		--consider changing pv to a cheaple or something?
		pv="models/props_phx/misc/potato.mdl",
		ent="3p8_potato_head",
		soundSell="vo/eli_lab/al_minefield.wav"
	},
	{
		name="Pizza",
		desc="Yea, of course we have it!",
		cost=240,
--SET PV
		pv="models/props_docks/channelmarker_gib01.mdl",
		ent="3p8_pizza",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Log",
		desc="Put it in the sawmill to make a wall.",
		cost=200,
		pv="models/props_docks/channelmarker_gib01.mdl",
		ent="micro_item_salainen_puulle",
		soundSell="ambient/machines/hydraulic_1.wav"
	},
	{
		name="Rock",
		desc="Found all over. Exhaustible though.",
		cost=500,
		pv="models/props_wasteland/rockgranite03c.mdl",
		ent="3p8_rock_s",
		soundSell="ambient/machines/hydraulic_1.wav"
	},
	{
		name="Metal",
		desc="Refined. Like my humor.",
		cost=1000,
		pv="models/props_c17/oildrumchunk01a.mdl",
		ent="3p8_metal",
		soundSell="ambient/materials/platedrop1.wav"
	},
	{
		name="Med Kit",
		desc="100 units of HP.",
		cost=100,
		pv="models/items/healthkit.mdl",
		ent="micro_item_medkit",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Armor Kit",
		desc="100 units of body armor.",
		cost=1000,
		pv="models/items/battery.mdl",
		ent="micro_item_armorkit",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Pizza Kit",
		desc="3 units of pizza to ate. INSTRUCTIONS: Put in oven. Pizza come out. Cool. We love 3p8!",
		cost=500,
--SET DAT PV
		pv="models/items/battery.mdl",
		ent="3p8_pizzakit",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Coconut Collector",
		desc="Can carry and preserve 5 coconuts.",
		cost=250,
		pv="models/props_junk/cardboard_box001a.mdl",
		ent="3p8_collector_puu",
		soundSell="items/ammocrate_open.wav"
	},
	{
		name="Log Collector",
		desc="Can carry and preserve 5 logs.",
		cost=250,
		pv="models/props_junk/wood_crate002a.mdl",
		ent="3p8_collector_puulle",
		soundSell="items/ammocrate_open.wav"
	},
	{
		name="Rock Collector",
		desc="Can carry and preserve 5 rocks.",
		cost=250,
		pv="models/props_wasteland/laundry_washer001a.mdl",
		ent="3p8_collector_rock",
		soundSell="items/ammocrate_open.wav"
	},
	{
		name="Metal Collector",
		desc="Can carry and preserve 5 metal pieces.",
		cost=250,
		pv="models/props_lab/filecabinet02.mdl",
		ent="3p8_collector_metal",
		soundSell="items/ammocrate_open.wav"
	},
	{
		name="Pizza Box",
		desc="Can carry and preserve 3 pizzas!",
		cost=100,
		pv="models/props_c17/consolebox01a.mdl",
		ent="3p8_collector_pizza",
		soundSell="items/ammocrate_open.wav"
	},
	{
		name="Collectable Food",
		desc="Exotic food that restores health! It's 1 of 11 collectable foods. Collect them all!",
		cost=500,
		pv="models/slyfo_2/acc_food_meatsandwich.mdl",
		ent="micro_item_collectable_food",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Collectable Toy",
		desc="A ball, a doll, or something special. Contains 1 of 5. Collect them all!",
		cost=1000,
		pv="models/props/de_tides/vending_turtle.mdl",
		ent="micro_item_collectable_toys",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Collectable Decoration",
		desc="Show off loot in your richie-rich spaceship! Contains 1 of 11. Collect them all!",
		cost=5000,
		pv="models/maxofs2d/gm_painting.mdl",
		ent="micro_item_collectable_deco",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Fixer Tool",
		desc="Allows you to repair things... like your vehicle!",
		cost=10000,
		pv="models/weapons/w_toolgun.mdl",
		ent="micro_fixer",
		soundSell="weapons/physcannon/superphys_small_zap1.wav"
	},
	{
		name="Fixer Fuel",
		desc="Reloads 100 units of fixer fuel.",
		cost=1000,
		pv="models/items/car_battery01.mdl",
		ent="micro_item_fixerfuel",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Standard Cannon Shells",
		desc="Reloads 200 standard cannon shells.",
		cost=1000,
		pv="models/items/ar2_grenade.mdl",
		ent="micro_item_shell_1",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Hook Cannon Shells",
		desc="Reloads 4 hook cannon shells.",
		cost=500,
		pv="models/props_junk/meathook001a.mdl",
		ent="micro_item_shell_2",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Use Cannon Shells",
		desc="Reloads 8 use cannon shells.",
		cost=500,
		pv="models/dav0r/buttons/button.mdl",
		ent="micro_item_shell_3",
		soundSell="ambient/levels/labs/coinslot1.wav"
	},
	{
		name="Spinny Ball",
		desc="Slightly-used ball that has spinny parts in it. Looks cool. Might be useful.",
		cost=3000,
		pv="models/maxofs2d/hover_rings.mdl",
		ent="3p8_hate",
		soundSell="ambient/levels/labs/coinslot1.wav"
	}
	--models/weapons/w_package.mdl --the package from the citizen at the trainstation
}

--controls if the potatos should automatically plant themselves or not.
GLOBAL_potato = 		0
GLOBAL_potato_max = 	50

--controls if the coconuts should automatically plant themselves or not.
GLOBAL_coconut = 		0
GLOBAL_coconut_max =	75

--controls if grass should automatically plant themselves or not.
GLOBAL_grass = 			0
GLOBAL_grass_max =		150

function ENT:Initialize()
	self.distanceToGround = -68
	self.fuckNature = false

	self:SetModel(self.Model)
	self:SetMaterial("models/effects/splodeglass_sheet") --make invis
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER) --make nocollide
	self:SetModelScale(0.01, 0) --make super small
	THREEPATE_ENT_ID = self:EntIndex()

	if SERVER then
		if !self.fuckNature then
			for i = 1,10 do
				--print("making coconut again")
				newFruit = ents.Create("3p8_kookospahkina_puu")
				if ( !IsValid( newFruit ) ) then return end
				newFruit:SetPos(self:GetPos() + Vector(math.random(-512,512),math.random(-512,512),128+math.random(0,25)))
				--might spawn coconuts off map...
				newFruit:Spawn()
				newFruit:GetPhysicsObject():Wake()
			end
			for i = 1,10 do
				newFruit = ents.Create("3p8_potato_ent")
				if ( !IsValid( newFruit ) ) then return end
				newFruit:SetPos(self:GetPos() + Vector(math.random(-512,512),math.random(-512,512),math.random(0,25)))
				--might spawn off map...
				newFruit:Spawn()
				newFruit:GetPhysicsObject():Wake()
			end
			--for j = -16,16 do
				for i = 1,15 do
					newFruit = ents.Create("3p8_grass")
					if ( !IsValid( newFruit ) ) then return end
					newFruit:SetPos(self:GetPos() + Vector(math.random(-512,512),math.random(-512,512),math.random(0,25)))
					--might spawn off map...
					newFruit:Spawn()
					--print(j+self.distanceToGround)
				end
			--end]]
		end

		oasis = ents.Create("3p8_ow_city")
		if ( !IsValid( oasis ) ) then return end
		oasis.CityNum = 1
		oasis.CityName = "Paradise Oasis"
		oasis.Model = "models/props_lab/cactus.mdl"
		oasis:SetNWEntity("ParentEnt", self)
		oasis.ParentEnt = oasis:GetNWEntity("ParentEnt", "error")
		oasis:SetPos(OW_CITY_POS[oasis.CityNum])
		oasis.ShopPos = self.OasisShopPos
		oasis.TelePos = OW_CITY_TELE_POS[oasis.CityNum]
		
		--set angles here too

		--will set the city's shop stock here
			--stock is only used to initialize, otherwise it is just a list of ent names
		local oasisStocks = {
			{
				ent = "3p8_kookospahkina_puu",
				stock = 50
			},
			{
				ent = "3p8_potato_ent",
				stock = 25
			},
			{
				ent = "3p8_pizza",
				stock = 3
			},
			{
				ent = "3p8_metal",
				stock = 10
			},
			{
				ent = "micro_item_medkit",
				stock = 10
			},
			{
				ent = "micro_item_armorkit",
				stock = 10
			},
			{
				ent = "3p8_pizzakit",
				stock = 100
			},
			{
				ent = "3p8_collector_puu",
				stock = 100
			},
			{
				ent = "3p8_collector_puulle",
				stock = 100
			},
			{
				ent = "3p8_collector_rock",
				stock = 100
			},
			{
				ent = "3p8_collector_metal",
				stock = 100
			},
			{
				ent = "3p8_collector_pizza",
				stock = 150
			},
			{
				ent = "micro_item_collectable_food",
				stock = 100
			},
			{
				ent = "micro_item_collectable_toys",
				stock = 50
			},
			{
				ent = "micro_item_collectable_deco",
				stock = 25
			},
			{
				ent  = "3p8_hate",
				stock = 1
			}
		}
		oasis.StockArray = oasisStocks
		oasis:Spawn()

		

		blacklabs = ents.Create("3p8_ow_city")
		if ( !IsValid( blacklabs ) ) then return end
		blacklabs.CityNum = 2
		blacklabs.CityName = "Black Labs"
		blacklabs.Model = "models/props_c17/suitcase001a.mdl"
		blacklabs:SetNWEntity("ParentEnt", self)
		blacklabs.ParentEnt = blacklabs:GetNWEntity("ParentEnt", "error")
		blacklabs:SetPos(OW_CITY_POS[blacklabs.CityNum])
		blacklabs.ShopPos = self.BlkLbShopPos
		blacklabs.TelePos = OW_CITY_TELE_POS[blacklabs.CityNum]
		--set angles here too

		--will set the city's shop stock here
			--stock is only used to initialize, otherwise it is just a list of ent names
		local blacklabsStocks = {
			{
				ent = "3p8_rock_s",
				stock = 50
			},
			{
				ent = "3p8_metal",
				stock = 15
			},
			{
				ent = "micro_item_medkit",
				stock = 100
			},
			{
				ent = "micro_item_armorkit",
				stock = 100
			},
			{
				ent = "3p8_collector_rock",
				stock = 100
			},
			{
				ent = "3p8_collector_metal",
				stock = 100
			},
			{
				ent="micro_item_shell_1",
				stock = 10
			},
			{
				ent="micro_fixer",
				stock = 50
			},
			{
				ent="micro_item_fixerfuel",
				stock = 150
			}
		}
		blacklabs.StockArray = blacklabsStocks
		blacklabs:Spawn()



		oblcomp = ents.Create("3p8_ow_city")
		if ( !IsValid( oblcomp ) ) then return end
		oblcomp.CityNum = 3
		oblcomp.CityName = "TBD Compound"
		oblcomp.Model = "models/props_wasteland/prison_padlock001a.mdl"
		oblcomp:SetNWEntity("ParentEnt", self)
		oblcomp.ParentEnt = oblcomp:GetNWEntity("ParentEnt", "error")
		oblcomp:SetPos(OW_CITY_POS[oblcomp.CityNum])
		oblcomp.ShopPos = self.oblcmShopPos
		oblcomp.TelePos = OW_CITY_TELE_POS[oblcomp.CityNum]
		--set angles here too

		--will set the city's shop stock here
			--stock is only used to initialize, otherwise it is just a list of ent names
		local oblcompStocks = {
			{
				ent="micro_item_collectable_food",
				stock = 150
			},
			{
				ent = "3p8_rock_s",
				stock = 10
			},
			{
				ent = "3p8_kookospahkina_puu",
				stock = 15
			},
			{
				ent = "3p8_potato_ent",
				stock = 25
			}
		}
		oblcomp.StockArray = oblcompStocks
		oblcomp:Spawn()



		wgg = ents.Create("3p8_ow_city")
		if ( !IsValid( wgg ) ) then return end
		wgg.CityNum = 4
		wgg.CityName = "gg"
		wgg.Model = "models/props_combine/breenglobe.mdl"
		wgg:SetNWEntity("ParentEnt", self)
		wgg.ParentEnt = wgg:GetNWEntity("ParentEnt", "error")
		wgg:SetPos(OW_CITY_POS[wgg.CityNum])
		wgg.ShopPos = self.wggShopPos
		wgg.TelePos = OW_CITY_TELE_POS[wgg.CityNum]
		--set angles here too

		--will set the city's shop stock here
			--stock is only used to initialize, otherwise it is just a list of ent names
		local wggStocks = {
			{
				ent="micro_item_collectable_food",
				stock = 5
			},
			{
				ent = "3p8_rock_s",
				stock = 1
			}
		}
		wgg.StockArray = wggStocks
		wgg:Spawn()



		--space
		--sun = ents.Create("3p8_sky_sun")
		--if ( !IsValid( sun ) ) then return end
		--sun:SetPos(self.sunPos)
		--sun:Spawn()

		--microcosm car
		--done in shared.lua

		--a tower
		tower1 = ents.Create("ow_tower")
		if ( !IsValid( tower1 ) ) then return end
		tower1:SetPos(self.Tower1Pos)
		tower1:SetModel("models/props_c17/lamp001a.mdl")
		tower1:SetMaterial("models/props_combine/com_shield001a")
		tower1:Spawn()

		tower2 = ents.Create("ow_tower")
		if ( !IsValid( tower2 ) ) then return end
		tower2:SetPos(self.Tower2Pos)
		tower2:SetModel("models/props_c17/lamp001a.mdl")
		tower2:SetMaterial("models/props_combine/com_shield001a")
		tower2:Spawn()

		jet1 = ents.Create("ow_jet")
		if ( !IsValid( jet1 ) ) then return end
		jet1:SetPos(Vector(500, 1200, 2000))
		jet1:SetModel("models/xqm/jetbody3.mdl")
		jet1.Home = OW_CITY_POS[oblcomp.CityNum]
		jet1:Spawn()

		jet2 = ents.Create("ow_jet")
		if ( !IsValid( jet2 ) ) then return end
		jet2:SetPos(Vector(700, 1400, 2200))
		jet2:SetModel("models/xqm/jetbody3.mdl")
		jet2.Home = OW_CITY_POS[oblcomp.CityNum]
		jet2:Spawn()

		jet3 = ents.Create("ow_jet")
		if ( !IsValid( jet3 ) ) then return end
		jet3:SetPos(Vector(900, 1600, 2400))
		jet3:SetModel("models/xqm/jetbody3.mdl")
		jet3.Home = OW_CITY_POS[oblcomp.CityNum]
		jet3:Spawn()

		
	end
end
