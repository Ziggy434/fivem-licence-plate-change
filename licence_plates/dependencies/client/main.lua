function Notify(msg, options)
    SendNUIMessage {
        action = "notification",
        message = msg,
        options = options
    }
end
exports("Notify", Notify)

RegisterNetEvent("noticeme:Notify")
AddEventHandler("noticeme:Notify", function(msg_options)
    if type(msg_options) == "string" then
        Notify(msg_options, {})
    elseif type(msg_options) == "table" then
        Notify(msg_options.text, msg_options)
    end
end)

function Info(msg)
    SendNUIMessage {
        action = "notification",
        message = msg,
        options = {
            type = "info",
            timeout = 2000,
            audio = true,
        }
    }
end
exports("Info", Info)

RegisterNetEvent("noticeme:Info")
AddEventHandler("noticeme:Info", function(msg)
    Info(msg)
end)

function Warn(msg)
    SendNUIMessage {
        action = "notification",
        message = msg,
        options = {
            type = "warn",
            timeout = 2500,
            audio = true,
        }
    }
end
exports("Warn", Warn)

RegisterNetEvent("noticeme:Warn")
AddEventHandler("noticeme:Warn", function(msg)
    Warn(msg)
end)

function Error(msg)
    SendNUIMessage {
        action = "notification",
        message = msg,
        options = {
            type = "error",
            timeout = 3000,
            audio = true,
        }
    }
end
exports("Error", Error)

RegisterNetEvent("noticeme:Error")
AddEventHandler("noticeme:Error", function(msg)
    Error(msg)
end)