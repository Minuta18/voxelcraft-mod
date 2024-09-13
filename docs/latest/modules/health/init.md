# health

```lua
health.health_system
```

Экземпляр класса `HealthSystem`.

```lua
health.health_storage
```

Экземпляр класса `PlayerDataStore` хранящий экземпляры системы здоровья.

```lua
health.health_saver
```

Экземпляр класса `PlayerDataStoreSaver` сохраняющий `health.health_storage`.

## Класс HealthSystem

```lua
function HealthSystem:register_system(health_system)
```

Устанавливает текущую систему здоровья.

```lua
function HealthSystem:get_system()
```

Возвращает текущую систему здоровья.

