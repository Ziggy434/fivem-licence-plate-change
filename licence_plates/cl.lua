RegisterCommand('setplate', function(source, args)
local newPlateText = args[1]
local playervehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if IsPedInVehicle(GetPlayerPed(-1), playervehicle, false) then
        SetVehicleNumberPlateText(playervehicle, newPlateText)
        TriggerEvent("noticeme:Notify", "Your licence plate has been changed to: " .. newPlateText)
    else
        TriggerEvent("noticeme:Error", "You must be in a vehicle to use that command!")
    end
end)

TriggerEvent('chat:addSuggestion', '/setplate', 'Set Your Current Vehicles Licence Plate', {
    { name='LicencePlateText', help='What you want the new text to be. Do not use spaces'}
})