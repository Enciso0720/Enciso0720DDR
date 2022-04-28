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
		};
	};
end

DSMap("Map_A1","BlendMode_Normal")
DSMap("Map_A2","BlendMode_Add",0.5,0,0,10,0,15)
DSMap("Map_A3","BlendMode_Add",0.6)

DSMap("Map_B","BlendMode_Normal")

DSMap("Map_E","BlendMode_Normal")

DSMap("Map_C1","BlendMode_Normal",1,0,0,10,0,8)
DSMap("Map_C2","BlendMode_Normal",1,3,0,10,0,8)
DSMap("Map_C3","BlendMode_Normal",1,6,0,10,0,8)

return t;