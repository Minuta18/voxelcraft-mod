# BasePlayerPhysicalController

Базовый класс обеспечивающий взаимодействие игрока и мира.

```lua
-- Возвращает включён ли урон от падения
function BasePlayerPhysicalController:is_fall_damage_enabled() end
-- Включает/выключает урон от падения
function BasePlayerPhysicalController:set_fall_damage_enabled() end
-- Выбрасывает инвентарь
function BasePlayerPhysicalController:drop_inventory() end
-- Дамажит при падении 
function BasePlayerPhysicalController:apply_fall_damage() end
-- Возвращает мёртв ли игрок
function BasePlayerPhysicalController:is_dead() end
-- Убивает игрока
function BasePlayerPhysicalController:kill() end
-- Возрождает игрока
function BasePlayerPhysicalController:respawn() end
-- Ищет координату y спавна
function BasePlayerPhysicalController:choose_spawnpoint(x, z) end
-- Телепортирует игрока на спавн
function BasePlayerPhysicalController:teleport_to_spawnpoint() end
-- Устанавливает максимальную скорость
function BasePlayerPhysicalController:set_max_speed(speed) end
-- Возвращает максимальную скорость
function BasePlayerPhysicalController:get_max_speed() end
-- Устанавливает максимальную скорость, если игрок голодает
function BasePlayerPhysicalController:set_max_hunger_speed(speed) end
-- Возвращает максимальную скорость, если игрок голодает
function BasePlayerPhysicalController:get_max_hunger_speed() end
-- Обновляет систему
function BasePlayerPhysicalController:update() end
-- Обновляет систему каждый кадр
function BasePlayerPhysicalController:render_update() end
```