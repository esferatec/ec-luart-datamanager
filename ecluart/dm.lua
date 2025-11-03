-- Defines a data management module.
local dm = {} -- version 2025.11

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local invalidTypes = {
    "nil",
    "boolean",
    "number",
    "string",
    "userdata",
    "function",
    "thread" }

  return not table.concat(invalidTypes, ","):find(type(parameter))
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
local function isStringType(parameter)
  return type(parameter) == "string"
end

-- Checks if the paramter is a function type.
-- isFunction(parameter: any) -> boolean
local function isFunctionType(parameter)
  return type(parameter) == "function"
end

-- Checks if the parameter is a nil type.
-- isNil(parameter: any) -> boolean
local function isNil(parameter)
  return type(parameter) == "nil"
end

-- Defines the data manager object.
local DataManager = Object({})

-- Creates the data manager constructor.
function DataManager:constructor()
  self.source = {}
  self.children = {}
end

-- Adds a widget, property, source field, field type and default value.
-- add(widget: object, property: string, field: string, type: function, default: any) -> none
function DataManager:add(widget, property, field, type, default)
  if not isValidChild(widget) then return end
  if not isStringType(property) then return end
  if not isStringType(field) then return end
  if not isFunctionType(type) then return end
  if property == "" then return end
  if field == "" then return end

  local newChild = {
    widget = widget,
    property = property,
    field = field,
    type = type,
    default = default
  }

  table.insert(self.children, newChild)
end

-- Loads the source value for each widget.
-- load() -> none
function DataManager:load()
  for _, child in ipairs(self.children) do
    local sourceValue = self.source[child.field]

    if not isNil(sourceValue) then
      child.widget[child.property] = sourceValue
    end
  end
end

-- Saves the source value for each widget.
-- save() -> none
function DataManager:save()
  for _, child in ipairs(self.children) do
    local widgetValue = child.widget[child.property]

    if not isNil(widgetValue) then
      self.source[child.field] = child.widget[child.property]
    end
  end
end

-- Sets the default value for each widget.
-- default() -> none
function DataManager:default()
  for _, child in ipairs(self.children) do
    child.widget[child.property] = child.default
  end
end

-- Gets the source value for a field.
-- value(field: string) -> any
function DataManager:value(field)
  if not isStringType(field) then return end
  if field == "" then return end
  return self.source[field] or nil
end

-- Updates the source value for a field.
-- update(field: string, value: any) -> none
function DataManager:update(field, value)
  if not isStringType(field) then return end
  if field == "" then return end
  self.source[field] = value
end

-- Initializes a new data manager instance.
-- dataManager() -> object
function dm.DataManager()
  return DataManager()
end

return dm
