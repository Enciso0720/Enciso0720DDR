
local movieRate = string.find(_VERSION, 5.3) and 1 or (1/19)
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


------- VIDEO FUNCTIONS -------

function Monitor(X, Y, Z, rX, rY, rZ)
	t[#t+1] = Def.ActorFrame {
		OnCommand = function(self)
			self:x(X):y(Y-5.4):z(Z):rotationx(rX):rotationy(rY):rotationz(rZ)
		end,

			Def.Sprite {
			Texture=VideoTexture,
			InitCommand = function(self)
				self:SetSize(40,30):rotationy(180)
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
					self:Load(VideoTexture):scaletoclipped(40,30):rate(movieRate)
				end
			end,
			FirstCommand=function(self)
				self:Load("/DanceStages/StageMovies/"..callvideo[1]):scaletoclipped(40,30):rate(movieRate)
				end;
			SecondCommand=function(self)
				self:Load("/DanceStages/StageMovies/"..callvideo[2]):scaletoclipped(40,30):rate(movieRate)
				end;
			ThirdCommand=function(self)
				self:Load("/DanceStages/StageMovies/"..callvideo[3]):scaletoclipped(40,30):rate(movieRate)
				end;
			FourthCommand=function(self)
				self:Load("/DanceStages/StageMovies/"..callvideo[4]):scaletoclipped(40,30):rate(movieRate)
				end;
			FivethCommand=function(self)
				self:Load("/DanceStages/StageMovies/"..callvideo[5]):scaletoclipped(40,30):rate(movieRate)
				end;
			SixthCommand=function(self)
				self:Load("/DanceStages/StageMovies/"..callvideo[6]):scaletoclipped(40,30):rate(movieRate)
				end;
			SeventhCommand=function(self)
				self:Load("/DanceStages/StageMovies/"..callvideo[7]):scaletoclipped(40,30):rate(movieRate)
				end;
			};

			Def.Sprite {
				InitCommand = function(self)
					self:SetSize(40, 30)
				end,
				Texture = "Tex_0006_1.png"
			}
		}
end

function BigMonitor(x,z,rY,cL,cR)
	t[#t+1] = Def.ActorFrame{
		OnCommand = function(self)
			self:addx(0):zoom(37):addy(-85):addz(120):addrotationy(180)
		end,

		Def.Sprite {
			Texture=VideoTexture,
			InitCommand = function(self)
				self:SetSize(6,4):x(x):z(z):rotationy(rY):cropleft(cL):cropright(cR):loop(Loop):rate(movieRate)
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
					self:Load(VideoTexture):scaletoclipped(6,4):rate(movieRate)
				end
			end,
			FirstCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[1]):scaletoclipped(6,4):rate(movieRate)
			end,
			SecondCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[2]):scaletoclipped(6,4):rate(movieRate)
			end,
			ThirdCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[3]):scaletoclipped(6,4):rate(movieRate)
			end,
			FourthCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[4]):scaletoclipped(6,4):rate(movieRate)
			end,
			FivethCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[5]):scaletoclipped(6,4):rate(movieRate)
			end,
			SixthCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[6]):scaletoclipped(6,4):rate(movieRate)
			end,
			SeventhCommand=function(self)
				self:Load('/DanceStages/StageMovies/'..callvideo[7]):scaletoclipped(6,4):rate(movieRate)
			end,
		};

		Def.Sprite {
			Texture = "BigScreen.png",
			OnCommand = function(self)
				self:x(x):z(z):rotationy(rY):cropleft(cL):cropright(cR)
				self:SetSize(6,4)
			end,
		};
	}
end

------- MAP  -------

function DSMap(Code)
	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes=Code..".txt";
			Materials=Code..".txt";
			Bones=Code..".txt";
			OnCommand=function(self)
				self:cullmode(2):zoom(2)
				self:xy(0,-5.4)
			end,
		};
	};
end

------- BACKGROUND STAGE  -------

DSMap("Map_B")

------- MONITORS  -------

Monitor(-70, 20, 110, 0, 10, 0)
Monitor(70, 20, 110, 0, -10, 0)


Monitor(-70, -50, 110, 0, 10, 0)
Monitor(70, -50, 110, 0, -10, 0)


------- BIG MONITOR  -------

BigMonitor(-0.115,-0.68,-20,0,0.835)
BigMonitor(0,0,0,0.165,0.165)
BigMonitor(0.115,-0.68,20,0.835,0)

------- MONITORS  -------

Monitor(-130, -95, 75, 0, 60, 0)
Monitor(130, -95, 75, 0, -60, 0)


Monitor(-150, -55, 0, 0, 80, 0)
Monitor(150, -55, 0, 0, -80, 0)


Monitor(-150, 25, 0, 0, 80, 0)
Monitor(150, 25, 0, 0, -80, 0)


Monitor(-130, -17, -75, 0, 120, 0)
Monitor(130, -17, -75, 0, -120, 0)

Monitor(-130, -17, 75, 0, 60, 0)
Monitor(130, -17, 75, 0, -60, 0)


Monitor(-130, -95, -75, 0, 120, 0)
Monitor(130, -95, -75, 0, -120, 0)

------- PLATFORM  -------

DSMap("Map_A")

--It's not necessary use LoaderB for this purpose

return t;