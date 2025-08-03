local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ProgressBar = Instance.new("UIProgressbar")
local TextLabel = Instance.new("TextLabel")

-- Настройки интерфейса
ScreenGui.Name = "LoadingScreen"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.8, 0, 0.2, 0) -- 80% ширины и 20% высоты экрана
Frame.Position = UDim2.new(0.1, 0, 0.4, 0) -- Позиция 10% слева и 40% сверху
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.5

ProgressBar.Parent = Frame
ProgressBar.Size = UDim2.new(0.7, 0, 0.1, 0) -- 70% ширины и 10% высоты родителя
ProgressBar.Position = UDim2.new(0.15, 0, 0.4, 0) -- Позиция внутри Frame
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый цвет
ProgressBar.Progress = 0

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(0.7, 0, 0.2, 0)
TextLabel.Position = UDim2.new(0.15, 0, 0.6, 0)
TextLabel.Text = "0%"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20
TextLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Анимация загрузки
local duration = 10 -- длительность в секундах
local startTime = tick()
local running = true

local function updateProgress()
    if running then
        local elapsed = tick() - startTime
        local progress = math.min(1, elapsed / duration)
        ProgressBar.Progress = progress
        TextLabel.Text = string.format("%.0f%%", progress * 100)
        
        if progress >= 1 then
            running = false
            -- Здесь можно добавить код для скрытия экрана загрузки
            ScreenGui:Destroy()
        end
    end
end

-- Добавляем обработчик событий
game:GetService("RunService").Stepped:Connect(updateProgress)