local t = Def.ActorFrame{}

	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes="Map.txt";
			Materials="Map.txt";
			Bones="Map.txt";
			OnCommand=function(self)
				self:cullmode(2):zoom(CheckStageConfigurationNumber(1,"StageZoom") )
				self:xy(CheckStageConfigurationNumber(0,"StageXOffset"), CheckStageConfigurationNumber(0,"StageYOffset"))
			end,
		};
	};

return t;