hs.loadSpoon("RecursiveBinder")
hs.loadSpoon("hs_select_window")

spoon.RecursiveBinder.escapeKey = { {}, "escape" } -- Press escape to abort

local singleKey = spoon.RecursiveBinder.singleKey

local hyper = { "shift", "ctrl", "cmd", "alt" }

local function nextWindowForApp()
	-- local tildeKeyCode = 50
	hs.eventtap.keyStroke(hyper, "p")
	-- local result = hs.execute("~/.config/scripts/nextWindow.sh")
end

local function launchFocusOrSwitch(name)
	local currentApplication = hs.application.frontmostApplication():title()
	if currentApplication == name then
		nextWindowForApp()
		return true
	else
		return hs.application.launchOrFocus(name)
	end
end

local function openOneOf(names)
	return function()
		for _, name in pairs(names) do
			if launchFocusOrSwitch(name) then
				return
			end
		end
	end
end

local keyMap = {
	[singleKey("x", "xcode")] = function()
		launchFocusOrSwitch("Xcode")
	end,
	[singleKey("s", "slack")] = function()
		launchFocusOrSwitch("Slack")
	end,
	[singleKey("g", "git")] = openOneOf({ "Fork", "SourceTree" }),
	[singleKey("f", "finder")] = function()
		launchFocusOrSwitch("Finder")
	end,
	[singleKey("t", "terminal")] = function()
		launchFocusOrSwitch("Alacritty")
	end,
	[singleKey("z", "zoom")] = function()
		launchFocusOrSwitch("zoom.us")
	end,
	[singleKey("b", "browser")] = openOneOf({ "Arc", "Chrome", "Google Chrome", "Safari" }),
	[singleKey("d", "domain+")] = {
		[singleKey("g", "github")] = function()
			hs.urlevent.openURL("https://github.com")
		end,
		[singleKey("y", "youtube")] = function()
			hs.urlevent.openURL("https://youtube.com")
		end,
	},
}

hs.hotkey.bind(hyper, "x", function()
	launchFocusOrSwitch("Xcode")
end)

hs.hotkey.bind(hyper, "t", function()
	launchFocusOrSwitch("Alacritty")
end)

hs.hotkey.bind(hyper, "b", function()
	launchFocusOrSwitch("Google Chrome")
end)

hs.hotkey.bind(hyper, "s", function()
	launchFocusOrSwitch("Slack")
end)

hs.hotkey.bind(hyper, "g", function()
	launchFocusOrSwitch("Fork")
end)

hs.hotkey.bind(hyper, "f", function()
	launchFocusOrSwitch("Finder")
end)

hs.hotkey.bind({ "option" }, "space", spoon.RecursiveBinder.recursiveBind(keyMap))
