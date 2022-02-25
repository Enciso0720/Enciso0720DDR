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

	------- TEXTURE  -------

	Animation = "/DanceStages/"..DanceStage.."/Texture.ini"
	
	if GAMESTATE:GetCurrentSong():HasJacket() then
		Graphic = GAMESTATE:GetCurrentSong():GetJacketPath()
	elseif GAMESTATE:GetCurrentSong():HasBackground() then
		Graphic = GAMESTATE:GetCurrentSong():GetBackgroundPath()
	end;
	
	local file = RageFileUtil.CreateRageFile()
	file:Open(Animation,2)
	file:Write("[AnimatedTexture]\nFrame0000=../.."..Graphic.."\nDelay0000=1")
	file:Close()
	file:destroy()

return t;