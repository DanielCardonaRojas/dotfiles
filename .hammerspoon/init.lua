hs.loadSpoon("RecursiveBinder")

spoon.RecursiveBinder.escapeKey = { {}, "escape" } -- Press escape to abort

local singleKey = spoon.RecursiveBinder.singleKey

local function openOneOf(names)
	return function()
		for _, name in pairs(names) do
			if hs.application.launchOrFocus(name) then
				return
			end
		end
	end
end

local keyMap = {
	[singleKey("x", "xcode")] = function()
		hs.application.launchOrFocus("Xcode")
	end,
	[singleKey("s", "slack")] = function()
		hs.application.launchOrFocus("Slack")
	end,
	[singleKey("t", "terminal")] = function()
		hs.application.launchOrFocus("Alacritty")
	end,
	[singleKey("z", "zoom")] = function()
		hs.application.launchOrFocus("zoom.us")
	end,
	[singleKey("g", "git")] = openOneOf({ "Fork", "SourceTree" }),
	[singleKey("b", "browser")] = openOneOf({ "Arc", "Google Chrome", "Safari" }),
	[singleKey("d", "domain+")] = {
		[singleKey("g", "github")] = function()
			hs.urlevent.openURL("https://github.com")
		end,
		[singleKey("y", "youtube")] = function()
			hs.urlevent.openURL("https://youtube.com")
		end,
	},
}

hs.hotkey.bind({ "option" }, "space", spoon.RecursiveBinder.recursiveBind(keyMap))
