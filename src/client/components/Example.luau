--!strict
const Components = require('@pkg/quill_rblx_components')

const Trove = require('@pkg/trove')
const EzInput = require('@pkg/ezinput')

-- Component Class
const Example = {}
Example.__index = Example

type ExampleProperties = {
  instance: Tool,
  handle: BasePart,
  trove: Trove.Trove,
  input: EzInput.ContextBuilder,
  equippedTrove: Trove.Trove?
}

export type self =  setmetatable<ExampleProperties, typeof(Example)>

-- Runs when the component is bound to an Instance
function Example.init(self: self): ()
  -- When the gun is destroyed, cleanup the trove
  self.trove:AttachToInstance(self.instance)

  self.trove:Add(self.instance.Equipped:Connect(function()
    self.equippedTrove = self.trove:Extend()
    self.input = EzInput.context('Example')

    self:__attachInput()
  end))

  self.trove:Add(self.instance.Unequipped:Connect(function()
    if self.equippedTrove then
      self.equippedTrove:Clean()
    end
  end))
end

function Example.use(self: self): ()
  print('used tool')
end

-- Runs when the Instance is destroyed
function Example.destroy(self: self): ()
  self.trove:Clean()
end

function Example.__attachInput(self: self): ()
  self.input:action('use'):bind(Enum.KeyCode.MouseLeftButton):action():onPressed(function()
    self:use()
  end)


  if not self.equippedTrove then
    return
  end

  self.equippedTrove:Add(function()
    self.input:destroy()
  end)
end

-- Quill component wrapper
const ExampleComponent = {}

-- Contains info such as filters
ExampleComponent.info = Components.info {
  is = Components.singleton('Tool'),
  tag = Components.singleton('Example'),

  children = {
    Handle = Components.child('BasePart')
  }
}

-- Ran when the Component is constructing a new class instance
function ExampleComponent:new(data: Components.CreationData<typeof(ExampleComponent.info)>): self
  local example = setmetatable({}, Example) :: self

  example.instance = data.instance :: Tool
  example.handle = data.children.Handle

  example.trove = Trove.new()

  return example
end

return ExampleComponent
