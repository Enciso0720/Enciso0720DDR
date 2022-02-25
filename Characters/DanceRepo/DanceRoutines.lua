local t = Def.ActorFrame{};

Choreo = ""
	if (Char1_Gen == "M" and Char2_Gen == "F") or
	   (Char1_Gen == "M" and Char2_Gen == "R") or
	   (Char1_Gen == "F" and Char2_Gen == "M") or
	   (Char1_Gen == "R" and Char2_Gen == "M")
	then
		DoubleGenre_Choreo = math.random(1,10)
			if DoubleGenre_Choreo ==  1 then Choreo = "Embarr"
		elseif DoubleGenre_Choreo ==  2 then Choreo = "Higher"
		elseif DoubleGenre_Choreo ==  3 then Choreo = "River"
		elseif DoubleGenre_Choreo ==  4 then Choreo = "Love"
		elseif DoubleGenre_Choreo ==  5 then Choreo = "Teo1"
		elseif DoubleGenre_Choreo ==  6 then Choreo = "Wave"
		elseif DoubleGenre_Choreo ==  7 then Choreo = "Phantasma"
		elseif DoubleGenre_Choreo ==  8 then Choreo = "Cute"
		elseif DoubleGenre_Choreo ==  9 then Choreo = "Kimi"
		elseif DoubleGenre_Choreo == 10 then Choreo = "Marginal"
		end

	elseif (Char1_Gen == "F" and Char2_Gen == "F") or
		   (Char1_Gen == "R" and Char2_Gen == "R") or
		   (Char1_Gen == "R" and Char2_Gen == "F") or
		   (Char1_Gen == "F" and Char2_Gen == "R")
	then
		DoubleGenre_Choreo = math.random(1,12)
			if DoubleGenre_Choreo ==  1 then Choreo = "Yume"
		elseif DoubleGenre_Choreo ==  2 then Choreo = "Brain"
		elseif DoubleGenre_Choreo ==  3 then Choreo = "Embarr"
		elseif DoubleGenre_Choreo ==  4 then Choreo = "Higher"
		elseif DoubleGenre_Choreo ==  5 then Choreo = "Love"
		elseif DoubleGenre_Choreo ==  6 then Choreo = "Luka"
		elseif DoubleGenre_Choreo ==  7 then Choreo = "River"
		elseif DoubleGenre_Choreo ==  8 then Choreo = "Teo1"
		elseif DoubleGenre_Choreo ==  9 then Choreo = "Wave"
		elseif DoubleGenre_Choreo == 10 then Choreo = "Cute"
		elseif DoubleGenre_Choreo == 11 then Choreo = "Kimi"
		elseif DoubleGenre_Choreo == 12 then Choreo = "Marginal"
		end

	elseif (Char1_Gen == "M" and Char2_Gen == "M") then
		DoubleGenre_Choreo = math.random(1,13)
			if DoubleGenre_Choreo ==  1 then Choreo = "Embarr"
		elseif DoubleGenre_Choreo ==  2 then Choreo = "Specialist"
		elseif DoubleGenre_Choreo ==  3 then Choreo = "Higher"
		elseif DoubleGenre_Choreo ==  4 then Choreo = "Life"
		elseif DoubleGenre_Choreo ==  5 then Choreo = "Love"
		elseif DoubleGenre_Choreo ==  6 then Choreo = "River"
		elseif DoubleGenre_Choreo ==  7 then Choreo = "Seisou"
		elseif DoubleGenre_Choreo ==  8 then Choreo = "Snowman"
		elseif DoubleGenre_Choreo ==  9 then Choreo = "Chaos"
		elseif DoubleGenre_Choreo == 10 then Choreo = "Teo1"
		elseif DoubleGenre_Choreo == 11 then Choreo = "Wave"
		elseif DoubleGenre_Choreo == 12 then Choreo = "Kimi"
		elseif DoubleGenre_Choreo == 13 then Choreo = "Marginal"
		end
	end

return t;