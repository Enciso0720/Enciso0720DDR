local t = Def.ActorFrame{}

	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes="Map_B.txt";
			Materials="Map_B.txt";
			Bones="Map_B.txt";
			OnCommand=function(self)
				self:cullmode(1):zoom(2):blend("BlendMode_Add")
				self:xy(0,-4.55)
			end,
		};
	};

return t;