local t = Def.ActorFrame{};

------- AVAILABLE MOTIONS -------	

MotionsLenght={
	"AAAgain",214,
	"Brain",221,
	"Embarr",190,
	"Higher",206,
	"Kimi",228,
	"Luka",179,
	"River",201,
	"Saturation",166,
	"Teo1",133,
	"Yume",214,
	"Breath",98,
	"World1",171,
	"World2",171,
	"Life",144,
	"Specialist",125,
}

------- CHARACTER MOTION SELECTION -------	

local M=0
local F=0
local R=0
Motions = {}
Motion = ""

if #Listed > 1 then
	for i=1,#Gender do
		if Gender[i] == "M" then
			M=M+1
		elseif Gender[i] == "F" then
			F=F+1
		else
			R=R+1
		end
	end

	if (M~=0 and F~=0 and R~=0) or
	(M~=0 and F~=0) or
	(M~=0 and R~=0)
	then
		Motions={"Embarr","Higher","River","Teo1","Kimi","Breath","World1","World2"}
		Motion=Motions[math.random(#Motions)]
	elseif ((F~=0 or R~=0) and M==0) then
		Motions={"Yume","Brain","Embarr","Higher","Luka","River","Teo1","Kimi","Breath","World1","World2"}
		Motion=Motions[math.random(#Motions)]
	elseif (F==0 and R==0 and M~=0) then
		Motions={"Embarr","Specialist","Higher","Life","River","Teo1","Kimi","Breath","World2"}
		Motion=Motions[math.random(#Motions)]
	end
else
	if NewChara(Listed[1]) then
		Motions = FILEMAN:GetDirListing("/Characters/"..Listed[1].."/Dance/", false, false)
		Motion = Motions[math.random(#Motions)]
		Motion = Motion:gsub(".redir","")
		Motion = Motion:gsub(Gender[1].." ","")
	end
end

return t;