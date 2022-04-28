
local movieRate = string.find(_VERSION, 5.3) and 1 or (1/18)
local list = {}
local callvideo = {}
local Loop = 0

------- FUNCTIONS  -------

local function GetSong()
	if GAMESTATE:IsCourseMode() then
		return GAMESTATE:GetCurrentCourse():GetCourseEntry(GAMESTATE:GetCourseSongIndex()):GetSong()
	else
		return GAMESTATE:GetCurrentSong()
	end
end

local function setVariables()
	Loop = 0
	
	if HasVideo() then
		VideoFileType = {"mp4","avi","mov","m2ts","m2v","wmv","mpg","mpeg"}
		for i=1,#VideoFileType do
			if FILEMAN:DoesFileExist(GetSong():GetMusicPath():sub(1, -4)..VideoFileType[i]) then
				VideoTexture = GetSong():GetMusicPath():sub(1, -4)..VideoFileType[i]
				Loop=0
				break
			end
		end
	else
		list = FILEMAN:GetDirListing("/DanceStages/StageMovies/")
		if #list ~= 0 and GetUserPref("RMStage") == "Random Movies" then
			for i = 1, 7 do
				table.insert(callvideo,i,list[math.random(#list)])
			end
			VideoTexture = "Black.png"
		else
			if FILEMAN:DoesFileExist(GetSong():GetJacketPath()) then
				VideoTexture = GetSong():GetJacketPath()
			else
				VideoTexture = "Black.png"
			end
		end
		Loop=1
	end
end

local function SongMeasureSec()
	local song = GAMESTATE:GetCurrentSong()
	
	if GAMESTATE:GetCurrentCourse() then
		song = GAMESTATE:GetCurrentCourse():GetCourseEntry(GAMESTATE:GetLoadingCourseSongIndex()):GetSong()
	end
	
	local firstBeat = song:GetFirstBeat()
	local td = song:GetTimingData()
	local m = 1;
	
	if td:GetBPMAtBeat(24) > 240 then
		m = 2
	elseif td:GetBPMAtBeat(24) < 120 then
		m = 0.5
	end
	
	if firstBeat < 12 and td:GetBPMAtBeat(4) < 120 then
		m = 0.5
	end
	
	local sec = (td:GetElapsedTimeFromBeat(firstBeat) - td:GetElapsedTimeFromBeat(firstBeat-4)) * m
	
	if sec < 0 then
		sec = 0
	end
	
	return sec
end

------- TEXTURES  -------

setVariables()

local t = Def.ActorFrame {}

t[#t+1] = Def.Actor {
	CurrentSongChangedMessageCommand=function(self)
		setVariables()
	end,
};

------- VIDEO FUNCTIONS  -------

local function MovieBackground(x,z,rY,cL,cR)
	t[#t+1] = Def.ActorFrame {
		InitCommand = function(self)
			self:addx(0):zoom(60):addrotationy(180):addy(-70):addz(130)
		end,
		
		Def.Sprite {
			Texture=VideoTexture,
			InitCommand=function(self)
				self:SetSize(15,8):cropright(cR):cropleft(cL):addrotationy(rY):addx(x):addz(z):loop(Loop):rate(movieRate)
			end,
			OnCommand=function(self)
				if not HasVideo() then
					self:diffuse(color('0,0,0,1')):sleep(VideoTexture == 'Black.png' and SongMeasureSec() or 0):diffuse(color('1,1,1,1')):queuecommand('Play')
				end
			end,
			PlayCommand=function(self)
				if VideoTexture == 'Black.png' and #list ~= 0 then
					self:queuecommand('First'):sleep(SongMeasureSec()*4)
						:queuecommand('Second'):sleep(SongMeasureSec()*4)
						:queuecommand('Third'):sleep(SongMeasureSec()*4)
						:queuecommand('Fourth'):sleep(SongMeasureSec()*4)
						:queuecommand('Fiveth'):sleep(SongMeasureSec()*4)
						:queuecommand('Sixth'):sleep(SongMeasureSec()*4)
						:queuecommand('Seventh'):sleep(SongMeasureSec()*4)
						:queuecommand('Play')
				else
					self:Load(VideoTexture):scaletoclipped(15,8):rate(movieRate)
				end
			end,
			FirstCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[1]):scaletoclipped(15,8):rate(movieRate)
			end,
			SecondCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[2]):scaletoclipped(15,8):rate(movieRate)
			end,
			ThirdCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[3]):scaletoclipped(15,8):rate(movieRate)
			end,
			FourthCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[4]):scaletoclipped(15,8):rate(movieRate)
			end,
			FivethCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[5]):scaletoclipped(15,8):rate(movieRate)
			end,
			SixthCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[6]):scaletoclipped(15,8):rate(movieRate)
			end,
			SeventhCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[7]):scaletoclipped(15,8):rate(movieRate)
			end,
		},
	}
