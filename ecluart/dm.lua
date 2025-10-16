-- Defines a data management module.
local dm = {} -- version 2025.04

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
local function isString(parameter)
  return type(parameter) == "string"
end

-- Checks if the parameter is a nil type.
-- isNil(parameter: any) -> boolean
local function isNil(parameter)
  return type(parameter) == "nil"
end

-- Checks if the parameter is a table type.
-- isTable(parameter: any) -> boolean
local function isTable(parameter)
  return type(parameter) == "table"
end

-- Defines the data manager object.
local DataManager = Object({})

-- Creates the data manager constructor.
function DataManager:constructor()
  local _source = {}

  function self:set_source(value)
    if not isTable(value) then
      value = {}
    end

    _source = value
  end

  function self:get_source()
    return _source
  end

  self.children = {}
end

-- Adds a widget, property and source field.
-- add(widget: object, property: string, field: string) -> none
function DataManager:add(widget, property, field)
  if not isValidChild(widget) then return end
  if not isString(property) then return end
  if not isString(field) then return end

  local newChild = {
    widget = widget,
    property = property,
    field = field
  }

  table.insert(self.children, newChild)
end

-- Sets the source value for each widget.
-- apply() -> none
function DataManager:apply()
  for _, child in ipairs(self.children) do
    local sourceValue = self.source[child.field]

    if not isNil(sourceValue) then
      child.widget[child.property] = sourceValue
    end
  end
end

-- Gets the source value for a field.
-- value(field: string) -> any
function DataManager:value(field)
  if not isString(field) then return nil end
  return self.source[field] or nil
end

-- Updates the source value for a field.
-- update(field: string, value: any) -> none
function DataManager:update(field, value)
  if not isString(field) then return end

  if not isNil(self.source[field]) then
    self.source[field] = value
  end
end

-- Saves the source value for each widget.
-- save() -> none
function DataManager:save()
  for _, child in ipairs(self.children) do
    local sourceValue = child.widget[child.property]

    if not isNil(sourceValue) then
      self.source[child.field] = sourceValue
    end
  end
end

-- Initializes a new data manager instance.
-- dataManager() -> object
function dm.DataManager()
  return DataManager()
end

return dm
