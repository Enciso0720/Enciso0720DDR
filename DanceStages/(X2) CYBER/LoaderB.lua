local t = Def.ActorFrame{}

	function DSMap(CM,MapCode, BLEND, sX, sY, sZ,bobEOF,bobY, bobPeriod, Y,rY)
		t[#t + 1] =
			Def.ActorFrame {
			InitCommand = function(self)
			end,
			Def.Model {
				Meshes = MapCode .. ".txt",
				Materials = MapCode .. ".txt",
				Bones = MapCode .. ".txt",
				InitCommand = function(self)
					self:cullmode(CM):blend(BLEND)
					self:xy(0,-10):zoom(2):addy(Y or 0):addrotationy(rY or 0)
					self:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0)
					if MapCode == "Map_E1" or MapCode == "Map_E2" then
						self:bob():effectoffset(bobEOF or 0):effectmagnitude(0, bobY or 0, 0):effectperiod(bobPeriod or 0)
					end
				end,
				OnCommand = function(self)
					if MapCode == "Map_E2" then
						self:diffusealpha(0):smooth(1):diffusealpha(1):smooth(1):diffusealpha(0):queuecommand("On")
					end
				end
			}
		}
	end

	DSMap(2,"Map_E1","BlendMode_Normal",0,0,0,0,6.5,9,25)
	DSMap(1,"Map_E2","BlendMode_Add",0,0,0,0,6.5,9,25)
	DSMap(2,"Map_E2","BlendMode_Add",0,0,0,0,6.5,9,25)
	
	DSMap(2,"Map_E1","BlendMode_Normal",0,0,0,3,6.5,9,25,120)
	DSMap(1,"Map_E2","BlendMode_Add",0,0,0,3,6.5,9,25,120)
	DSMap(2,"Map_E2","BlendMode_Add",0,0,0,3,6.5,9,25,120)

	DSMap(2,"Map_E1","BlendMode_Normal",0,0,0,6,6.5,9,25,240)
	DSMap(1,"Map_E2","BlendMode_Add",0,0,0,6,6.5,9,25,240)
	DSMap(2,"Map_E2","BlendMode_Add",0,0,0,6,6.5,9,25,240)

return t;