end

local function MovieMonitor(x,z,rY,cL,cR)
	t[#t+1] = Def.ActorFrame {
		InitCommand = function(self)
			self:addz(60):addy(-84.6):addrotationy(180):addrotationx(-30)
		end,
		
		Def.Sprite {
			Texture='Blur.png',
			InitCommand=function(self)
				self:SetSize(170, 110):cropleft(cL):cropright(cR):addrotationy(rY):addz(z):addx(x)
			end,
			OnCommand=function(self)
			end,
		},
		Def.Sprite {
			Texture='ScreenMask.png',
			InitCommand=function(self)
				self:clearzbuffer(true):zwrite(true):blend('BlendMode_NoEffect'):SetSize(170, 130):cropleft(cL):cropright(cR):addrotationy(rY):addz(z):addx(x)
			end,
		},
		Def.Sprite {
			Texture=VideoTexture,
			InitCommand=function(self)
				self:MaskDest():SetSize(170, 93.7):cropleft(cL):cropright(cR):addrotationy(rY):addz(z):addx(x):loop(Loop):rate(movieRate)
			end,
			OnCommand=function(self)
				if not HasVideo() then
					self:diffuse(color('0,0,0,1')):sleep(VideoTexture == 'Black.png' and SongMeasureSec() or 0):diffuse(color('1,1,1,1')):queuecommand('Play')
				end
			end,
			PlayCommand=function(self)
				if VideoTexture == 'Black.png' and #list ~= 0 then
					self:queuecommand('First'):sleep(SongMeasureSec()*4)
						:queuecommand('Second'):sleep(SongMeasureSec()*4)
						:queuecommand('Third'):sleep(SongMeasureSec()*4)
						:queuecommand('Fourth'):sleep(SongMeasureSec()*4)
						:queuecommand('Fiveth'):sleep(SongMeasureSec()*4)
						:queuecommand('Sixth'):sleep(SongMeasureSec()*4)
						:queuecommand('Seventh'):sleep(SongMeasureSec()*4)
						:queuecommand('Play')
				else
					self:Load(VideoTexture):scaletoclipped(170,93.7):rate(movieRate)
				end
			end,
			FirstCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[1]):scaletoclipped(170,93.7):rate(movieRate)
			end,
			SecondCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[2]):scaletoclipped(170,93.7):rate(movieRate)
			end,
			ThirdCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[3]):scaletoclipped(170,93.7):rate(movieRate)
			end,
			FourthCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[4]):scaletoclipped(170,93.7):rate(movieRate)
			end,
			FivethCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[5]):scaletoclipped(170,93.7):rate(movieRate)
			end,
			SixthCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[6]):scaletoclipped(170,93.7):rate(movieRate)
			end,
			SeventhCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[7]):scaletoclipped(170,93.7):rate(movieRate)
			end,
		},
	}
end	

------- BACKGROUND  -------

MovieBackground(0.489073-0.489073,4.65322-4.861138,-12,6/15,8/15)
MovieBackground(0.235377-0.489073,4.65322-5.430948,-36,5/15,9/15)
MovieBackground(-0.537164-0.489073,4.65322-6.126548,-60,4/15,10/15)
MovieBackground(-1.921314-0.489073,4.65322-6.576286,-84,3/15,11/15)
MovieBackground(-3.782269-0.489073,4.65322-6.380692,-108,2/15,12/15)
MovieBackground(-5.762894-0.489073,4.65322-5.237178,-132,1/15,13/15)
MovieBackground(-7.351590-0.489073,4.65322-3.050524,-156,0/15,14/15)
MovieBackground(0.489073-0.489073,4.65322-4.65322,12,7/15,7/15)
MovieBackground(0.573639-0.489073,4.65322-4.843163,36,8/15,6/15)
MovieBackground(1.037164-0.489073,4.65322-5.260523,60,9/15,5/15)
MovieBackground(2.025843-0.489073,4.65322-5.581764,84,10/15,4/15)
MovieBackground(3.473252-0.489073,4.65322-5.429635,108,11/15,3/15)
MovieBackground(5.093763-0.489073,4.65322-4.494033,132,12/15,2/15)
MovieBackground(6.438045-0.489073,4.65322-2.643788,156,13/15,1/15)
MovieBackground(7.000000-0.489073,4.65322-0.000000,180,14/15,0/15)

------- MAP  -------

t[#t+1] = Def.ActorFrame {
	Def.Model {
		Meshes='Map.txt',
		Materials='Map.txt',
		Bones='Map.txt',
		OnCommand=function(self)
			self:cullmode(2):zoom(2)
			self:xy(0,0.15)
		end,
	};
};

------- MONITOR  -------

MovieMonitor(-12.25,-30,-45,0,0.75)
MovieMonitor(12.25,-30,45,0.75,0)
MovieMonitor(0,0,0,0.25,0.25)

return t;