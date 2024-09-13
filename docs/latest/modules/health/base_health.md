# BaseHealthSystem

Абстрактный класс системы здоровья.

```lua
-- Возвращает количество здоровья игрока
function BaseHealthSystem:get_health() end
-- Устанавливает здоровье игроку
function BaseHealthSystem:set_health(health) end
-- Прибавляет здоровье игроку
function BaseHealthSystem:add_health(health) end
-- Дамажит игрока. Не воспроизводит анимацию
function BaseHealthSystem:remove_health(health) end
-- Возвращает максимальное здоровье
function BaseHealthSystem:get_max_health() end
-- Устанавливает максимальное здоровье игрока
function BaseHealthSystem:set_max_health(max_health) end
-- Возвращает id сущности к которой привязан класс
function BaseHealthSystem:get_eid() end
-- Устанавливает id сущности к которой привязан класс
function BaseHealthSystem:set_eid() end
-- Проигрывает анимацию получения урона
function BaseHealthSystem:play_damage_animation() end
-- Играет ли анимация?
function BaseHealthSystem:does_animation_plays() end
-- Проигрывает звук получения урона
function BaseHealthSystem:play_damage_sound() end
-- Дамажит игрока. Проигрывает анимацию и воспроизводит звук
function BaseHealthSystem:damage(health) end
-- Возвращает экземпляр класса сериализации 
function BaseHealthSystem:get_serializer() end
-- Устанавливает экземпляр класса сериализации
function BaseHealthSystem:set_serializer(serializer) end
```