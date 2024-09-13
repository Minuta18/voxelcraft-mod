# Утилиты

Различные полезные классы и функции.

```lua
dump(literally_anything: table) -> str
```

Конвертирует таблицу в строку.

```lua
create_class(base_class: table)
```

Создаёт класс.

## PlayerDataStore

```lua
local player_data_store = PlayerDataStore:new()
```

Создаёт экземпляр класса.

```lua
player_data_store:get(eid)
```

Возвращает хранимый объект по `eid`.

```lua
player_data_store:set(eid, data)
```

Устанавливает объект по `eid`.

```lua
player_data_store:update_all()
```

Обновляет все объекты имеющие метод `update()`.

```lua
player_data_store:render_update_all()
```

Обновляет все объекты имеющие метод `render_update()`.

## PlayerDataStoreSaver

```lua
local player_data_store_saver = PlayerDataStoreSaver:new(player_data_store, filename)
```

Создаёт экземпляр класса.

```lua
player_data_store_saver:get_filename()
```

Возвращает название хранилища.

```lua
player_data_store_saver:save()
```

Сохраняет хранилище.

## ISerializable

Интерфейс сериализаторов.

```lua
-- Сериализует объект
function ISerializable:serialize(inst) end
-- Десериализует объект
function ISerializable:deserialize(inst) end
```


