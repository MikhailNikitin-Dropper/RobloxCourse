local model = script.Parent
for _, part in pairs(model:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Touched:Connect(function(otherPart: BasePart) 
			local char = otherPart.Parent
			local hum = char:FindFirstChild("Humanoid")
			if hum then
				hum.Health = 0
			end
		end)
	end
end
