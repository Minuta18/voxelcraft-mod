## Модуль `voxelcraft:crafting/init`

### crafting

```lua
crafting.add_craft(check_function: function, craft_type: str)
```

Добавляет новый крафт. Крафт определяется значениями `check_function` - 
функцией проверки (см. ниже) и `craft_type` - название крафтера используемого 
для крафта. 

```lua
crafting.add_crafting_table_craft(table: table, result: table, craft_type: str)
```

Аргументы:
 - `table`: таблица из 9 элементов, где каждый элемент - строковый id предмета.
 - `result`: таблица из 2 элементов: предмет получившийся в результате крафта и его количество.
 - `craft_type`: название крафтера используемого для крафта.

Пример:

```lua
crafting.add_crafting_table_craft({
    "base:planks.item", "base:planks.item", "base:planks.item",
    "core:empty", "voxelcraft:stick", "core:empty",
    "core:empty", "voxelcraft:stick", "core:empty",
}, {"voxelcraft:wooden_pickaxe", 1}, "voxelcraft:crafting_table")
```

```lua
crafting.crafting.add_crafting_table_inventory_craft(table: table, result: table, craft_type: str)
```

Аналогичен `add_crafting_table_craft`, но для сетки крафта в инвентаре игрока.

```lua
crafting.check_craft(slot_list, crafter_type)
```

Проверяет крафт.

Аргументы:
 - `slot_list`: список слотов сетки крафта крафтера. Каждый элемент списка - массив из двух знаечний: строковый id предмета и его количество. 
 - `craft_type`: название крафтера используемого для крафта.

> ![IMPORTANT]
> На данный момент все значения количества элемента равны 1. Это будет исправлено в будущих версиях.

### Класс Furnace

```lua
local furnace = Furnace(
    fur_uid: int,
    max_progress: int,
    on_change_callback: function,
    reset_checker: function,
    on_fuel_end_callback: function,
    on_end_callback: function,
)
```

Инициализирует печку.

Аргументы:
 - `fur_uid: int`: уникальный идентификатор печки.
 - `max_progress: int`: длительность готовки печки в тиках.
 - `on_change_callback: function`: функция вызываемая в случае остановки ил продолжения готовки. `fur_uid: int` и `action: "started"|"stopped"` передаются в качестве аргументов.
 - `reset_checker: function`: функция, вызываемая каждый тик. Если возвращает `true`, то печь приостанавливает готовку. В противном случае функция должна вернуть `false`. `fur_uid` и `craft_result` (результат крафта, см. ниже) передаются в качестве аргументов.
 - `on_fuel_end_callback: function`: функция вызываемая в случае нехватки топлива. `fur_uid` передаётся в качестве аргумента. 
 - `on_end_callback: function`: Функция вызываемая после конца готовки. `fur_uid` и `craft_result` (результат крафта, см. ниже) передаются в качестве аргументов.

```lua
Furnace:get_fuel()
```

Возвращает количество топлива, хранящегося в печке.

```lua
Furnace:set_fuel(fuel: int)
```

Устанавливает количество топлива в печке.

```lua
Furnace:add_fuel(fuel: int)
```

Прибавляет топливо к уже имеющемуся в печке.

```lua
Furnace:get_progress()
```

Возвращает количество тиков до конца готовки.

```lua
Furnace:set_progress(progress: int)
```

Устанавливает количество тиков до конца готовки.

```lua
Furnace:start_bake(craft_result: table)
```

Начинает готовку.

Аргументы:
 - `craft_result: table` - таблица из 2 элементов, где первый элемент - предмет получаемый в результате крафта, а второй - его количество.

```lua
Furnace:end_bake()
```

Завершает готовку.

```lua
Furnace:update()
```

Обновляет печку.

### furnaces

```lua
furnaces.Furnace
```

класс Furnace.

```lua
furnaces.FurnaceStorage
```

Хранилище для всех печек.

```lua
furnaces.FurnaceStorage.get(fid: int)
```

Возвращает печку из хранилища по уникальному идентификатору.

```lua
furnaces.FurnaceStorage.set(fid: int, furnace: Furnace)
```

Устанавливает печку по уникальному идентификатору.

```lua
furnaces.FurnaceStorage.update_all()
```

Обновляет все печки в хранилище.
