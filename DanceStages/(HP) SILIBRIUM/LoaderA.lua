local t = Def.ActorFrame{}

	function DSMap(MapCode, _CM, X, Y, Z, rX, rY, rZ, Zo, ModelTime, sX, sY, sZ, bobX, bobY, bobZ, bobEOF, bobPeriod)
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
					self:cullmode(_CM)
					self:xy(0,16)
					self:addx(X or 0):addy(Y or 0):addz(Z or 0):addrotationx(rX or 0):addrotationy(rY or 0):addrotationz(rZ or 0)
						:zoom(5 + (Zo or 0)):position(ModelTime or 0)
					self:spin():effectmagnitude(sX or 0, sY or 0, sZ or 0)
				end
			}
		}
	end


	DSMap("Map_A1",2)
    
	DSMap("Map_B1",2,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,3)
	DSMap("Map_B2",2,0,0,0,0,0,0,0,0,0,0,0,0,2,0,2,3)

	DSMap("Map_C1",2,60,-math.random(10,50),100,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C2",2,0,-math.random(10,50),100,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C1",2,-60,-math.random(10,50),100,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))

	DSMap("Map_C2",2,100,-math.random(10,50),60,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C1",2,100,-math.random(10,50),0,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C2",2,100,-math.random(10,50),-60,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))

	DSMap("Map_C2",2,-100,-math.random(10,50),60,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C1",2,-100,-math.random(10,50),0,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C2",2,-100,-math.random(10,50),-60,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))

	DSMap("Map_C1",2,60,-math.random(10,50),-100,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C2",2,0,-math.random(10,50),-100,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))
	DSMap("Map_C1",2,-60,-math.random(10,50),-100,0,0,0,-2,0,math.random(10,30),math.random(20,40),math.random(30,50),0,40,0,math.random(10)/10,math.random(8,20))

	DSMap("Map_A2",2)

return t;