## модуль `voxelcraft:compatibility/blocks`

### block_operations

```lua
block_operations.spawn_mini_block(item_id: int, item_count: int, pos: vec3)
```

Создаёт сущность дропа. 

Аргументы
 - `item_id: int`: id предмета для создания дропа
 - `item_count: int`: количество предметов в дропе
 - `pos: vec3`: позиции для спавна

```lua
block_operations.destroy_block(x: int, y: int, z: int)
```

Разрушает блок по заданным координатам.

```lua
block_operations.get_rotation_by_normal(normal: vec3)
```

Возвращает поворот по нормали.

```lua
block_operations.place_block(
    target_block_pos: vec3,
    normal: vec3,
    player_id: int
)
```

Аргументы:
 - `target_block_pos: vec3`: позиция блока на который будет установлен новый блок.
 - `normal: vec3`: сторона блока на который будет установлен новый блок (`normal` из результата рейкаста).
 - `player_id`: id игрока
