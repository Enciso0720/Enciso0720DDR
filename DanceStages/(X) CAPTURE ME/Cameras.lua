local t = Def.ActorFrame{}

t.Camera1MessageCommand=function(self)
	ResetCamera()
	Camera:addz(25):addy(30):rotationx(-10):smooth(5.7):addz(-45):addy(-20):rotationx(5)
end
t.Camera2MessageCommand=function(self)
	ResetCamera()
	Camera:smooth(5.7):rotationx(-20):addy(20)
end
t.Camera3MessageCommand=function(self)
	ResetCamera()
	Camera:addz(20):addy(60):rotationy(-130):smooth(5.7):rotationx(10):rotationy(-150):addz(-50):addy(-45)
end
t.Camera4MessageCommand=function(self)
	ResetCamera()
	Camera:addy(10):addz(-50):smooth(5.7):addz(50)
end
t.Camera5MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addy(70):smooth(5.7):addy(-30)
end
t.Camera6MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-100):addy(10):smooth(5.7):addz(60):addy(10):rotationx(-5)
end
t.Camera7MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-70):addy(15):addx(-30):smooth(5.7):addx(7)
end
t.Camera8MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-10):addy(40):rotationx(-30):smooth(5.7):rotationx(-10):addy(-30)
end
t.Camera9MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-20):addy(15):rotationx(-10):rotationy(-120):smooth(5.7):rotationy(-165):addy(-7)
end
t.Camera10MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-20):addy(15):rotationx(-10):rotationy(-205):smooth(5.7):rotationy(-255):addy(-7)
end
t.Camera11MessageCommand=function(self)
	ResetCamera()
	Camera:addz(10):addy(5):addx(10):rotationx(-25):smooth(5.7):addx(-6)
end
t.Camera12MessageCommand=function(self)
	ResetCamera()
	Camera:addz(-70):addy(15):addx(-30):smooth(5.7):addx(7)
end

	------- WAIT TIMES  -------
	NumCameras=tonumber(12)
	WaitTime = {7,7,7,7,7,7,7,7,7,7,7,7}

return t;