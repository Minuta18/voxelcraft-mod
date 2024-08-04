---@diagnostic disable-next-line: lowercase-global
logger = {}

local log_level = "DEBUG";

logger.debug = function (message)
    if log_level == "DEBUG" then
        print("[DEBUG] " .. message)
    end
end

logger.info = function (message)
    if log_level == "DEBUG" or log_level == "INFO" then
        print("[INFO] " .. message)
    end
end

logger.warning = function (message)
    if log_level ~= "ERROR" 
    then
        print("[WARNING] " .. message)
    end
end

logger.error = function (message)
    print("[ERROR] " .. message)
end

logger.set_log_level = function (log_level)
    if log_level ~= "DEBUG" and log_level ~= "INFO" and log_level ~= "WARNING"
        and log_level ~= "ERROR" then
        this.error("Unknown log level. Use one of the following: DEBUG, " ..
            "INFO, WARNING, ERROR."
        );
    end
end

logger.get_log_level = function ()
    return log_level
end
