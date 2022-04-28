local function SpeakerAnimRate(self)
	local mRate = GAMESTATE:GetSongOptionsObject("ModsLevel_Current"):MusicRate()
	local bpm = round(GAMESTATE:GetSongBPS() * 60 * mRate, 3)
	local pos = GAMESTATE:GetSongPosition()
	
	if bpm >= 480 then
		bpm = bpm/3
	elseif bpm >= 240 then
		bpm = bpm/2
	elseif bpm < 120 then
		bpm = bpm*2
	end
	
	local spdRate = round((bpm/30)/4, 3)
	
	self:SetUpdateRate(spdRate)
end

local t = Def.ActorFrame{}

	function DSMap(MapCode, _CM, X, Y, Z, rX, rY, rZ, Zo, ModelTime, sX, sY, sZ, bobX, bobY, bobZ, bobEOF, bobPeriod, Diffuse)
		t[#t + 1] =
			Def.ActorFrame {
			InitCommand = function(self)
				self:bob():effectoffset(bobEOF or 0):effectmagnitude(bobX or 0, bobY or 0, bobZ or 0):effectperiod(bobPeriod or 1)
			end,
			OnCommand = function(self)
				if (MapCode == "Map_D" or MapCode == "Map_F3" or MapCode == "Map_C1") and GetUserPref("BoomSync") == "BPM Sync" then
					self:sleep(0.3):queuecommand('Animate')
				end
			end,
			AnimateCommand = function(self)
				self:SetUpdateFunction(SpeakerAnimRate)
			end,
			Def.Model {
				Meshes = MapCode .. ".txt",
				Materials = MapCode .. ".txt",
				Bones = MapCode .. ".txt",
				OnCommand = function(self)
					self:cullmode(_CM)
					self:xy(0.7,-8.9):z(4)
					self:addx(X or 0):addy(Y or 0):addz(Z or 0):addrotationx(rX or 0):addrotationy(rY or 0):addrotationz(rZ or 0)
						:zoom(2.1 + (Zo or 0)):position(ModelTime or 0)
						:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0):diffusealpha(Diffuse or 1)
					if MapCode == "Map_F3" or
					   MapCode == "Map_A2"
					   then
						self:blend("BlendMode_Add")
					end
					if MapCode == "Map_C1" then
						self:rate(-1)
					end
					if MapCode == "Map_D" or MapCode == "Map_C1" then self:position(0.6) end
				end
			}
		}
	end

	DSMap("Map_A1",2)
	DSMap("Map_B",2,0,0,0,0,0,0,0,0,0,-7)
	DSMap("Map_A2",2)

	DSMap("Map_E",2,0,-7)

	DSMap("Map_C1",2,0,0,14)
	DSMap("Map_C3",2,0,0,14)
	DSMap("Map_C4",2,0,0,14)

	DSMap("Map_D", 2, 0, 0, 0)

	--CENTRADA
	DSMap("Map_F3", 1, -0.8, -23, 54 + 0.5, 0, 0, 0, 0, 0.02)
	DSMap("Map_F3", 1, -0.8, -23, 54 , 0, 0, 0, -0.4, 0.08)

	--ARRIBA

	DSMap("Map_F3", 1, -33, -38, 57 - 1.2, 0, 0, 0, -0.45, 0.08)
	DSMap("Map_F3", 1, -33, -38, 57 - 1.8, 0, 0, 0, -0.1, 0.02)

	DSMap("Map_F3", 1, 32, -38, 57 - 1.2, 0, 0, 0, -0.45, 0.08)
	DSMap("Map_F3", 1, 32, -38, 57 - 1.8, 0, 0, 0, -0.1, 0.02)

	--ABAJO

	DSMap("Map_F3", 1, -30.5, -7.5, 57 - 1.2, 0, 0, 0, -0.55, 0.08)
	DSMap("Map_F3", 1, -30.5, -7.5, 57 - 1.8, 0, 0, 0, -0.2, 0.02)

	DSMap("Map_F3", 1, 29.5, -7.5, 57 - 1.2, 0, 0, 0, -0.55, 0.08)
	DSMap("Map_F3", 1, 29.5, -7.5, 57 - 1.8, 0, 0, 0, -0.2, 0.02)

	--CENTRADAS

	DSMap("Map_F3", 1, -45.5, -21, 56 - 1.2, 0, 0, 0, -0.85, 0.08)
	DSMap("Map_F3", 1, -45.5, -21, 56 - 1.8, 0, 0, 0, -0.6, 0.02)

	DSMap("Map_F3", 1, 44, -21, 56 - 1.2, 0, 0, 0, -0.85, 0.08)
	DSMap("Map_F3", 1, 44, -21, 56 - 1.8, 0, 0, 0, -0.6, 0.02)


	--LATERAL DERECHO
	DSMap("Map_F3", 1, -103, -11, -14, 0, 32, 0, 1.5, 0.08)
	DSMap("Map_F3", 1, -102, -11, -15, 0, 32, 0, 2.5, 0.02)

	--LATERAL IZQUIERDO
	DSMap("Map_F3", 1, 102, -11, -14, 0, -32, 0, 1.5, 0.08)
	DSMap("Map_F3", 1, 101, -11, -15, 0, -32, 0, 2.5, 0.02)


return t;
