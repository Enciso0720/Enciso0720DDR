local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-100):addy(30):addrotationx(-10):smooth(5.7):addz(100):addrotationx(10):addy(-30)
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
	Camera:addz(20):addx(90):addy(10):addrotationy(30):smooth(5.7):addz(-50):addx(-60):addrotationy(-60)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	Camera:addz(10):addy(25):addrotationx(-10):smooth(5.7):addy(-22):addrotationx(10)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-30):addy(10):addrotationx(-5):addrotationy(20):smooth(5):addrotationy(40)
end
t.Camera7MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-60):addx(-30):addy(15):addrotationy(0):smooth(5.7):addx(-15)
end
t.Camera8MessageCommand=function(self)
	ResetCamera()
	Camera:addz(0):addx(15):smooth(5.7):addx(-20)
end
t.Camera9MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addx(15):addy(0):addrotationx(20):addrotationy(-20):smooth(5.7):addx(-30):addrotationx(-20):addrotationy(40)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	Camera:addz(5):sleep(3):smooth(4):addz(-80):addrotationx(-10):addy(30)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	Camera:fov(90):addy(40):addrotationy(90):addrotationx(20):addz(50):decelerate(10):addrotationy(-80):addz(-10):addrotationx(-15):addy(-10)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	Camera:addy(40):addx(40):addrotationy(90):addrotationx(20):addz(50):linear(3):addrotationy(-30)
end
t.Camera13MessageCommand=function(self)
	ResetCamera()
	Camera:addz(70):addy(7):fov(92):addx(-12):addrotationx(-14):addrotationy(-15):linear(8):addx(10):addrotationy(40):addz(-5)
end
t.Camera14MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(220):addrotationx(20):addz(-40):fov(93):smooth(6):addrotationy(100):addrotationx(10):addy(-10)
end
t.Camera15MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(320):addrotationx(17):addz(-30):smooth(6.5):addz(24):addrotationy(15)
end
t.Camera16MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(80):addrotationx(15):addz(-10):smooth(5):addrotationy(-50):addrotationx(-19)
end
t.Camera17MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(320):addrotationx(30):addz(-40):addy(-10):fov(93):sleep(2):smooth(6):addrotationy(-100):addrotationx(-10):addy(10)
end

	------- WAIT TIMES  -------
	NumCameras=tonumber(17)
	WaitTime = {7,7,7,7,7,5,7,7,7,9,11,3,8,7,7,7,9}

return t;