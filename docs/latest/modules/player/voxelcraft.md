# VoxelcraftPlayerPhysicalController

Стандартная реализация.

```lua
-- конструктор
function VoxelcraftPlayerPhysicalController:init(player_id)
-- Возвращает включён ли урон от падения
function VoxelcraftPlayerPhysicalController:is_fall_damage_enabled() end
-- Включает/выключает урон от падения
function VoxelcraftPlayerPhysicalController:set_fall_damage_enabled() end
-- Выбрасывает инвентарь
function VoxelcraftPlayerPhysicalController:drop_inventory() end
-- Дамажит при падении 
function VoxelcraftPlayerPhysicalController:apply_fall_damage() end
-- Возвращает мёртв ли игрок
function VoxelcraftPlayerPhysicalController:is_dead() end
-- Убивает игрока
function VoxelcraftPlayerPhysicalController:kill() end
-- Возрождает игрока
function VoxelcraftPlayerPhysicalController:respawn() end
-- Ищет координату y спавна
function VoxelcraftPlayerPhysicalController:choose_spawnpoint(x, z) end
-- Телепортирует игрока на спавн
function VoxelcraftPlayerPhysicalController:teleport_to_spawnpoint() end
-- Устанавливает максимальную скорость
function VoxelcraftPlayerPhysicalController:set_max_speed(speed) end
-- Возвращает максимальную скорость
function VoxelcraftPlayerPhysicalController:get_max_speed() end
-- Устанавливает максимальную скорость, если игрок голодает
function VoxelcraftPlayerPhysicalController:set_max_hunger_speed(speed) end
-- Возвращает максимальную скорость, если игрок голодает
function VoxelcraftPlayerPhysicalController:get_max_hunger_speed() end
-- Обновляет систему
function VoxelcraftPlayerPhysicalController:update() end
-- Обновляет систему каждый кадр
function VoxelcraftPlayerPhysicalController:render_update() end
```
