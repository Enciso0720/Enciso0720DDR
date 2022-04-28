local t = Def.ActorFrame{}

function DSMap(MapCode,R,P,rY,x,y,z,bobPeriod,bobY,bobEOF)
	t[#t+1] = Def.ActorFrame{
		Def.Model {
			Meshes=MapCode;
			Materials=MapCode;
			Bones=MapCode;
			InitCommand = function(self)
				self:y(0.5):addx(x or 0):addy(y or 0):addz(z or 0):addrotationy(rY or 0)
					:bob():effectoffset(bobEOF or 0):effectmagnitude(0, bobY or 0,0):effectperiod(bobPeriod or 1):position(P or 0):rate(R or 1)
					:cullmode(2):zoom(11)
			end,
		};
	};
end

DSMap("Map_A1")
DSMap("MiniStar",0.75,0.3,0,0,4,-7)
DSMap("MiniStar",0.75,0.2,0,-7,3)
DSMap("MiniStar",0.75,0.1,0,0,2,7)
DSMap("MiniStar",0.75,0,0,7,1)
DSMap("Map_A2")

DSMap("Biscuit_A",0.5,0,-30,80,-50,100,6*1.7,4)
DSMap("Biscuit_B",0.9,1,0,40,-50,150,5,6*1.7,1.5)
DSMap("Biscuit_A",0.8,2,0,-60,-70,150,10*1.7,12,3)
DSMap("Biscuit_B",1,3,30,-100,-50,100,6*1.7,5,3.5)

DSMap("Candy_R",0.8,1,0,-40,-40,70,7*1.7,4,3)
DSMap("Candy_B",0.6,0,-30,60,-20,70,9*1.7,2.5,3)

DSMap("Candy_R",0.6,1,90,-45,-35,0,7*1.7,10)
DSMap("Candy_R",0.7,0,90,45,-35,0,7*1.7,10,(7*1.7)/2)


DSMap("Map_B3",1,0,0,0,0,0,2,5)
DSMap("Map_B2")



return t;