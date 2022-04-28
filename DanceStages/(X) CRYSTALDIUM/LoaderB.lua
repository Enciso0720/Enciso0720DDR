local t = Def.ActorFrame{}

function DSMap(MapCode,BLEND,DA,bobEOF,bobX,bobY,bobZ,bobPeriod,Y,rY)
	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes=MapCode;
			Materials=MapCode;
			Bones=MapCode;
			InitCommand = function(self)
				self:bob():effectoffset(bobEOF or 0):effectmagnitude(bobX or 0, bobY or 0, bobZ or 0):effectperiod(bobPeriod or 1)
				self:cullmode(2):zoom(2):blend(BLEND):diffusealpha(DA or 1):addy(Y or 0):addrotationy(rY or 0)
			end,
			OnCommand=function(self)
				if MapCode == "Map_D2" then
					self:diffusealpha(0):smooth(1):diffusealpha(1):smooth(1):diffusealpha(0):queuecommand("On")
				end
			end,
		};
	};
end

DSMap("Map_D1","BlendMode_Normal",1,0,0,6.5,0,9,7)
DSMap("Map_D2","BlendMode_Add",1,0,0,6.5,0,9,7)

DSMap("Map_D1","BlendMode_Normal",1,3,0,6.5,0,9,7,120)
DSMap("Map_D2","BlendMode_Add",1,3,0,6.5,0,9,7,120)

DSMap("Map_D1","BlendMode_Normal",1,6,0,6.5,0,9,7,240)
DSMap("Map_D2","BlendMode_Add",1,6,0,6.5,0,9,7,240)

return t;