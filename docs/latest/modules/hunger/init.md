# hunger

```lua
hunger.hunger_system
```

Экземпляр класса `HungerSystem`.

```lua
hunger.hunger_storage
```

Экземпляр класса `PlayerDataStore` хранящий экземпляры системы сытости.

```lua
hunger.hunger_saver
```

Экземпляр класса `PlayerDataStoreSaver` сохраняющий `hunger.hunger_storage`.

## Класс HungerSystem

```lua
function HungerSystem:register_system(hunger_system)
```

Устанавливает текущую систему сытости.

```lua
function HungerSystem:get_system()
```

Возвращает текущую систему сытости.

