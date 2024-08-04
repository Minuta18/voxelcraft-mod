local log_level = "DEBUG";
this = {}

this.debug = function (message)
    if log_level == "DEBUG" then
        print("[DEBUG] " .. message)
    end
end

this.info = function (message)
    if log_level == "DEBUG" or log_level == "INFO" then
        print("[INFO] " .. message)
    end
end

this.warning = function (message)
    if log_level ~= "ERROR" 
    then
        print("[WARNING] " .. message)
    end
end

this.error = function (message)
    print("[ERROR] " .. message)
end

this.set_log_level = function (log_level)
    if log_level ~= "DEBUG" and log_level ~= "INFO" and log_level ~= "WARNING"
        and log_level ~= "ERROR" then
        this.error("Unknown log level. Use one of the following: DEBUG, " ..
            "INFO, WARNING, ERROR."
        );
    end
end

this.get_log_level = function ()
    return log_level
end

---@diagnostic disable-next-line: lowercase-global
logger = this
