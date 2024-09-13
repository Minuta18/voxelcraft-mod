# Кастомные свойства

В этом пакете представлены классы и функции для работы с кастомными свойствами.

## loader

```lua
loader.load_fuels(table: table, pack_name: str)
```

Загружает топливо для печи.
Аргументы:
 - `table: table` - таблица из которой будет загружено топливо.
 - `pack_name: str` - название контент-пака из которого была загружена таблица.

```lua
loader.load_ores(table: table, pack_name: str)
```

Загружает руды.
Аргументы:
 - `table: table` - таблица из которой будут загружены руды.
 - `pack_name: str` - название контент-пака из которого была загружена таблица.

```lua
loader.load_hardness(table: table, pack_name: str)
```

Загружает твёрдости.
Аргументы:
 - `table: table` - таблица из которой будут загружены твёрдости.
 - `pack_name: str` - название контент-пака из которого была загружена таблица.

```lua
loader.load_food(table: table, pack_name: str)
```

Загружает еду.
Аргументы:
 - `table: table` - таблица из которой будет загружена еда.
 - `pack_name: str` - название контент-пака из которого была загружена таблица.

```lua
loader.load_drops(table: table, pack_name: str)
```

Загружает дропы.
Аргументы:
 - `table: table` - таблица из которой будут загружены дропы.
 - `pack_name: str` - название контент-пака из которого была загружена таблица.

```lua
loader.load_tools(table: table, pack_name: str)
```

Загружает инструменты.
Аргументы:
 - `table: table` - таблица из которой будут загружены инструменты.
 - `pack_name: str` - название контент-пака из которого была загружена таблица.

```lua
loader.load_loot_tables(table: table, pack_name: str)
```

Загружает лут-таблицы.
Аргументы:
 - `table: table` - таблица из которой будут загружены лут-таблицы.
 - `pack_name: str` - название контент-пака из которого была загружена таблица.

```lua
loader.load_file(filename: str, pack: str, loadfunc: str)
```

Загружает файл `filename` из контент-пака `pack` используя функцию `loadfunc`
(одну из приведённых выше).

```lua
loader.load_additional_data()
```

Загружает все кастомные свойства.

## loader_api

```lua
loader_api.get_fuel_by_block(str_id: str)
```

Возвращает топливо по предмету.

```lua
loader_api.get_hardness_by_block(str_id: str)
```

Возвращает твёрдость по блоку.

```lua
loader_api.get_drops_by_block(str_id: str)
```

Возвращает дропы по блоку.

```lua
loader_api.get_info_by_tool(str_id: str)
```

Возвращает информацию по инструменту.

```lua
loader_api.get_food_by_item(str_id: str)
```

Возвращает количество единиц сытости восстанавливаемые предметом.

```lua
loader_api.get_ores()
```

Возвращает все руды.
