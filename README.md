# Revenant UI Library Documentation (v1.9)

---

## **Table of Contents**
1. [Overview](#overview)
2. [Installation](#installation)
3. [Core Functions](#core-functions)
   - [Window](#window)
   - [Notification](#notification)
4. [UI Components](#ui-components)
   - [Button](#button)
   - [Toggle](#toggle)
   - [Dropdown](#dropdown)
   - [Slider](#slider)
   - [Keybind](#keybind)
   - [Label](#label)
   - [Prompt](#prompt)
5. [Advanced Features](#advanced-features)
   - [Flags System](#flags-system)
   - [UI Toggling](#ui-toggling)
6. [Dependencies & Notes](#dependencies--notes)

---

## **Overview**
Revenant is a lightweight Roblox Lua GUI library designed for game exploits/scripts. It features:
- Draggable windows
- Modern animations
- Customizable components
- Notification system
- Input handling

---

## **Installation**
   ```lua
   local Revenant = loadstring(game:HttpGet("https://raw.githubusercontent.com/randomquery16/glowing-umbrella/refs/heads/main/revenant-source.lua"))()
   ```

---

## **Core Functions**

### **`Window`**
Creates a draggable window container for UI elements.

#### Syntax:
```lua
local window = Revenant:Window({
    Text = "Window Title"  -- (Optional) Default: "Revenant"
})
```

#### Example:
```lua
local mainWindow = Revenant:Window({ Text = "Main Menu" })
```

---

### **`Notification`**
Displays a temporary notification.

#### Syntax:
```lua
Revenant:Notification({
    Text = "Message",      -- (Optional) Default: "This is a notification."
    Duration = 5,          -- (Optional) Seconds. Default: 5
    Color = Color3.new()   -- (Optional) Progress bar color. Default: RGB(56, 207, 154)
})
```

#### Example:
```lua
Revenant:Notification({
    Text = "Welcome!",
    Duration = 3,
    Color = Color3.fromRGB(255, 0, 0)
})
```

---

## **UI Components**

### **`Button`**
Adds a clickable button to the window.

#### Syntax:
```lua
window:Button({
    Text = "Button Name",  -- (Optional) Default: "Button"
    Callback = function()  -- (Optional) Fires on click
        -- Your code
    end
})
```

#### Example:
```lua
mainWindow:Button({
    Text = "Teleport",
    Callback = function()
        print("Teleporting...")
    end
})
```

---

### **`Toggle`**
Adds a toggle switch with state tracking.

#### Syntax:
```lua
local toggle = window:Toggle({
    Text = "Toggle Name",  -- (Optional) Default: "Toggle"
    Flag = "UniqueID",     -- (Optional) Identifier for Flags. Default: Text
    Default = false,       -- (Optional) Initial state. Default: false
    Callback = function(state) 
        -- Your code
    end
})
```

#### Example:
```lua
local espToggle = mainWindow:Toggle({
    Text = "ESP",
    Default = true,
    Callback = function(state)
        ESP:Toggle(state)
    end
})
```

---

### **`Dropdown`**
Adds a dropdown menu with selectable options.

#### Syntax:
```lua
local dropdown = window:Dropdown({
    Text = "Dropdown Name",  -- (Optional) Default: "Dropdown"
    List = {"Option1", "Option2"},  -- (Required) Options to display
    Callback = function(selected) 
        -- Your code
    end
})
```

#### Example:
```lua
local weaponDropdown = mainWindow:Dropdown({
    Text = "Weapons",
    List = {"Sword", "Gun", "Bow"},
    Callback = function(choice)
        equipWeapon(choice)
    end
})
```

---

### **`Slider`**
Adds a draggable slider for numeric input.

#### Syntax:
```lua
window:Slider({
    Text = "Slider Name",  -- (Optional) Default: "Slider"
    Flag = "UniqueID",     -- (Optional) Identifier for Flags. Default: Text
    Postfix = "%",         -- (Optional) Suffix for value display (e.g., "50%")
    Minimum = 0,           -- (Optional) Default: 1
    Maximum = 100,         -- (Optional) Default: 100
    Default = 50,          -- (Optional) Initial value. Default: 5
    Callback = function(value) 
        -- Your code
    end
})
```

#### Example:
```lua
mainWindow:Slider({
    Text = "Brightness",
    Postfix = "%",
    Minimum = 0,
    Maximum = 100,
    Default = 75,
    Callback = function(value)
        setBrightness(value)
    end
})
```

---

### **`Keybind`**
Adds a customizable keybind input.

#### Syntax:
```lua
window:Keybind({
    Text = "Keybind Name",      -- (Optional) Default: "Keybind"
    Default = Enum.KeyCode.F,   -- (Optional) Default: Enum.KeyCode.LeftAlt
    Callback = function() 
        -- Your code
    end
})
```

#### Example:
```lua
mainWindow:Keybind({
    Text = "Fly Toggle",
    Default = Enum.KeyCode.F,
    Callback = function()
        toggleFlight()
    end
})
```

---

### **`Label`**
Adds a non-interactive text label.

#### Syntax:
```lua
local label = window:Label({
    Text = "Label Text",    -- (Optional) Default: "Label"
    Color = Color3.new()    -- (Optional) Text color. Default: RGB(214, 214, 214)
})

-- Update label dynamically:
label:Set({ Text = "New Text", Color = Color3.fromRGB(255, 0, 0) })
```

---

### **`Prompt`**
Adds a confirmation dialog with "Confirm" and "Cancel" buttons.

#### Syntax:
```lua
window:Prompt({
    Text = "Prompt Text",   -- (Optional) Default: "Prompt"
    OnConfirm = function()  -- (Optional)
        -- Confirm action
    end,
    OnCancel = function()  -- (Optional)
        -- Cancel action
    end
})
```

---

## **Advanced Features**

### **`Flags System`**
- Track toggle states globally via `library.Flags`.
- Access using the `Flag` parameter in toggles/sliders.

#### Example:
```lua
print(Revenant.Flags["ESPEnabled"]) -- Returns boolean
```

---

### **`UI Toggling`**
- Hide/show all Revenant UIs:
```lua
Revenant:Toggle() -- Toggles visibility
```

---

## **Dependencies & Notes**
1. **HTTP Library**: Requires `syn.request` or equivalent for asset downloads.
2. **Auto-Downloads**:
   - Creates a `Revenant` folder in workspace.
   - Downloads `Circle.png` for toggle assets.
3. **Input Blacklist**: Avoid these keys for keybinds:
   ```lua
   Enum.KeyCode.W, A, S, D, Space, Tab, Escape, etc.
   ```
4. **ZIndex**: All elements use high `ZIndex` to ensure visibility.

5. **Obfuscate**: We recommend obfuscating the scripts you have created.

---

## **Troubleshooting**
- **UI Not Appearing**: Ensure `CoreGui` access is allowed.
- **Missing Assets**: Check if `Revenant/Circle.png` exists.
- **Callback Errors**: Wrap callbacks in `pcall()` for safety.

--- 

This documentation covers 100% of the library's functionality. For updates, refer to the original script comments.
