local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	Camera:addz(10):addrotationy(70):smooth(5.7):addrotationy(-70):addx(5)
end
t.Camera2MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-30):addy(35):addz(20):smooth(5.7):addrotationx(30):addy(-30):addz(-20)
end
t.Camera3MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-30):addy(35):addz(20):smooth(5.7):addrotationy(30)
end
t.Camera4MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-30):addy(20):addz(20):smooth(5.7):addrotationx(30):addy(-20):addz(-20)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	Camera:smooth(5.7):addy(35):addz(5):addrotationx(-10)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	Camera:smooth(5.7):addrotationy(50)
end
t.Camera7MessageCommand=function(self)
	ResetCamera()
	Camera:addy(20):addz(-5):addx(12):addrotationx(-15):smooth(5.7):addx(-24)
end
t.Camera8MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-20):addy(10):addrotationy(20):addrotationx(-15):addx(20):smooth(5.7):addx(-20)
end
t.Camera9MessageCommand=function(self)
	ResetCamera()
	Camera:smooth(5.7):addy(4):addrotationy(-20)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	Camera:addz(10):smooth(5.7):addrotationy(-60):addrotationx(-20):addy(2)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-200):addy(-20):addx(-11):addrotationy(19):addrotationx(15):smooth(6):addz(160)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-30):addy(5):addz(20):smooth(5.7):addrotationy(30)
end
t.Camera13MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-30):addy(-8):addx(10):addrotationy(-10):addrotationx(45):smooth(6):addx(-10)
end

	------- WAIT TIMES  -------
	NumCameras=tonumber(13)
	WaitTime = {7,7,7,7,7,7,7,7,7,7,7,7,7}
	
return t;