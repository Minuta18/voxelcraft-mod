## Модуль `voxelcraft:logger/logger`

Логгер voxelcraft. В логах также печатается время и место вывода.

```lua
logger.debug(message: str)
```

Выводит сообщение на уровне `DEBUG`.

```lua
logger.info(message: str)
```

Выводит сообщение на уровне `INFO`.

```lua
logger.warning(message: str)
```

Выводит сообщение на уровне `WARNING`.

```lua
logger.error(message: str)
```

Выводит сообщение на уровне `ERROR`.

```lua
logger.set_log_level(log_level: str)
```

Устанавливает уровень логирования на `log_level`. Принимает значения только 
`INFO`, `DEBUG`, `WARNING`, `ERROR`.

```lua
logger.get_log_level() -> str
```

Возвращает текущий уровень логирования.
