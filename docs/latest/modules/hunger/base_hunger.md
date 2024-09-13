# BaseHungerSystem

Абстрактный класс системы сытости.

```lua
-- Конструктор
function BaseHungerSystem:init(health_system) end
-- Возвращает количество единиц сытости игрока
function BaseHungerSystem:get_hunger() end
-- Устанавливает количество единиц сытости игрока
function BaseHungerSystem:set_hunger(hunger) end
-- Возвращает количество энергии игрока (тратится при движении)
function BaseHungerSystem:get_power() end
-- Устанавливает количество энергии игрока
function BaseHungerSystem:set_power(power) end
-- Возвращает максимальное количество энергии
function BaseHungerSystem:get_max_power() end
-- Устанавливает максимальное количество энергии игрока
function BaseHungerSystem:set_max_power(power) end
-- Обновляет энергию
function BaseHungerSystem:update_power() end
-- Обновляет систему
function BaseHungerSystem:update() end
-- Возвращает экземпляр класса сериализации 
function BaseHungerSystem:get_serializer() end
-- Устанавливает экземпляр класса сериализации 
function BaseHungerSystem:set_serializer(serializer) end
```