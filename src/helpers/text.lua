--- COPYRIGHT ---
-- bla bla bla --



-------------
-- Zmienne --




-------------
-- Funkcje --

function boolToString (value)				-- Konwertuje bool to string
	if value then return "True"
	else return "False" end
end

function textBackspace (text, place)			-- Stosuje backspace w miejscu "place"
	if place == nil or place >= string.len(text) then
		return string.sub( text, 1, -2 )
	elseif place > 1 and place < string.len(text) then
		return string.sub( text, 1, place-1 ) .. string.sub( text, place+1 )
	else
		return string.sub( text, 2 )
	end
end

function textDelete (text, place)			-- Stosuje delete w miejscu "place"
	if place < string.len(text) then
		return string.sub( text, 1, place ) .. string.sub( text, place+2 )
	else
		return text
	end
end

function textInsert (text, addition, place)		-- Wstawia w miejscu "place" ³añcuch "addition" w "text"
	if place == nil or place >= string.len(text) then
		return text .. addition
	elseif place > 0 and place < string.len(text) then
		return string.sub( text, 1, place ) .. addition .. string.sub( text, place+1)
	else
		return addition .. text
	end
end