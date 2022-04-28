local t = Def.ActorFrame{}

	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes="Map_A1.txt";
			Materials="Map_A1.txt";
			Bones="Map_A1.txt";
			OnCommand=function(self)
				self:cullmode(2):zoom(2)
				self:xy(0,-4.55)
			end,
		};
	};

	t[#t+1] = LoadActor("Stars/LoaderStar.lua");

	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes="Map_A3.txt";
			Materials="Map_A3.txt";
			Bones="Map_A3.txt";
			OnCommand=function(self)
				self:cullmode(2):zoom(2)
				self:xy(0,-4.55)
			end,
		};
	};

	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes="Map_A2.txt";
			Materials="Map_A2.txt";
			Bones="Map_A2.txt";
			OnCommand=function(self)
				self:cullmode(2):zoom(2):blend("BlendMode_Add")
				self:xy(0,-4.55)
			end,
		};
	};
return t;