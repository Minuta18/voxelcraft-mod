# VoxelcraftHealthSystem

Стандартная реализация системы здоровья.

```lua
-- Конструктор
function VoxelcraftHealthSystem:init(entity_id, max_health, player_health) end
-- Возвращает количество здоровья игрока
function VoxelcraftHealthSystem:get_health() end
-- Устанавливает здоровье игроку
function VoxelcraftHealthSystem:set_health(health) end
-- Прибавляет здоровье игроку
function VoxelcraftHealthSystem:add_health(health) end
-- Дамажит игрока. Не воспроизводит анимацию
function VoxelcraftHealthSystem:remove_health(health) end
-- Возвращает максимальное здоровье
function VoxelcraftHealthSystem:get_max_health() end
-- Устанавливает максимальное здоровье игрока
function VoxelcraftHealthSystem:set_max_health(max_health) end
-- Возвращает id сущности к которой привязан класс
function VoxelcraftHealthSystem:get_eid() end
-- Устанавливает id сущности к которой привязан класс
function VoxelcraftHealthSystem:set_eid(eid) end
-- Проигрывает анимацию получения урона
function VoxelcraftHealthSystem:play_damage_animation(animation_length) end
-- Играет ли анимация?
function VoxelcraftHealthSystem:does_animation_plays() end
-- Проигрывает звук получения урона
function VoxelcraftHealthSystem:play_damage_sound() end
-- Обновляет систему
function VoxelcraftHealthSystem:update() end
-- Дамажит игрока. Проигрывает анимацию и воспроизводит звук
function VoxelcraftHealthSystem:damage(health) end
-- Возвращает экземпляр класса сериализации 
function VoxelcraftHealthSystem:get_serializer() end
-- Устанавливает экземпляр класса сериализации
function VoxelcraftHealthSystem:set_serializer(serializer) end
```