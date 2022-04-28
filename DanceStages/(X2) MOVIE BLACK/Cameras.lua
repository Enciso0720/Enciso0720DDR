local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	Camera:addy(55):addrotationx(-30):addz(20):smooth(5.7):addy(-15):addrotationx(5)
end
t.Camera2MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-35):addy(10):addx(-45):addrotationy(-7):smooth(5.7):addx(10)
end
t.Camera3MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-40):addx(40):addy(10):addrotationx(10):smooth(5.7):addx(-30)
end
t.Camera4MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addx(15):addy(-10):addrotationx(20):addrotationy(-20):smooth(5.7):addx(-10):addrotationx(-50):addz(10):addy(40):addrotationy(40)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addy(40):rotationx(-10):smooth(5.7):addz(0):addy(-35):rotationx(10)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-60):addx(-30):addy(15):addrotationy(0):smooth(5.7):addx(-15)
end
t.Camera7MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(270):addz(-15):addy(5):addx(3):smooth(6):addy(-3):addx(-3)
end
t.Camera8MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-50):addrotationy(20):addrotationx(10):smooth(6):addx(10):addz(5)
end
t.Camera9MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationx(-30):addrotationy(-30):addy(30):addz(35):smooth(6):addrotationy(25)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(320):addrotationx(17):addz(-30):smooth(6.5):addz(24):addrotationy(15)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	Camera:addy(100):addz(0):addrotationx(-15):linear(2):addy(-7)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-40):addy(7)
end
t.Camera13MessageCommand=function(self)
	ResetCamera()
	Camera:addrotationy(335):addrotationx(17):addz(-6):smooth(6.5):addrotationy(-15):addz(-24)
end

	------- WAIT TIMES  -------8
	NumCameras=tonumber(13)
	WaitTime = {7,7,7,7,7,7,8,8,10,8,2,2,8}
	
return t;