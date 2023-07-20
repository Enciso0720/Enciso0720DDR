--DANCEDANCEREVOLUTION DANCESTAGES + CHARACTERS FOR PROJECT OUTFOX
--DDR SUPERNOVA PACK
--20/12/2022
--AUTHOR: ENCISO0720
--Please be kind and give the respective credits
--Enjoy!

local t = Def.ActorFrame{}

	function DSMap(MapCode, X, Y, Z, _rate, Zoom, rX, rY, rZ, ModelTime, sX, sY)
		t[#t + 1] =
			Def.ActorFrame {
			InitCommand = function(self)
			end,
			Def.Model {
				Meshes = MapCode .. ".txt",
				Materials = MapCode .. ".txt",
				Bones = MapCode .. ".txt",
				OnCommand = function(self)
					self:blend("BlendMode_Add")
					if MapCode == "Map_A" or MapCode == "Map_G" then
						self:blend("BlendMode_Normal")
					end
					self:cullmode(2):rate(_rate or 1)
					self:xy(0,0)
					self:addx(X or 0):addy(Y or 0):addz(Z or 0):addrotationx(rX or 0):addrotationy(rY or 0):addrotationz(rZ or 0)
						:zoom(5 + (Zoom or 0)):position(ModelTime or 0)
					self:spin():effectmagnitude(sX or 0, sY or 0, 0)
				end
			}
		}
	end

	DSMap("Map_A")
	DSMap("Map_G",0,150,0,1,0,0,0,0,0,0,-10)

	DSMap("Map_C4",-14*5,-9.7*5,20*5,1,0.5)
	DSMap("Map_C2",-14*5,-9.7*5,20*5,1,0.5)
	DSMap("Map_C3",-14*5,-9.7*5,20*5,1,0.5)

	DSMap("Map_C4",14*5,-9.7*5,20*5,1,0.5)
	DSMap("Map_C2",14*5,-9.7*5,20*5,1,0.5)
	DSMap("Map_C3",14*5,-9.7*5,20*5,1,0.5)

	DSMap("Map_C4",-14*5,-36.2*5,20*5,2,0.5)
	DSMap("Map_C1",-14*5,-36.2*5,20*5,2,0.5)
	DSMap("Map_C3",-14*5,-36.2*5,20*5,2,0.5)

	DSMap("Map_C4",14*5,-36.2*5,20*5,2,0.5)
	DSMap("Map_C1",14*5,-36.2*5,20*5,2,0.5)
	DSMap("Map_C3",14*5,-36.2*5,20*5,2,0.5)

	DSMap("Map_C4",-33*5,0,0,2,3,90)
	DSMap("Map_C1",-33*5,0,0,2,3,90)
	DSMap("Map_C3",-33*5,0,0,2,3,90)

	DSMap("Map_C4",33*5,0,0,2,3,90)
	DSMap("Map_C1",33*5,0,0,2,3,90)
	DSMap("Map_C3",33*5,0,0,2,3,90)

	DSMap("Map_C4",-17*5,3,-17*5,2,-2,90)
	DSMap("Map_C1",-17*5,3,-17*5,2,-2,90)
	DSMap("Map_C3",-17*5,3,-17*5,2,-2,90)

	DSMap("Map_C4",17*5,3,-17*5,2,-2,90)
	DSMap("Map_C1",17*5,3,-17*5,2,-2,90)
	DSMap("Map_C3",17*5,3,-17*5,2,-2,90)

	DSMap("Map_C4",-17*5,3,17*5,2,-2,90)
	DSMap("Map_C1",-17*5,3,17*5,2,-2,90)
	DSMap("Map_C3",-17*5,3,17*5,2,-2,90)

	DSMap("Map_C4",17*5,3,17*5,2,-2,90)
	DSMap("Map_C1",17*5,3,17*5,2,-2,90)
	DSMap("Map_C3",17*5,3,17*5,2,-2,90)

	DSMap("Map_D1",35*5,0,20*5)
	DSMap("Map_D2",-35*5,0,20*5)


return t;