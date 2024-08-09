## Модуль `voxelcraft:gamemode/gamemode`

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
