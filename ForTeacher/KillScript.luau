-- Смертельная зона: любая деталь внутри модели, где лежит этот скрипт.
-- Защитное поле уважаем: пока у персонажа висит ForceField (первые секунды
-- после появления у точки возрождения), ловушка его не трогает — иначе игрок
-- гибнет в момент появления и выбраться не может.
local model = script.Parent

local function isProtected(character: Instance): boolean
	return character:FindFirstChildOfClass("ForceField") ~= nil
end

for _, part in pairs(model:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Touched:Connect(function(otherPart: BasePart)
			local char = otherPart.Parent
			if not char then
				return
			end
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum and hum.Health > 0 and not isProtected(char) then
				hum.Health = 0
			end
		end)
	end
end
