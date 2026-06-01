--!strict

<<<<<<< HEAD
-- Services
const Players = game:GetService('Players')

const App = require('@ui/components/App')
const Vide = require('@pkg/vide')
const Charm = require('@pkg/charm')

const paths = require('@shared/paths')

const Player = Players.LocalPlayer
const atom = Charm.atom

=======
const Players = game:GetService('Players')

const vide = require('@pkg/vide')
const charm = require('@pkg/charm')
const icon = require('@pkg/topbarplus')

const atom = charm.atom

const paths = require('@shared/paths')
const iconIds = require('@shared/data/iconIds')
const safeChatOptions = require('@shared/data/safeChatOptions')

const App = require('@ui/components/App')
const signals = require('../signals')

const Player = Players.LocalPlayer
const playerGui = Player:WaitForChild('PlayerGui')
>>>>>>> 1657481 (feat: update template)

const InterfaceProvider = {
	__rootCleanup = function() end,
	page = atom<<string?>>(),
<<<<<<< HEAD
	mountedComponents = atom<<{ string }>>({})
}

function InterfaceProvider.start(self: self): ()
	const playerGui = Player:WaitForChild('PlayerGui')

	self.__rootCleanup = Vide.mount(function()
		return App(self.page, self.mountedComponents)
	end, playerGui)

	self:__setDefaultValues()
=======
	mountedComponents = atom<<{ string }>>({}),

	icons = {
		ranks = icon.new(),
		safechat = icon.new(),
		settings = icon.new(),

		dropdowns = {
			safechat = {} :: { icon.Icon },
		},
	},
}

function InterfaceProvider.start(self: self): ()
	self.__rootCleanup = vide.mount(function() return App(self.page, self.mountedComponents) end, playerGui)

	self:__mountTopbar()
	self:__setDefaultValues()

	signals.changeUIPage:Connect(function(page) self:setPage(page) end)
>>>>>>> 1657481 (feat: update template)
end

--[[
	Mount a component by its name
]]
function InterfaceProvider.mountComponent(self: self, componentName: string): ()
	local componentExists = paths.interface.components:FindFirstChild(componentName) ~= nil
<<<<<<< HEAD
	if not componentExists then
		return warn('No component exists with name ', componentName)
	end
	
=======
	if not componentExists then return warn('No component exists with name ', componentName) end

>>>>>>> 1657481 (feat: update template)
	local currentValue = self.mountedComponents()
	table.insert(currentValue, componentName)

	self.mountedComponents(currentValue)
end

--[[
	Unmount a component by its name
]]
function InterfaceProvider.unmountComponent(self: self, componentName: string): ()
	local currentValue = self.mountedComponents()

	local index = table.find(currentValue, componentName)
	if not index then return end
<<<<<<< HEAD
	
=======

>>>>>>> 1657481 (feat: update template)
	table.remove(currentValue, index)
	self.mountedComponents(currentValue)
end

--[[
	Sets the current page rendered
]]
function InterfaceProvider.setPage(self: self, pageName: string): ()
	local pageExists = paths.interface.pages:FindFirstChild(pageName) ~= nil
<<<<<<< HEAD
	if not pageExists then
		return warn('No page with name ', pageName)
	end
=======
	if not pageExists then return warn('No page with name ', pageName) end
>>>>>>> 1657481 (feat: update template)

	self.page(pageName)
end

function InterfaceProvider.cleanup(self: self) self.__rootCleanup() end

--[[
	Sets the InterfaceProvider properties to their default values
]]
function InterfaceProvider.__setDefaultValues(self: self)
	self.page('HUD')
	self.mountedComponents({ 'CharacterSidebarContainer' })
end

<<<<<<< HEAD
=======
function InterfaceProvider.__mountTopbar(self: self)
	self.icons.ranks:setImage(iconIds.topbar.ranks):setLabel('Ranks')
	self.icons.settings:setImage(iconIds.topbar.setting):setLabel('Settings')

	for index, safeChatOption in safeChatOptions.armed do
		table.insert(
			self.icons.dropdowns.safechat,
			icon.new():setLabel(safeChatOption):oneClick(true):bindEvent('selected', function(...)
				self.icons.safechat:deselect()
				net.SaySafeChatOption.Fire(index)
			end)
		)
	end

	self.icons.safechat:setOrder(1):setImage(iconIds.topbar.chat):setDropdown(self.icons.dropdowns.safechat)
end

>>>>>>> 1657481 (feat: update template)
export type self = typeof(InterfaceProvider)
return InterfaceProvider
