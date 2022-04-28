local t = Def.ActorFrame{}

	function Stars(rX,rY,z,Pos)
		t[#t+1] = Def.ActorFrame{
			OnCommand=function(self)
				self:addrotationy(rY):y(-23-21.8):rainbow():effectperiod(math.random(3,7))
			end;
			Def.Model {
				Meshes="Star.txt";
				Materials=math.random(1,4)..".txt";
				Bones="Star.txt";
				InitCommand=function(self)
					self:blend("BlendMode_Add"):diffusealpha(0.8):rate(1.5)
				end,
				OnCommand=function(self)
					self:cullmode(2):addz(z)
					self:addrotationx(rX):position(Pos):zoom(0):linear(8):zoom(0.7)
					if rX == 40 then
						self:addy(5)
					end
				end,
			};
		};
	end

	if GetUserPref("DiscoStars") ~= "None" then

		Stars(20,45,-7,0)
		Stars(20,45,-7,2.2)
		Stars(20,45,-7,4.4)
		Stars(20,-45,-7,1.1)
		Stars(20,-45,-7,3.3)
		Stars(20,-45,-7,5.5)
	
		Stars(20,135,-7,0)
		Stars(20,135,-7,2.2)
		Stars(20,135,-7,4.4)
		Stars(20,-135,-7,1.1)
		Stars(20,-135,-7,3.3)
		Stars(20,-135,-7,5.5)
		
		if GetUserPref("DiscoStars") == "Normal" then

			Stars(40,90,-7,1.65)
			Stars(40,90,-7,1.65*3)
			Stars(40,-90,-7,1.65)
			Stars(40,-90,-7,1.65*3)

			Stars(40,0,-7,1.65*0)
			Stars(40,0,-7,1.65*2)
			Stars(40,-180,-7,1.65*0)
			Stars(40,-180,-7,1.65*2)
			
		end
	end


return t;