local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	Camera:addz(10):addrotationy(70):smooth(5.7):addrotationy(-70):addx(5)
end
t.Camera2MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-15):addy(20):addz(20):smooth(5.7):addrotationx(15):addy(-15):addz(-20)
end
t.Camera3MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-20):addy(-20):addrotationx(30):smooth(5.7):addrotationx(-40):addz(30):addrotationy(30):addy(20):addx(-10)
end
t.Camera4MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(90):addx(10):smooth(5.7):addx(-20)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(150):addz(-15):addx(10):smooth(5.7):addx(-25)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	Camera:smooth(6.7):addrotationy(60):addy(5):addrotationx(20):addz(-50)
end
t.Camera7MessageCommand=function(self)
	ResetCamera()
	Camera:addy(10):addz(-5):addx(12):addrotationx(-15):smooth(5.7):addx(-24):addrotationx(30):addz(-20)
end
t.Camera8MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-20):addy(20):addrotationy(20):addrotationx(20):addx(40):smooth(6.7):addx(-40)
end
t.Camera9MessageCommand=function(self)
	ResetCamera()
	Camera:smooth(5.7):addy(4):addrotationy(-20)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-70):addrotationx(20):smooth(5.7):addz(80):addrotationx(-20)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-5):addx(10):addy(15):addrotationy(-20):addrotationx(-25):smooth(5.7):addx(-10)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-10):addy(5):addz(20):smooth(5.7):addrotationy(-30):addrotationx(20)
end

	------- WAIT TIMES  -------
	NumCameras=tonumber(12)
	WaitTime = {7,7,7,7,7,7,7,7,7,7,7,7}


return t;