hs.loadSpoon("RecursiveBinder")
hs.loadSpoon("hs_select_window")

spoon.RecursiveBinder.escapeKey = { {}, "escape" } -- Press escape to abort

local singleKey = spoon.RecursiveBinder.singleKey

local hyper = { "shift", "ctrl", "cmd", "alt" }

local function indexOf(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return index
		end
	end

	return nil
end

local function nextWindowForApp()
	-- local tildeKeyCode = 50
	hs.eventtap.keyStroke(hyper, "p")
	-- local home = os.getenv("HOME")
	-- Looks like this need to load the user interactive shell first which can be slower and fail
	-- local out, s, rt, rc = hs.execute(home .. "/.config/scripts/nextWindow.sh", true)
	-- print(">>> out: " .. out .. " succeeded: " .. type(s) .. " exit code: " .. rc)
end

local function launchFocusOrCycle(name)
	local currentApplication = hs.application.frontmostApplication():title()
	if currentApplication == name then
		nextWindowForApp()
		return true
	else
		return hs.application.launchOrFocus(name)
	end
end

local function baseZeroIndex(index)
	if index ~= nil then
		if index > 0 then
			return index - 1
		end
	end
	return 0
end

local function focusOrCycleThrough(names)
	local firstName = names[1]
	local currentApplication = hs.application.frontmostApplication()
	local allWindowForCurrentApplication = currentApplication:allWindows()
	local windowCount = #allWindowForCurrentApplication
	local hasMultipleWindows = windowCount > 1
	local currentApplicationIndex = indexOf(names, currentApplication:title())
	local nextIndex = (((baseZeroIndex(currentApplicationIndex)) + 1) % #names) + 1
	local focusedWindow = currentApplication:focusedWindow()
	print(
		">>> currentApplication: "
			.. currentApplication:title()
			.. " current index: "
			.. (currentApplicationIndex or -1)
			.. " window count: "
			.. windowCount
			.. " next index: "
			.. nextIndex
	)

	if currentApplicationIndex ~= nil then
		previousFocusedWindow = currentApplication:title()
		if hasMultipleWindows then
			-- Todo we need to communicate from script back to hammerspoon to notify when has cycled through all windows
			-- so that we can continue to next application otherwise we will loop forever in a single application of multiple windows
			nextWindowForApp()
			return
		end
	end

	local name = names[nextIndex]
	local searchResult = hs.application.find(name)
	if searchResult ~= nil then
		-- Activating window
		searchResult:activate()
		return
	else
		return hs.application.launchOrFocus(name)
	end
end

local function openOneOf(names)
	return function()
		for _, name in pairs(names) do
			if launchFocusOrCycle(name) then
				return
			end
		end
	end
end

local keyMap = {
	[singleKey("x", "xcode")] = function()
		focusOrCycleThrough("Xcode", "Xcode")
	end,
	[singleKey("s", "slack")] = function()
		launchFocusOrCycle("Slack")
	end,
	[singleKey("g", "git")] = openOneOf({ "Fork", "SourceTree" }),
	[singleKey("f", "finder")] = function()
		launchFocusOrCycle("Finder")
	end,
	[singleKey("t", "terminal")] = function()
		launchFocusOrCycle("Alacritty")
	end,
	[singleKey("z", "zoom")] = function()
		launchFocusOrCycle("zoom.us")
	end,
	[singleKey("b", "browser")] = function()
		focusOrCycleThrough({ "Chrome", "Google Chrome", "Arc" })
	end,
	[singleKey("w", "WhatsApp")] = function()
		launchFocusOrCycle("WhatsApp")
	end,
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
	launchFocusOrCycle("Xcode")
end)

hs.hotkey.bind(hyper, hs.keycodes.map["t"], function()
	-- focusOrCycleThrough({ "Alacritty", "Terminal" })
	launchFocusOrCycle("Alacritty")
end)

hs.hotkey.bind(hyper, hs.keycodes.map["b"], function()
	-- focusOrCycleThrough({ "Arc", "Chrome", "Google Chrome", "Safari" })
	launchFocusOrCycle("Google Chrome")
end)

hs.hotkey.bind(hyper, "s", function()
	launchFocusOrCycle("Slack")
end)

hs.hotkey.bind(hyper, hs.keycodes.map["g"], function()
	launchFocusOrCycle("Fork")
end)

hs.hotkey.bind(hyper, "f", function()
	launchFocusOrCycle("Finder")
end)

hs.hotkey.bind(hyper, "Z", function()
	launchFocusOrCycle("zoom.us")
end)

hs.hotkey.bind(hyper, "w", function()
	launchFocusOrCycle("WhatsApp")
end)

hs.hotkey.bind({ "option" }, "space", spoon.RecursiveBinder.recursiveBind(keyMap))
