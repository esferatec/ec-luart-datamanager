# ec-luart-datamanager

The project is a data management module written in Lua. It defines a DataManager object that handles data of widgets in LuaRT desktop applications.

[![LuaRT 2.1.0](https://badgen.net/badge/LuaRT/2.1.0/blue)](https://github.com/samyeyo/LuaRT)

## Features

The project provides a modular and flexible way to manage datas in desktop applications. It allows easy addition of widgets and their corresponding data fields, as well as applying values to the widgets. Several data managers can be used in one application.

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

Initializes a new data manager instance.

## Property - source

```Lua
DataManager.source (table)
```

Table containing the source data.

## Method - add

```Lua
DataManager:add(widget: object, property: string, field: string, converter: function, default: any) -> none
```

Adds a widget, widget property, source field, field converter and default value.

## Method - load

```Lua
DataManager:load() -> none
```

Loads the source value for each widget.

## Method - save

```Lua
DataManager:save() -> none
```

Saves the source value for each widget.

## Method - default

```Lua
DataManager:default() -> none
```

Sets the default value for each widget.

## Method - value

```Lua
DataManager:value(field: string) -> any
```

Gets the source value for a field.

## Method - update

```Lua
DataManager:update(field: string, value: any) -> none
```

Updates the source value for a field.

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
