local t = Def.ActorFrame{}
local Loop,Pos1,Pos2=0,0,0

if HasVideo() then
    VideoFileType = {"mp4","avi","mov","m2ts","m2v","wmv","mpg","mpeg"}
    for i=1,#VideoFileType do
        if FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4)..VideoFileType[i]) then
            VT1 = GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4)..VideoFileType[i]
            VT2, VT3, VT4 = VT1, VT1, VT1
            Loop=0
            break
        end
    end
else
    if FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetJacketPath()) then
        VT1 = GAMESTATE:GetCurrentSong():GetJacketPath()
    else
        VT1 = "Black.png"
    end
    VT2 = "Movie2.mp4"
    VT3 = "Movie3.mp4"
    VT4 = "Movie1.mp4"
    Loop = 1
    Pos1=13
    Pos2=28
end

function Display(X, Y, Z, rX, rY, rZ, sizeX, sizeY, CM, DIFFUSE, VideoTexture, Pos)
    t[#t + 1] =
        Def.Sprite {
        OnCommand = function(self)
            self:x(X):y(Y):z(Z):addrotationx(rX):addrotationy(rY):addrotationz(rZ):SetSize(sizeX, sizeY)
                :cullmode(CM):diffusealpha(DIFFUSE):position(Pos or 0):loop(Loop or 0)
                if _VERSION ~= "Lua 5.3" and HasVideo() then self:rate(1/32) 
                elseif _VERSION ~= "Lua 5.3" and not HasVideo() then self:rate((1/31)*3) end
        end,
        Texture = VideoTexture
    }
end

function LittleScreenMarqueeCapture(_x, _y, _z, _ry, sizeX, sizeY)
	t[#t + 1] =
		Def.Sprite {
		OnCommand = function(self)
			self:cullmode(2):SetSize(sizeX or 35, sizeY or 25):y(_y):z(_z):x(_x):addrotationy(_ry):queuecommand(
				"UpdateRate"
			):addrotationy(180)
		end,
		UpdateRateCommand = function(self)
		end,
		Texture = "Tex_0006_1.png"
	}
end

function UpperLEDs(_x, _y, _z, _ry, sizeX, sizeY)
	t[#t + 1] =
		Def.Sprite {
		OnCommand = function(self)
			self:cullmode(2):SetSize(sizeX or 35, sizeY or 25):y(_y):z(_z):x(_x):addrotationy(_ry):queuecommand("UpdateRate"):addrotationy(180)
		end,
		UpdateRateCommand = function(self)
            self:diffusealpha(1):smooth(1):diffusealpha(0):smooth(1):diffusealpha(1):queuecommand("UpdateRate")
		end,
		Texture = "Tex_0006_2.png"
	}
end

function DSMap(MapCode, _CM, X, Y, Z, rX, rY, rZ, Zo, ModelTime, sX, sY, sZ, bobX, bobY, bobZ, bobEOF, bobPeriod, Diffuse)
    t[#t + 1] =
        Def.ActorFrame {
        InitCommand = function(self)
            self:bob():effectoffset(bobEOF or 0):effectmagnitude(bobX or 0, bobY or 0, bobZ or 0):effectperiod(bobPeriod or 1)
        end,
        Def.Model {
            Meshes = MapCode .. ".txt",
            Materials = MapCode .. ".txt",
            Bones = MapCode .. ".txt",
            OnCommand = function(self)
                self:cullmode(_CM):zoom(15)
                self:xy(0,0.15)
                self:addx(X or 0):addy(Y or 0):addz(Z or 0):addrotationx(rX or 0):addrotationy(rY or 0):addrotationz(
                    rZ or 0
                ):zoom(15 + (Zo or 0)):position(ModelTime or 0)
                self:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0):diffusealpha(Diffuse or 1)
                if MapCode == "Map_D" then
                    self:glowshift()
                    self:effectcolor1(color("#000000"))
                    self:effectcolor2(color("#73d8ee"))
                    self:effectperiod(2)
                end
                if MapCode == "Map_F" then
                    self:glowshift()
                    self:diffusealpha(0.75)
                    self:effectcolor1(color("#e4ee73"))
                    self:effectcolor2(color("#ccf6ff"))
                    self:effectperiod(5)
                end
                if string.match(MapCode,"_1") then
                    self:glowshift()
                    self:effectcolor1(color("#a7b8e6"))
                    self:effectcolor2(color("#ccf6ff"))
                    self:effectperiod(4)
                    self:blend("BlendMode_Add")
                end
            end
        }
    }
end

        DSMap("Map_A", 2)
        DSMap("Map_B", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10)

        Display(76, -56, 142, 0, -26, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(112, -56, 115, 0, -44, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(140, -56, 80, 0, -60, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(155, -56, 40, 0, -74, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(161, -56, 0, 0, -88, 0, -35, 25, 2, 1, VT3, Pos1)

        Display(-76, -56, 142, 0, 26, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(-112, -56, 115, 0, 44, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(-140, -56, 80, 0, 60, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(-155, -56, 40, 0, 74, 0, -35, 25, 2, 1, VT3, Pos1)
        Display(-161, -56, 0, 0, -88, 0, -35, 25, 2, 1, VT3, Pos1)

        Display(95, -93, 130, 0, -36, 0, -35, 25, 2, 1, VT4, Pos2)
        Display(127, -93, 99, 0, -52, 0, -35, 25, 2, 1, VT4, Pos2)
        Display(149, -93, 60, 0, -68, 0, -35, 25, 2, 1, VT4, Pos2)
        Display(160, -93, 16, 0, -84, 0, -35, 25, 2, 1, VT4, Pos2)

        Display(-95, -93, 130, 0, 36, 0, -35, 25, 2, 1, VT4, Pos2)
        Display(-127, -93, 99, 0, 52, 0, -35, 25, 2, 1, VT4, Pos2)
        Display(-149, -93, 60, 0, 68, 0, -35, 25, 2, 1, VT4, Pos2)
        Display(-160, -93, 16, 0, 84, 0, -35, 25, 2, 1, VT4, Pos2)

        Display(95, -19, 130, 0, -36, 0, -35, 25, 2, 1, VT2)
        Display(127, -19, 99, 0, -52, 0, -35, 25, 2, 1, VT2)
        Display(149, -19, 60, 0, -68, 0, -35, 25, 2, 1, VT2)
        Display(160, -19, 16, 0, -84, 0, -35, 25, 2, 1, VT2)

        Display(-95, -19, 130, 0, 36, 0, -35, 25, 2, 1, VT2)
        Display(-127, -19, 99, 0, 52, 0, -35, 25, 2, 1, VT2)
        Display(-149, -19, 60, 0, 68, 0, -35, 25, 2, 1, VT2)
        Display(-160, -19, 16, 0, 84, 0, -35, 25, 2, 1, VT2)

        Display(0, -150, 150, 0, 0, 0, -50, 35, 2, 1, VT2)
        Display(140, -150, 80, 0, -60, 0, -50, 35, 2, 1, VT2)
        Display(140, -150, -80, 0, -120, 0, -50, 35, 2, 1, VT2)
        Display(-140, -150, 80, 0, 60, 0, -50, 35, 2, 1, VT2)
        Display(-140, -150, -80, 0, 120, 0, -50, 35, 2, 1, VT2)

        LittleScreenMarqueeCapture(0, -150, 150, 0, -50, 35)
        LittleScreenMarqueeCapture(140, -150, 80, -60, -50, 35)
        LittleScreenMarqueeCapture(140, -150, -80, -120, -50, 35)
        LittleScreenMarqueeCapture(-140, -150, 80, 60, -50, 35)
        LittleScreenMarqueeCapture(-140, -150, -80, 120, -50, 35)

        UpperLEDs(0, -150, 150, 0, -55, 40)
        UpperLEDs(140, -150, 80, -60, -55, 40)
        UpperLEDs(140, -150, -80, -120, -55, 40)
        UpperLEDs(-140, -150, 80, 60, -55, 40)
        UpperLEDs(-140, -150, -80, 120, -55, 40)

        LittleScreenMarqueeCapture(76, -56, 142, -26)
        LittleScreenMarqueeCapture(112, -56, 115, -44)
        LittleScreenMarqueeCapture(140, -56, 80, -60)
        LittleScreenMarqueeCapture(155, -56, 40, -74)
        LittleScreenMarqueeCapture(161, -56, 0, -88)

        LittleScreenMarqueeCapture(-76, -56, 142, 26)
        LittleScreenMarqueeCapture(-112, -56, 115, 44)
        LittleScreenMarqueeCapture(-140, -56, 80, 60)
        LittleScreenMarqueeCapture(-155, -56, 40, 74)
        LittleScreenMarqueeCapture(-161, -56, 0, 88)

        LittleScreenMarqueeCapture(95, -93, 130, -36)
        LittleScreenMarqueeCapture(127, -93, 99, -52)
        LittleScreenMarqueeCapture(149, -93, 60, -68)
        LittleScreenMarqueeCapture(160, -93, 16, -84)

        LittleScreenMarqueeCapture(-95, -93, 130, 36)
        LittleScreenMarqueeCapture(-127, -93, 99, 52)
        LittleScreenMarqueeCapture(-149, -93, 60, 68)
        LittleScreenMarqueeCapture(-160, -93, 16, 84)

        LittleScreenMarqueeCapture(95, -19, 130, -36)
        LittleScreenMarqueeCapture(127, -19, 99, -52)
        LittleScreenMarqueeCapture(149, -19, 60, -68)
        LittleScreenMarqueeCapture(160, -19, 16, -84)

        LittleScreenMarqueeCapture(-95, -19, 130, 36)
        LittleScreenMarqueeCapture(-127, -19, 99, 52)
        LittleScreenMarqueeCapture(-149, -19, 60, 68)
        LittleScreenMarqueeCapture(-160, -19, 16, 84)

        DSMap("Map_E1", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0.4, 3)
        DSMap("Map_E1_1", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0.4, 3)
        DSMap("Map_E2", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0.2, 3)
        DSMap("Map_E2_1", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0.2, 3)
        DSMap("Map_E3", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 3)
        DSMap("Map_E3_1", 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 3)

        DSMap("Map_G", 2)
        DSMap("Map_G_1", 2)
        DSMap("Map_H", 2)
        DSMap("Map_F", 2,0,-1)

        DSMap("Map_D", 2)

        Display(0, -59, 125, 0, 0, 0, -150, 80, 2, 1, VT1)

return t;
