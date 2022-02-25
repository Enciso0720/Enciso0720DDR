local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	Camera:addy(55):addrotationx(-30):addz(20):smooth(5.7):addy(-15):addrotationx(5)
end
t.Camera2MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-40):addy(60):addx(20):smooth(5.7):addrotationy(30):addrotationx(40):addy(-60):addx(-5)
end
t.Camera3MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-35):addy(10):addx(-45):addrotationy(-7):smooth(5.7):addx(10)
end
t.Camera4MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-40):addx(40):addy(10):addrotationx(10):smooth(5.7):addx(-30)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addx(15):addy(-10):addrotationx(20):addrotationy(-20):smooth(5.7):addx(-10):addrotationx(-50):addz(10):addy(40):addrotationy(40)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	Camera:addz(0):addy(25):addrotationx(-10):smooth(5.7):addy(-22):addrotationx(10)
end
t.Camera7MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addy(40):rotationx(-10):smooth(5.7):addz(0):addy(-35):rotationx(10)
end
t.Camera8MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-60):addx(-30):addy(15):addrotationy(0):smooth(5.7):addx(-15)
end
t.Camera9MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-70):addx(20):addy(20):addrotationy(40):smooth(5.7):addrotationy(20)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	Camera:addy(40):addx(20):smooth(5.7):addy(-30):addx(-10):addrotationy(10)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-100):addy(15):smooth(5.7):addz(80)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-20):addy(15):smooth(5.7):addz(-80)
end

	------- WAIT TIMES  -------
	NumCameras=tonumber(12)
	WaitTime = {7,7,7,7,7,7,7,7,7,7,7,7}
	
return t;