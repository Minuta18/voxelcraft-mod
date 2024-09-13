# VoxelcraftSerializer

Класс сериализации `VoxelcraftHungerSystem`.

```lua
-- Сериализует экземпляр VoxelcraftHungerSystem. Возвращает таблицу
function VoxelcraftHealthSerializer:serialize(inst) end
-- Десериализует таблицу. Возвращает экземпляр VoxelcraftHungerSystem
function VoxelcraftHealthSerializer:deserialize(serialized_inst) end
```