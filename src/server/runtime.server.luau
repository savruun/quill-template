<<<<<<< HEAD
<<<<<<< HEAD
local ServerScriptService = game:GetService('ServerScriptService')
local quill = require('@packages/quill-core')
local quill_component = require('@packages/quill-rblx-components')

local function get_modules()
	local descendants = ServerScriptService.server.providers:GetDescendants()
=======
const ServerScriptService = game:GetService('ServerScriptService')

const Component = require('@pkg/quill_rblx_components')
const Dependency = require('@pkg/quill_dependencies')
const Quill = require('@pkg/quill_core')
const Lifecycles = require('@pkg/quill_rblx_lifecycles')

const function getModules(): { ModuleScript }
	const descendants = ServerScriptService.server.providers:GetDescendants()
>>>>>>> main
=======
const Component = require('@pkg/quill_rblx_components')
const Dependency = require('@pkg/quill_dependencies')
const Quill = require('@pkg/quill_core')
const Lifecycles = require('@pkg/quill_rblx_lifecycles')
const paths = require('@shared/paths')

local function getModules(): { ModuleScript }
	-- This will always exist, this is just here for intellisense
	if not paths.server then return end

	const componentsFolder = paths.server:FindFirstChild('components')
	const providersFolder = paths.server:FindFirstChild('providers')

	const providerInstances = providersFolder and providersFolder:GetDescendants()
	const componentInstances = componentsFolder and componentsFolder:GetDescendants()

>>>>>>> 1657481 (feat: update template)
	local modules = {}

	for _, v in providerInstances or {} do
		if v:IsA('ModuleScript') then table.insert(modules, v) end
	end

	for _, v in componentInstances or {} do
		if v:IsA('ModuleScript') then table.insert(modules, v) end
	end

	return modules
end

<<<<<<< HEAD
<<<<<<< HEAD
quill.new():with_modules(get_modules()):with_mod(quill_component.mod()):write()
=======
Quill.new():with_modules(getModules()):with_mod(Component.mod()):with_mod(Lifecycles.mod()):with_mod(Dependency.mod()):write()
>>>>>>> main
=======
Quill.new()
	:with_modules(getModules())
	:with_mod(Component.mod())
	:with_mod(Lifecycles.mod())
	:with_mod(Dependency.mod())
	:write()
>>>>>>> 1657481 (feat: update template)
