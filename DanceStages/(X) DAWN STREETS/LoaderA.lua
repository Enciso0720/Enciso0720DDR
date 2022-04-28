local t = Def.ActorFrame{}

	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes="Map.txt";
			Materials="Map.txt";
			Bones="Map.txt";
			OnCommand=function(self)
				self:cullmode(2):zoom(8)
				self:xy(0,0.3)
			end,
		};
	};

return t;