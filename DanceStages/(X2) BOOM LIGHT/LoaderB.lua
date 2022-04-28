local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame{
	Def.Model {
		Meshes="Map_G1.txt";
		Materials="Map_G1.txt";
		Bones="Map_G1.txt";
		OnCommand=function(self)
			self:zoom(2.1):z(0):blend("BlendMode_Add")
			self:xy(0.7,-7.85+10)
		end,
	};
};
  
t[#t+1] = Def.ActorFrame{
	Def.Model {
		Meshes="Map_G2.txt";
		Materials="Map_G2.txt";
		Bones="Map_G2.txt";
		OnCommand=function(self)
			self:zoom(2.1):z(0):blend("BlendMode_Add")
			self:xy(0.7,-7.85+10)
		end,
	};
};


return t;