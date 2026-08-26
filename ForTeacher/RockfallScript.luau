-- Камнепад: возвращает валун наверх, чтобы обвал повторялся.
-- Пауза между падениями — в атрибуте Pause самого скрипта (секунды).
--
-- Модуль курса для урока 21. Лежит внутри валуна (Part формы Ball,
-- Density 2, Anchored снят). Всё остальное делает физика: скатывание,
-- разгон по жёлобу и удар по игроку.
--
-- Собирается сценарием shots/21-rockfall.lua, публикуется через
-- ПКМ по модели Rockfall → Save to Roblox.
local rock = script.Parent
local home = rock.CFrame

while true do
	task.wait(script:GetAttribute("Pause") or 3)
	rock.Anchored = true
	rock.CFrame = home
	rock.Anchored = false
end
