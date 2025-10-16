# ec-luart-datamanager

The project is a data management module written in Lua. It defines a DataManger object that handles data of widgets in LuaRT desktop applications.

[![LuaRT 2.1.0](https://badgen.net/badge/LuaRT/2.1.0/blue)](https://github.com/samyeyo/LuaRT)

## Features

The project provides a modular and flexible way to manage datas in desktop applications. It allows easy addition of widgets and their corresponding data  fields, as well as applying values to the widgets. Several data  managers can be used in one application.

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "dm.lua" file into this folder.

```text
[application]
|
|----ecluart
|   |
|   |----dm.lua
|   |----...
|
|----app.wlua
```

## Usage

The data manager (dm) can be loaded using the function *require()*:

```lua
local dm = require("ecluart.dm") 
```

## Constructor

```Lua
DataManager() -> object
```

This function, Datamanager, initializes a new instance of the data manager. It takes a table parameter for the source and returns a new instance of the DataManager object with the provided values.

## Property - source

```Lua
DataManager.source (table)
```

The source property is expected to be a table containing the source data.

## Method - add

```Lua
DataManager:add(widget: object, property: string, field: string) -> none
```

This function adds a widget, property, and source field to the data manager. It takes an object parameter for the widget, a string parameter for the property, and another string parameter for the field. Before adding the child, it checks if the widget is a valid child using the isValidChild function. If any of the parameters are invalid, the function returns early. Otherwise, it creates a new child object with the widget, property, and field, and inserts it into the self.children table.

## Method - apply

```Lua
DataManager:apply() -> none
```

This function sets the source value for each widget in the data manager. It checks if the self.source table is empty using the next function. If it is empty, the function returns early. Otherwise, it iterates over each child in the self.children table and retrieves the source value from the self.source table using the child's key. If a setting value exists, it sets the widget's property to the source value.

## Method - value

```Lua
DataManager:value(field: string) -> any
```

This function retrieves the source value for a given field from the data manager. It takes a string parameter for the field. If the field is not a string, it returns nil. Otherwise, it retrieves the source value from the self.source table using the field. If the source value does not exist, it returns nil; otherwise, it returns the source value.

## Method - update

```Lua
DataManager:update(field: string, value: any) -> none
```

The code provided is a function called update in the Datamanager class. This function is responsible for updating the value of a source based on a given field. The method takes two parameters: field (string) and value (any data type). These parameters represent the field and the new value to be updated.

## Method - save

```Lua
DataManager:save() -> none
```

This function saves the source value for each widget in the data manager. It iterates over each child in the self.children table and stores the source value to the self.source table using the child's property. If a source value exists, it sets the source's entry to the source value.

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
