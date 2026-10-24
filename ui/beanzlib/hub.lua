local TweenService = game:GetService("TweenService")
local Frame = require("./primitives/frame")
local ImageLabel = require("./primitives/imagelabel")
local ScrollingFrame = require("./primitives/scrollingframe")
local TextBox = require("./primitives/textbox")
local TextButton = require("./primitives/textbutton")
local TextLabel = require("./primitives/textlabel")
local UIPadding = require("./primitives/uipadding")
local UIStroke = require("./primitives/uistroke")
const makeDraggable = require("../utils/draggable")
const RichText = require("../utils/richtext")
const Vide = require("../vide")
const function sandbox()
        local tbl = setmetatable({},{
	__index = function(t,key)
		return t
	end,
	__call = function(t,...)
		return t
	end
})
	return tbl
end
const ConfigSystem = getgenv and loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/main/configsystem.lua"))() or sandbox()
const bgSize = UDim2.fromScale(1, 6.761)
const mainFrameSize = UDim2.fromScale(0.45, 0.082)
const mainFramePos = UDim2.fromScale(0.5, 0.324)
const WORKING = 0
const NOT_WORKING = 1
const OUTDATED = 2

const scripttable = getgenv and loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/main/allscripts.lua"))() or sandbox()

local selectedScript = Vide.source(nil)
const animatedTitle = Vide.source("Beanz")
 
local onCopy = function()
    setclipboard(`loadstring(game:HttpGet("{selectedScript().Loadstring}"))()`)
end
local onRun = function()
    loadstring(game:HttpGet(selectedScript().Loadstring))()
end
-- Reusable button for popup actions (Copy Script / Run)
local function popupButton(props)
    local children = props.Children
    props.Children = nil
    return TextButton {
        Size = UDim2.fromScale(.5, .1),
        Bold = true,
        Vide.create "UICorner" {},
        UIPadding {
            PaddingHorizontal = UDim.new(.1, 0),
        },
        Children = children,
        props,
    }
end

-- Search box used in Scripts/Tools tabs
local function searchBox(props)
    const box = TextBox {
        PlaceholderText = "Search...",
        Text = "",
        Size = UDim2.fromScale(0.59573, 0.09866),
        Position = UDim2.fromScale(0.38645, 0.02309),
        Children = {
            Vide.create "UICorner" {},
            UIStroke {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Thickness = .05,
            },
        },
        props,
    }
    box:GetPropertyChangedSignal("Text"):Connect(function()
        local text = string.lower(box.Text)
        for _, link in box.Parent.Scroll:GetChildren() do
            if link:IsA("TextButton") then
                link.Visible = string.find(string.lower(link.Text), text, 1, true) ~= nil
            end
        end
    end)
    return box
end

-- Scroll list used inside Scripts/Tools folders
local function scrollList(props)
    local children = props.Children
    props.Children = nil
    return ScrollingFrame {
        Name = "Scroll",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.54752, 0.78291),
        Position = UDim2.fromScale(0.43466, 0.1612),
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                    Vide.create "UIListLayout" {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Wraps = true,
                Padding = UDim.new(0.007, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
            },
            UIPadding {
                PaddingTop = UDim.new(0.01, 0),
            },
        Children = children,
        props,
        
    }
end

