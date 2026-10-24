const WORKING = 0
const NOT_WORKING = 1
const OUTDATED = 2
local scripttable = {
    Scripts = {
        LifeSentence = {
            Text = 'Life Sentence GUI',
            Title = 'Life Sentence GUI v1.7',
            Description = 'Money autofarm, Part autofarm, Autotrain',
            Loadstring = [[https://raw.githubusercontent.com/pid4k/scripts/main/lifesentencenew.lua]],
            Status = OUTDATED,
            GameId = 4571439504,
        },
        BladeBall = {
            Text = 'BladeBall GUI',
            Title = 'BladeBall GUI',
            Description = 'AutoParry,W.I.P',
            Loadstring = [[https://raw.githubusercontent.com/pid4k/scripts/main/ATNBH.lua]],
            Status = OUTDATED,
            GameId = 4777817887,
        },
        UniversalAB = {
            Text = 'Universal Aimbot',
            Title = 'Universal Aimbot GUI',
            Description = 'Sigma imbot fr',
            Loadstring = [[https://raw.githubusercontent.com/pid4k/scripts/main/universalaimbot.lua]],
            Status = WORKING,
        },
        EmergencyHamburg = {
            Text = 'Emergency Hamburg Script',
            Title = 'Emergency Hamburg Script',
            Description = 'dsc.gg/beanzhub',
            GameId = 2992873140,
            Loadstring = [[https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/emergencyhamburg.lua]],
            Status = WORKING,
        },
        UntitledBoxingGame = {
            Text = 'Untitled Boxing Game Script',
            Title = 'UBG Script',
            Description = 'autododge & antifeint',
            Loadstring = [[https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/untitledboxinggame.lua]],
            Status = WORKING,
            GameId = 4730278139,
        },
    },
    Tools = {
        ChatSpy = {
            Text = 'Chat Spy',
            Title = 'Chat Spy',
            Description = 
[[Allows you to see private messages and messages on games with hidden chats.]],
            Loadstring = 
[[https://raw.githubusercontent.com/dehoisted/Chat-Spy/main/source/main.lua]],
            Status = OUTDATED,
        },
        CBypass = {
            Text = 'Chat Bypass',
            Title = 'Chat Bypass',
            Description = 'Allows you to bypass roblox filter. Still W.I.P',
            Loadstring = 
[[https://raw.githubusercontent.com/pid4k/scripts/main/cbypass.lua]],
            Status = OUTDATED,
        },
        GuiPath = {
            Text = 'Gui Button Path',
            Title = 'Gui Button Path',
            Description = 'ts buns why did i make this',
            Loadstring = 
[[https://raw.githubusercontent.com/pid4k/scripts/main/getguibuttonpath.lua]],
            Status = OUTDATED,
        },
        InfiniteYield = {
            Text = 'Infinite Yield',
            Title = 'Infinite Yield',
            Description = 'zyes bery gud',
            Loadstring = 
[[https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source]],
            Status = WORKING,
        },
    },
}

return scripttable