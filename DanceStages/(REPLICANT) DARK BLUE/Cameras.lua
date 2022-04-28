local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	Camera:addy(40):addx(40):addrotationy(90):addrotationx(10):addz(50):linear(3):addrotationy(-30)
end
t.Camera2MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-20):addy(60):addx(20):smooth(5.7):addrotationy(30):addrotationx(20):addy(-60):addx(-5)
end
t.Camera3MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-35):addy(10):addx(-45):addrotationy(-7):smooth(5.7):addx(10)
end
t.Camera4MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-15):addy(60):addx(20):smooth(5.7):addrotationy(30):addrotationx(15):addy(-60):addx(-5)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addx(15):addy(-10):addrotationx(20):addrotationy(-20):smooth(5.7):addx(-10):addrotationx(-30):addz(10):addy(50):addrotationy(40)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	Camera:addz(5):smooth(6):addz(-80):addrotationx(-10):addy(30)
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
	Camera:addrotationy(335):addrotationx(17):addz(-6):smooth(6.5):addrotationy(-15):addz(-24)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-100):addy(30):addrotationx(-10):smooth(5.7):addz(100):addrotationx(10):addy(-30)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	Camera:addz(10):addy(50):addrotationx(35):addrotationy(85):smooth(8):addrotationy(-85):addz(20):addrotationx(-35):addz(-15):addy(-5)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-50):addrotationy(20):smooth(6):addrotationy(-10)
end

	------- WAIT TIMES  -------
	NumCameras=tonumber(12)
	WaitTime = {3,7,7,7,7,7,7,7,7,7,9,7}

return t;