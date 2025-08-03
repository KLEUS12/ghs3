-- Создаем основные переменные для сокращения кода
local s,f,p,t=Instance.new,"Frame","UIProgressbar","TextLabel"

-- Создаем ScreenGui и добавляем его в PlayerGui
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").LoadingScreen=s"ScreenGui"

-- Создаем Frame внутри ScreenGui
s(f,{
    Name="Frame",
    Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").LoadingScreen,
    Size=UDim2.new(.8,0,.2,0), -- 80% ширины и 20% высоты экрана
    Position=UDim2.new(.1,0,.4,0), -- Позиция 10% слева и 40% сверху
    BackgroundColor3=Color3.fromRGB(0,0,0),
    BorderSizePixel=0,
    BackgroundTransparency=.5
},

-- Создаем ProgressBar внутри Frame
s(p,{
    Name="ProgressBar",
    Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").LoadingScreen.Frame,
    Size=UDim2.new(.7,0,.1,0), -- 70% ширины и 10% высоты родителя
    Position=UDim2.new(.15,0,.4,0),
    BackgroundColor3=Color3.fromRGB(0,255,0),
    Progress=0
}),

-- Создаем TextLabel внутри Frame
s(t,{
    Name="TextLabel",
    Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").LoadingScreen.Frame,
    Size=UDim2.new(.7,0,.2,0),
    Position=UDim2.new(.15,0,.6,0),
    Text="0%",
    TextColor3=Color3.fromRGB(255,255,255),
    TextSize=20,
    TextXAlignment=Enum.TextXAlignment.Center
})

-- Добавляем систему анимации
game:GetService("RunService").Stepped:Connect(function()
    local d=10 -- длительность в секундах
    local s=tick() -- время начала
    local r=true -- флаг работы
    
    local function u()
        if r then
            local e=tick()-s -- прошедшее время
            local p=math.min(1,e/d) -- текущий прогресс
            
            -- Обновляем прогресс бар
            game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").LoadingScreen.Frame.ProgressBar.Progress=p
            
            -- Обновляем текст
            game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").LoadingScreen.Frame.TextLabel.Text=string.format("%.0f%%",p*100)
            
            -- Проверяем завершение
            if p>=1 then
                r=false
                game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").LoadingScreen:Destroy()
            end
        end
    end
    u()
end)
