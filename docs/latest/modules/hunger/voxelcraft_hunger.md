# VoxelcraftHungerSystem

Стандартная реализация системы сытости.

```lua
-- Конструктор
function VoxelcraftHungerSystem:init(player_id, hunger) end
-- Возвращает количество единиц сытости игрока
function VoxelcraftHungerSystem:get_hunger() end
-- Устанавливает количество единиц сытости игрока
function VoxelcraftHungerSystem:set_hunger(player_hunger) end
-- Уменьшает количество единиц сытости игрока
function VoxelcraftHungerSystem:remove_hunger(player_hunger) end
-- Возвращает количество энергии игрока (тратится при движении)
function VoxelcraftHungerSystem:get_power() end
-- Устанавливает количество энергии игрока
function VoxelcraftHungerSystem:set_power(power) end
-- Возвращает максимальное количество энергии
function VoxelcraftHungerSystem:get_max_power() end
-- Устанавливает максимальное количество энергии игрока
function VoxelcraftHungerSystem:set_max_power(max_power) end
-- Обновляет таймер
function VoxelcraftHungerSystem:reset_timer() end
-- Обновляет энергию
function VoxelcraftHungerSystem:update_power() end
-- Обновляет здоровье
function VoxelcraftHungerSystem:update_health() end
-- Обновляет систему
function VoxelcraftHungerSystem:update() end
-- Возвращает экземпляр класса сериализации 
function VoxelcraftHungerSystem:get_serializer() end
-- Устанавливает экземпляр класса сериализации 
function VoxelcraftHungerSystem:set_serializer(serializer) end
```

