local t = Def.ActorFrame{}

	function DSMap(MapCode, BLEND, sX, sY, sZ,bobEOF,bobY, bobPeriod, Y,rY)
		t[#t + 1] =
			Def.ActorFrame {
			InitCommand = function(self)
			end,
			Def.Model {
				Meshes = MapCode .. ".txt",
				Materials = MapCode .. ".txt",
				Bones = MapCode .. ".txt",
				InitCommand = function(self)
					self:cullmode(2):blend(BLEND)
					self:xy(0,-10):zoom(2):addy(Y or 0):addrotationy(rY or 0)
					self:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0)
					if MapCode == "Map_E1" or MapCode == "Map_E2" then
						self:bob():effectoffset(bobEOF or 0):effectmagnitude(0, bobY or 0, 0):effectperiod(bobPeriod or 0)
					end
				end,
			}
		}
	end

	DSMap("Map_A1","BlendMode_Add")
	DSMap("Map_A2","BlendMode_Add")
	DSMap("Map_A2","BlendMode_Add")
	DSMap("Map_C1","BlendMode_Normal",0,60)
	DSMap("Map_C2","BlendMode_Normal",0,-60)
	DSMap("Map_B1","BlendMode_Normal",math.random(10,20),math.random(10,20),math.random(10,20))
	DSMap("Map_B2","BlendMode_Normal",math.random(10,20),math.random(10,20),math.random(10,20))
	DSMap("Map_B3","BlendMode_Normal",math.random(10,20),math.random(10,20),math.random(10,20))
	DSMap("Map_B4","BlendMode_Normal",math.random(10,20),math.random(10,20),math.random(10,20))
	DSMap("Map_D","BlendMode_Normal")

return t;