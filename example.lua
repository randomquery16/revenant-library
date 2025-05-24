local Revenant = loadstring(game:HttpGet("https://raw.githubusercontent.com/randomquery16/glowing-umbrella/refs/heads/main/revenant-source.lua"))()

-- Create a window
local mainWindow = Revenant:Window({
    Text = "Example GUI"
})

-- 1. Button with Notification
mainWindow:Button({
    Text = "Show Notification",
    Callback = function()
        Revenant:Notification({
            Text = "Hello, Revenant!",
            Duration = 3,
            Color = Color3.fromRGB(0, 255, 0)
        })
    end
})

-- 2. Toggle with Flag
local toggle = mainWindow:Toggle({
    Text = "Enable Godmode",
    Flag = "Godmode",
    Default = false,
    Callback = function(state)
        print("Godmode:", state)
        -- Add your logic here (e.g., player.Godmode = state)
    end
})

-- 3. Dropdown
local dropdown = mainWindow:Dropdown({
    Text = "Select Weapon",
    List = {"Sword", "Rifle", "Bow"},
    Callback = function(selected)
        print("Selected weapon:", selected)
    end
})

-- 4. Slider
mainWindow:Slider({
    Text = "Volume",
    Postfix = "%",
    Minimum = 0,
    Maximum = 100,
    Default = 75,
    Callback = function(value)
        print("Volume set to:", value)
    end
})

-- 5. Keybind
mainWindow:Keybind({
    Text = "Fly Toggle",
    Default = Enum.KeyCode.F,
    Callback = function()
        print("Flying toggled!")
        -- Add fly logic here
    end
})

-- 6. Label (Dynamic Update)
local label = mainWindow:Label({
    Text = "Status: Idle",
    Color = Color3.fromRGB(255, 255, 0)
})

-- Update label after 5 seconds
task.wait(5)
label:Set({
    Text = "Status: Active",
    Color = Color3.fromRGB(0, 255, 0)
})

-- 7. Prompt
mainWindow:Prompt({
    Text = "Delete all data?",
    OnConfirm = function()
        print("Data deleted!")
    end,
    OnCancel = function()
        print("Deletion canceled.")
    end
})

-- 8. Access Flags
print("Current Godmode State:", Revenant.Flags.Godmode) -- Output: false

-- 9. Toggle UI Visibility
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        Revenant:Toggle() -- Hide/show all Revenant UIs
    end
end)
