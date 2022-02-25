local t = Def.ActorFrame{}

	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes="Map_A.txt";
			Materials="Map_A.txt";
			Bones="Map_A.txt";
			OnCommand=function(self)
				self:cullmode(2):zoom(CheckStageConfigurationNumber(1,"StageZoom") )
				self:xy(CheckStageConfigurationNumber(0,"StageXOffset"), CheckStageConfigurationNumber(0,"StageYOffset"))
			end,
		};
	};

return t;


--[[ return Def.Model {
	Meshes="Map_A.txt";
	Materials="Map_A.txt";
	Bones="Map_A.txt";
	OnCommand=function(self)
		self:cullmode(2):zoom(CheckStageConfigurationNumber(1,"StageZoom") )
		self:xy(CheckStageConfigurationNumber(0,"StageXOffset"), CheckStageConfigurationNumber(0,"StageYOffset"))
	end,
}; ]]