local gui
local destroyRoot = Vide.mount(function()
    -- Build instances bottom-up, capturing refs

    -- Bean logo (UI["6"])
    local beanLogo = ImageLabel {
        ZIndex = 3,
        Image = "http://www.roblox.com/asset/?id=18187292776",
        Size = UDim2.fromScale(1, 1),
    }

    -- "Beanz" text (UI["7"])
    local beanzText = TextLabel {
        Size = UDim2.fromScale(1, 1),
        Text = animatedTitle,
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        ClipsDescendants = true,
        Position = UDim2.fromScale(-0.789, 0),
        Visible = false,
        UIPadding {
            PaddingLeft = UDim.new(.05,0)
        }
    }

    -- Delete button (UI["9"])
    local deleteButton = TextButton {
        Name = "Delete",
        Text = "X",
        ZIndex = 3,
        Size = UDim2.fromScale(0.06157, 0.597),
        Position = UDim2.fromScale(0.928, 0.2),
        BackgroundTransparency = 0.95,
        Visible = false,
    }

    -- Title bar (UI["5"])
    local Title = Frame {
        Name = "Title",
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        Children = {
            beanLogo,
            beanzText,
            -- Background behind logo (UI["8"])
            Frame {
                Name = "Nackground",
                Active = true,
                ZIndex = 2,
                BackgroundColor3 = Color3.fromRGB(100,100,100),
                Size = UDim2.fromScale(0.15, 1),
            },
            deleteButton,
        },
    }

    -- Arrow button to close popup (UI["e"])
    local popupbutton = TextButton {
        Font = Enum.Font.FredokaOne,
        Text = ">",
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(1.072, 0.5),
        Rotation = 180,
        Size = UDim2.fromScale(0.23653, 0.1),
        BackgroundTransparency = 1,
    }

    -- Popup panel (UI["d"])
    local Popup = Frame {
        Name = "Popup",
        ZIndex = 5,
        BackgroundColor3 = Color3.fromRGB(67, 67, 67),
        Size = UDim2.fromScale(0.36, 1),
        Position = UDim2.fromScale(-0.36, 0.00185),
        Children = {
            popupbutton,

            -- Description (UI["f"])
            TextLabel {
                Name = "Description",
                ZIndex = 5,
                BackgroundTransparency = 0.8,
                Size = UDim2.fromScale(0.71053, 0.18607),
                Position = UDim2.fromScale(0.14208, 0.32532),
                Text = function()
                    return selectedScript() and selectedScript().Description or ""
                end,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Children = {
                    UIPadding {
                        Padding = UDim.new(0.1, 0),
                    },
                },
            },

            -- Status (UI["11"])
            TextLabel {
                Name = "Status",
                ZIndex = 5,
                Text = function()
                    const statuses = {
                        [WORKING] = RichText:Color("WORKING", Color3.fromRGB(0,255,0)),
                        [OUTDATED] = RichText:Color("OUTDATED",Color3.fromRGB(255,255,0)),
                        [NOT_WORKING] = RichText:Color("NOT WORKING", Color3.fromRGB(255,0,0))
                    }
                    return selectedScript() and statuses[selectedScript().Status] or ""
                end,
                Bold = true,
                TextColor3 = Color3.fromRGB(0, 255, 0),
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.59292, 0.05907),
                Position = UDim2.fromScale(0.20334, 0.51299),
            },

            -- Title (UI["12"])
            TextLabel {
                Name = "Title",
                ZIndex = 5,
                Text = function()
                    return selectedScript() and selectedScript().Title or ""
                end,
                Bold = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.81409, 0.15697),
                Position = UDim2.fromScale(0.09296, 0.11951),
            },

            -- Copy Script button (UI["13"])
            popupButton {
                Name = "CopyScript",
                Text = "Copy Script",
                ZIndex = 5,
                Position = UDim2.fromScale(0.25563, 0.76031),
                Size = UDim2.fromScale(0.48584, 0.09407),
                BackgroundColor3 = Color3.fromRGB(86, 171, 0),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                MouseButton1Click = onCopy,
            },

            -- Run button (UI["16"])
            popupButton {
                Name = "RunScript",
                Text = "Run",
                ZIndex = 5,
                Position = UDim2.fromScale(0.25563, 0.63067),
                Size = UDim2.fromScale(0.48584, 0.09407),
                BackgroundColor3 = Color3.fromRGB(43, 71, 255),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Children = {
                    Vide.create "UICorner" {},
                    UIPadding {
                        PaddingHorizontal = UDim.new(0.3, 0),
                    },
                },
                MouseButton1Click = onRun,
            },
        },
    }

        local popupanim = TweenService:Create(Popup, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
        Position = UDim2.fromScale(0, 0),
    })
    local buttonanim = TweenService:Create(popupbutton, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
        Position = UDim2.fromScale(1.072, 0.5),
        Rotation = 180,
    })
    const recommendedColor = Color3.fromRGB(56, 172, 108)
    local originalpopuppos = Popup.Position
    local originalbuttonpos = popupbutton.Position
    -- Script/tool list item (the Placeholder template equivalent)
    local coloredbutton = nil 
    local wasRecommended = false
    local function listItem(props)
    const recommened = props.Details.GameId and props.Details.GameId == game.GameId
    local btn =  TextButton {
        Bold = true,
        Name = props.Name,
        Text = props.Details.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        TextColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/RobotoCondensed.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(0.802, 0.04627),
        Children = {
            UIPadding {
                PaddingTop = UDim.new(0.3, 0),
                PaddingBottom = UDim.new(0.3, 0),
                PaddingLeft = UDim.new(0.04, 0),
                PaddingRight = UDim.new(0.3, 0),
            },
            Vide.create "UICorner" {},
            UIStroke {
                Thickness = .05,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }
        },
    }
    if recommened then
        btn.LayoutOrder = -1
        btn.BackgroundColor3 = recommendedColor
    end
    btn.MouseButton1Click:Connect(function()
            if selectedScript() == props.Details then return end  
            popupbutton.Rotation = 0
                        selectedScript(props.Details)

                    popupbutton.Visible = true
                    local duration = 0.4
                    local highlightGoal = {
                        BackgroundColor3 = Color3.fromRGB(42, 70, 255),
                        BackgroundTransparency = 0.4,
                    }
                    local resetGoal = {
                        BackgroundColor3 = wasRecommended and recommendedColor or Color3.fromRGB(255,255,255),
                        BackgroundTransparency = 0,
                    }

                    local addcolor = TweenService:Create(btn, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), highlightGoal)
                    local removecolor = nil
                    if coloredbutton then
                        removecolor = TweenService:Create(coloredbutton, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), resetGoal)
                    end
                    task.delay(duration, function()
                        addcolor:Destroy()
                        if removecolor then removecolor:Destroy() end
                    end)
                    coloredbutton = btn
                    wasRecommended = recommened
                    if popupanim.PlaybackState == Enum.PlaybackState.Playing or popupanim.PlaybackState == Enum.PlaybackState.Completed then
                        addcolor:Cancel()
                        if removecolor then removecolor:Cancel() end
                        popupanim:Cancel()
                        Popup.Position = originalpopuppos
                        addcolor:Play()
                        if removecolor then removecolor:Play() end
                        popupanim:Play()
                        btn.Rotation = 0
                        buttonanim:Play()
                    else
                        popupanim:Play()
                        buttonanim:Play()
                        addcolor:Play()
                        if removecolor then removecolor:Play() end
                    end
    end)
    return btn
    end
    -- Selector highlight (UI["22"])
    local selector = Frame {
        Name = "Selector",
        BackgroundColor3 = Color3.fromRGB(76, 76, 76),
        BorderSizePixel = 3,
        BorderMode = Enum.BorderMode.Inset,
        Size = UDim2.fromScale(0.895, 0.048),
    }

    -- Main scrolling frame for sidebar (UI["1b"])
    local MainMenu = ScrollingFrame {
        Name = "Main",
        Active = true,
        ZIndex = 3,
        BackgroundTransparency = 1,
        ScrollingEnabled = false,
        ScrollBarImageTransparency = 1,
        Size = UDim2.fromScale(0.32222, 0.9746),
        Position = UDim2.fromScale(0.02645, 0.0254),
        ScrollBarThickness = 8,
        Children = {
            selector,
            -- Buttons container (UI["1c"])
            Frame {
                Name = "Buttons",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Children = {
                    Vide.create "UIListLayout" {
                        Padding = UDim.new(0.02, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },
                    TextButton {
                        Name = "Scripts",
                        Bold = true, ZIndex = 4,
                        Text = "Scripts",
                        BackgroundColor3 = Color3.fromRGB(76, 76, 76),
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.89506, 0.04818),
                    },
                    TextButton {
                        Name = "Tools",
                        Bold = true, ZIndex = 4,
                        Text = "Tools",
                        BackgroundColor3 = Color3.fromRGB(76, 76, 76),
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.89506, 0.04818),
                    },
                    TextButton {
                        Name = "Settings",
                        Bold = true, ZIndex = 4,
                        Text = "Settings",
                        BackgroundColor3 = Color3.fromRGB(76, 76, 76),
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.89506, 0.04818),
                    },
                    TextButton {
                        Name = "Moresoon",
                        Bold = true, ZIndex = 4,
                        Text = "More coming soon",
                        BackgroundColor3 = Color3.fromRGB(76, 76, 76),
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.89506, 0.04818),
                    },
                },
            },
        },
    }

    -- Tools search box
    local toolsSearchBox = searchBox { Visible = false }

    -- Tools folder (UI["26"])
    local toolsFolder = Vide.create "Folder" {
        Name = "Tools",
        toolsSearchBox,
        scrollList {
            Visible = false,
            Children = (function()
                local items = {}
                for name, v in scripttable.Tools do
                    table.insert(items, listItem {
                        Name = name,
                        Details = v,
                    })
                end
                return items
            end)(),
        },
    }

    -- Scripts search box
    local scriptsSearchBox = searchBox {}

    -- Scripts folder (UI["45"])
    local scriptsFolder = Vide.create "Folder" {
        Name = "Scripts",
        scriptsSearchBox,
        scrollList {
            Children = (function()
                local items = {}
                for name, v in scripttable.Scripts do
                    table.insert(items, listItem {
                        Name = name,
                        Details = v,
                    })
                end
                return items
            end)(),
        },
    }

    -- Settings folder (UI["58"])
    local settingsfolder = Vide.create "Folder" {
        Name = "Settings",
        Frame {
            Name = "Scroll",
            Visible = false,
            ZIndex = 4,
            Size = UDim2.fromScale(0.4441, 0.13943),
            Position = UDim2.fromScale(0.43515, 0.17286),
            Children = {
                TextLabel {
                    Name = "Skip",
                    ZIndex = 4,
                    Text = "Fast Intro",
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromScale(0.49731, 0.52097),
                    Position = UDim2.fromScale(0.03317, 0.18866),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                },
                TextButton {
                    Name = "SkipButton",
                    ZIndex = 4,
                    Text = "",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.3, 0.6),
                    Position = UDim2.fromScale(0.62772, 0.16171),
                    Children = {
                        UIStroke {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        },
                    },
                },
            },
        },
    }

    -- Background panel (UI["c"])
    local Background = Frame {
        Name = "Background",
        ZIndex = 3,
        BackgroundColor3 = Color3.fromRGB(131, 131, 131),
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 0),
        Position = UDim2.fromScale(0.5, 1),
        AnchorPoint = Vector2.new(0.5, 0),
        Children = {
            Popup,
            -- OtherBackground (UI["19"])
            Frame {
                Name = "OtherBackground",
                ZIndex = 3,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.9,
                Size = UDim2.fromScale(0.36, 1),
                Children = {
                    UIStroke { Thickness = .01 },
                },
            },
            MainMenu,
            -- Content area background (UI["23"])
            Frame {
                Name = "dontusethis",
                ZIndex = 4,
                BackgroundTransparency = 0.9,
                Size = UDim2.fromScale(0.59355, 0.79593),
                Position = UDim2.fromScale(0.38895, 0.14791),
                Children = {
                    UIStroke {
                        Enabled = false,
                        Thickness = .02,
                    },
                },
            },
            UIStroke { Thickness = .005 },
            toolsFolder,
            scriptsFolder,
            settingsfolder,
        },
    }

    -- MainFrame (UI["4"])
    local MainFrame = Frame {
        Name = "MainFrame",
        Active = true,
        BackgroundColor3 = Color3.fromRGB(100, 100, 100),
        Size = UDim2.fromScale(0.06, 0.00163),
        Position = UDim2.fromScale(0.5, 0.65),
        AnchorPoint = Vector2.new(0.5, 1),
        Children = {
            Title,
            UIStroke { Thickness = .02 },
            Background,
        },
    }

    gui = Vide.create "ScreenGui" {
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        Name = "BeanzHub",
        MainFrame,
    }

    -- ====== SETTINGS / FILE HELPERS ======
    local mainfolder = "BeanzHub/"
    local paste = "Main.json"
    local config = ConfigSystem:new(mainfolder..paste,
	{
        FastIntro = true
	})
    -- ====== INTRO ANIMATION ======
    local speed = 1
    if config.loadedConfig.FastIntro then
        speed = 0
        settingsfolder.Scroll.SkipButton.BackgroundTransparency = 0
    end
    speed = 1
    Title.TextLabel.Visible = false
    Background.UIStroke.Enabled = false

    local function introAnim()
        local tweeninfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false)
        local tween = TweenService:Create(MainFrame, tweeninfo, { Size = UDim2.fromScale(MainFrame.Size.X.Scale, 0.103) })
        tween:Play()
        tween:GetPropertyChangedSignal("PlaybackState"):Connect(function()
            if tween.PlaybackState == Enum.PlaybackState.Completed then
                task.wait(0.4 * speed)
                TweenService:Create(MainFrame, tweeninfo, { Size = UDim2.fromScale(0.34, 0.103) }):Play()
                TweenService:Create(Title.ImageLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
                    Position = UDim2.fromScale(-0.4, 0),
                    Rotation = -360,
                }):Play()
                task.wait(0.4 * speed)
                Title.TextLabel.Visible = true
                TweenService:Create(Title.TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
                    Position = UDim2.fromScale(0, 0),
                }):Play()
                task.wait(0.8 * speed)
                local redcolor = Color3.fromRGB(255, 0, 0)
                local bluecolor = Color3.fromRGB(42, 70, 255)
                task.wait(0.4 * speed)
                animatedTitle("Beanz"..RichText:Color("z", redcolor))
                task.wait(0.4 * speed)
                animatedTitle("Beanz"..RichText:Color("zz", redcolor))
                task.wait(0.2 * speed)
                animatedTitle("Beanz"..RichText:Color("zz", redcolor))
                task.wait(0.2 * speed)
                animatedTitle("Beanz"..RichText:Color("z", redcolor))
                task.wait(0.2 * speed)
                animatedTitle("Beanz")
                task.wait(0.4 * speed)
                animatedTitle("Beanz"..RichText:Color("H", bluecolor))
                task.wait(0.2 * speed)
                animatedTitle("Beanz"..RichText:Color("HU", bluecolor))
                task.wait(0.2 * speed)
                animatedTitle("Beanz"..RichText:Color("HUB", bluecolor))
                task.wait(0.3 * speed)
                TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
                    Position = mainFramePos,
                    Size = mainFrameSize,
                }):Play()
                task.wait(0.4 * speed)
                TweenService:Create(Background, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
                    Size = bgSize,
                }):Play()
                Background.UIStroke.Enabled = true
                task.wait(0.4 * speed)
                -- ====== POST-INTRO SETUP ======
                Title.Delete.Visible = true
            end
        end)
    end

    -- ====== DUPLICATE CLEANUP ======
    for _, ok in game:GetService("CoreGui"):GetChildren() do
        if gui.Name == ok.Name then
            if gui == ok then continue end
            ok:Destroy()
        end
    end

    -- ====== DRAGGABLE ======
    local stopDrag = makeDraggable(MainFrame)

    -- ====== INTRO ======
    introAnim()

    -- ====== DELETE BUTTON ======
    Title.Delete.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- ====== POPUP ANIMATIONS ======
    local current = "Scripts"
    popupbutton.Visible = false


    local backanim = TweenService:Create(Popup, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
        Position = originalpopuppos,
    })
    local backanimbutton = TweenService:Create(popupbutton, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
        Position = originalbuttonpos,
        Rotation = -180,
    })

    backanimbutton:GetPropertyChangedSignal("PlaybackState"):Connect(function()
        if backanimbutton.PlaybackState == Enum.PlaybackState.Completed then
            popupbutton.Rotation = 0
        end
    end)

    -- ====== TAB SWITCHING ======
    local multi = 0.068

    local function sendselector(thing, whereto)
        local tabla = { Position = whereto }
        local switch = TweenService:Create(thing, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), tabla)
        switch:Play()
        task.wait(0.2)
        switch:Destroy()
    end

    for i, button in ipairs(MainMenu.Buttons:GetChildren()) do
        if button:IsA("TextButton") then
            button.MouseButton1Up:Connect(function()
                if current == button.Name then return end
                current = button.Name
                local accpos = i - 2
                local pos = UDim2.fromScale(0, multi * accpos)
                sendselector(selector, pos)
                for _, folder in Background:GetChildren() do
                    if folder:IsA("Folder") then
                        local has = folder:FindFirstChild("TextBox") ~= nil
                        folder.Scroll.Visible = false
                        if has then
                            folder.TextBox.Visible = false
                        end
                        if current == folder.Name then
                            folder.Scroll.Visible = true
                            if has then
                                folder.TextBox.Visible = true
                            end
                        end
                    end
                end
            end)
        end
    end

    -- ====== POPUP CLOSE BUTTON ======
    popupbutton.MouseButton1Click:Connect(function()
        backanim:Play()
        backanimbutton:Play()
        selectedScript(nil)
        if coloredbutton then
            local removecolor = TweenService:Create(coloredbutton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false), {
                BackgroundColor3 = wasRecommended and recommendedColor or Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0,
            })
            removecolor:Play()
        end
        coloredbutton = nil
        task.wait(0.2)
        popupbutton.Visible = false
    end)

    -- ====== SETTINGS TOGGLE ======
    settingsfolder.Scroll.SkipButton.MouseButton1Click:Connect(function()
        if settingsfolder.Scroll.SkipButton.BackgroundTransparency == 0 then
            config:AppendConfig({FastIntro = false})
            settingsfolder.Scroll.SkipButton.BackgroundTransparency = 1
        else
            config:AppendConfig({FastIntro = true})
            settingsfolder.Scroll.SkipButton.BackgroundTransparency = 0
        end
    end)

    return gui
end, game:GetService("CoreGui"))

return gui.MainFrame