local t = Def.ActorFrame{}

	function DSMap(MapCode,RY,Pos)
		t[#t+1] = Def.ActorFrame{
			Def.Model {
				Meshes=MapCode;
				Materials=MapCode;
				Bones=MapCode;
				InitCommand=function(self)
				end,
				OnCommand=function(self)
					self:cullmode(1):zoom(1):blend("BlendMode_Add")
					self:xy(0,-21.8):addrotationy(RY or 0):position(Pos or 0)
				end,
			};
		};
	end

	DSMap("Map_B")
	DSMap("Map_C21",180)
	DSMap("Map_C22",135,2)
	DSMap("Map_C22",-135,2)
	DSMap("Map_C21",90)
	DSMap("Map_C21",-90)
	DSMap("Map_C22",45,2)
	DSMap("Map_C22",-45,2)
	DSMap("Map_C21",0)

	t[#t+1] = LoadActor("Stars/LoaderStar.lua");

return t;