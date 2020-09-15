function LocalPed()
    return GetPlayerPed(-1)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
      if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 456.06045532227,-1024.2301025391,28.448951721191, true ) < 2 then
    --  DrawMarker(27, 420.36343383789,-1013.671875,29.116374969482-0.97,0,0,0,0,0,0,1.001,1.0001,0.5001,102,204,0,200,0,0,0,true)
      DrawMarker(27, 456.06045532227,-1024.2301025391,28.448951721191-0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 50, 50, 204, 100, false, true, 2, nil, nil, false)
        DrawText3Ds(456.06045532227,-1024.2301025391,28.448951721191, "~g~E  ~s~=  Reperaer køretøj", 3.0, 7)
        if IsControlJustPressed(1, 38) then
            TriggerServerEvent('Nicki_politigarage:checkPermsRepair')
          end
        end
    end
end)

RegisterNetEvent('Nicki_politigarage:repairVehicle')
AddEventHandler('Nicki_politigarage:repairVehicle', function()
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        vehicle = GetVehiclePedIsIn(LocalPed())
        exports['progressBars']:startUI(3000, "Reperaer Køretøj...")
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(3000)
        SetEntityAsMissionEntity(vehicle, true, true)
        SetVehicleBodyHealth(vehicle, 9999)
        SetVehicleFixed(vehicle)
        FreezeEntityPosition(vehicle, false)
        exports['mythic_notify']:SendAlert('inform', 'Dit køretøj blev reperaret.')
    else
        exports['mythic_notify']:SendAlert('error', 'Du sidder ikke i et køretøj')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 456.06045532227,-1024.2301025391,28.448951721191, true ) < 2 then
                --  DrawMarker(27, 420.36343383789,-1013.671875,29.116374969482-0.97,0,0,0,0,0,0,1.001,1.0001,0.5001,102,204,0,200,0,0,0,true)
                --  DrawMarker(27, 456.06045532227,-1024.2301025391,28.448951721191-0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 50, 50, 204, 100, false, true, 2, nil, nil, false)
          DrawText3Ds(456.06045532227,-1024.2301025391,28.448951721191-0.099, "~g~G  ~s~=  Vask køretøj ", 3.0, 7)
          if IsControlJustPressed(1, 113) then
                TriggerServerEvent('Nicki_politigarage:checkPermsWash')
          end
        end
    end
end)

RegisterNetEvent('Nicki_politigarage:washVehicle')
AddEventHandler('Nicki_politigarage:washVehicle', function()
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
      vehicle = GetVehiclePedIsIn(LocalPed())
      exports['progressBars']:startUI(3000, "Vasker Køretøj...")
      FreezeEntityPosition(vehicle, true)
      Citizen.Wait(3000)
      SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false), 0.0)
      SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1),false), false)
      exports['mythic_notify']:SendAlert('inform', 'Dit køretøj blev vasket.')
      FreezeEntityPosition(vehicle, false)
    else
      exports['mythic_notify']:SendAlert('error', 'Du er ikke i et køretøj.')
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)
      if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 462.62188720703,-1019.3157958984,28.102821350098, true ) < 2 then
  --    DrawMarker(27, 420.36343383789,-1013.671875,29.116374969482-0.97,0,0,0,0,0,0,1.001,1.0001,0.5001,102,204,0,200,0,0,0,true)
        DrawMarker(20, 462.62188720703,-1019.3157958984,28.102821350098-0.05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 50, 50, 204, 100, false, true, 2, nil, nil, false)
        DrawText3Ds(462.62188720703,-1019.3157958984,28.102821350098+0.25, "~g~E  ~s~=  Parker køretøj ", 3.0, 7)
        local vehicleCoords = GetEntityCoords(vehicle)
        local playerCoords = GetEntityCoords(LocalPed())
        local vehicle = GetVehiclePedIsIn(LocalPed())
        if IsControlJustPressed(1, 38) then
            TriggerServerEvent('Nicki_politigarage:checkPermsParking') 
            end
        end
    end
end)

RegisterNetEvent('Nicki_politigarage:ParkVeh')
AddEventHandler('Nicki_politigarage:ParkVeh', function()
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
      vehicle = GetVehiclePedIsIn(LocalPed())
      SetEntityAsMissionEntity(vehicle, true,true)
      DeleteVehicle(vehicle, false)
      exports['mythic_notify']:SendAlert('success', 'Du har parkeret dit køretøj', 2500)
    else
      exports['mythic_notify']:SendAlert('error', 'Du er ikke i et køretøj', 2500)
    end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0*scale, 0.35*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
            end
        end