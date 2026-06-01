<<<<<<< HEAD
<<<<<<< HEAD
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local quill = require('@packages/quill-core')
local quill_components = require('@packages/quill-rblx-components')
=======
const components = require('@pkg/quill_rblx_components')
const dependency = require('@pkg/quill_dependencies')
const quill = require('@pkg/quill_core')
const lifecycles = require('@pkg/quill_rblx_lifecycles')
const paths = require('@shared/paths')

local function getModules(): { ModuleScript }
	const providerInstances = paths.client.providers:GetDescendants()
	const componentInstances = paths.client.components:GetChildren()
>>>>>>> 1657481 (feat: update template)

	local modules = {}

<<<<<<< HEAD
	for _, v in descendants do
=======
const components = require('@pkg/quill_rblx_components')
const dependency = require('@pkg/quill_dependencies')
const quill = require('@pkg/quill_core')
const lifecycles = require('@pkg/quill_rblx_lifecycles')
local paths = require('@shared/paths')

const function getModules(): { ModuleScript }
	const providerInstances = paths.client.providers:GetDescendants()
	const componentInstances = { table.unpack(paths.client.components:GetChildren()) }

	local modules = {}

	-- Iterate thru all providers and components to load
	for _, v in { table.unpack(providerInstances), table.unpack(componentInstances) } do
>>>>>>> main
		if not v:IsA('ModuleScript') then continue end
		table.insert(modules, v :: ModuleScript)
=======
	for _, v in providerInstances do
		if v:IsA('ModuleScript') then table.insert(modules, v) end
	end

	for _, v in componentInstances do
		if v:IsA('ModuleScript') then table.insert(modules, v) end
>>>>>>> 1657481 (feat: update template)
	end

	return modules
end

<<<<<<< HEAD
<<<<<<< HEAD
quill.new():with_modules(get_modules()):with_mod(quill_components.mod()):write()
=======

quill.new():with_modules(getModules()):with_mod(components.mod()):with_mod(lifecycles.mod()):with_mod(dependency.mod()):write()
>>>>>>> main
=======
quill
	.new()
	:with_modules(getModules())
	:with_mod(components.mod())
	:with_mod(lifecycles.mod())
	:with_mod(dependency.mod())
	:write()
>>>>>>> 1657481 (feat: update template)
