local t = Def.ActorFrame{}

function DSMap(MapCode,rY,Pos,rX,Y)
	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes=MapCode;
			Materials=MapCode;
			Bones=MapCode;
			OnCommand=function(self)
				self:cullmode(2):zoom(1)
				self:xy(0,-21.8):addrotationy(rY or 0):position(Pos or 0):addrotationx(rX or 0):addy(Y or 0)
			end,
		};
	};
end

DSMap("Map_A1")
DSMap("Map_C1",180)
DSMap("Map_C1",135,2)
DSMap("Map_C1",-135,2)
DSMap("Map_C1",90)
DSMap("Map_C1",-90)
DSMap("Map_C1",45,2)
DSMap("Map_C1",-45,2)
DSMap("Map_C1",0)
DSMap("Map_A2")
DSMap("Map_A3")


return t;