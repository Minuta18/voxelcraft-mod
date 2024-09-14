---@diagnostic disable-next-line: lowercase-global
logger = {}

local log_level = "DEBUG";

logger.debug = function (message)
    if log_level == "DEBUG" then
        print(string.format(
            "[DEBUG]\t%s\t%s\t%s",
            os.date("%X"),
            debug.getinfo(2).source,
            message
        ))
    end
end

logger.info = function (message)
    if log_level == "DEBUG" or log_level == "INFO" then
        print(string.format(
            "[INFO]\t%s\t%s\t%s",
            os.date("%X"),
            debug.getinfo(2).source,
            message
        ))
    end
end

logger.warning = function (message)
    if log_level ~= "ERROR" 
    then
        print(string.format(
            "[WARNING]\t%s\t%s\t%s",
            os.date("%X"),
            debug.getinfo(2).source,
            message
        ))
    end
end

logger.error = function (message)
    print(string.format(
        "[ERROR]\t%s\t%s\t%s",
        os.date("%X"),
        debug.getinfo(2).source,
        message
    ))
end

logger.set_log_level = function (log_level)
    if log_level ~= "DEBUG" and log_level ~= "INFO" and log_level ~= "WARNING"
        and log_level ~= "ERROR" then
        logger.error("Unknown log level. Use one of the following: DEBUG, " ..
            "INFO, WARNING, ERROR."
        );
    end
end

logger.get_log_level = function ()
    return log_level
end
