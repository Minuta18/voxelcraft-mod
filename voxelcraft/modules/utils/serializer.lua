require "voxelcraft:utils/storage"
require "voxelcraft:logger/logger"

ISerializable = create_class()

function ISerializable:serialize(inst) end
function ISerializable:deserialize(inst) end
