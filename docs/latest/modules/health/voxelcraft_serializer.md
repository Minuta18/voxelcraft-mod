# VoxelcraftSerializer

Класс сериализации `VoxelcraftHealthSystem`.

```lua
-- Сериализует экземпляр VoxelcraftHealthSystem. Возвращает таблицу
function VoxelcraftHealthSerializer:serialize(inst) end
-- Десериализует таблицу. Возвращает экземпляр VoxelcraftHealthSystem
function VoxelcraftHealthSerializer:deserialize(serialized_inst) end
```