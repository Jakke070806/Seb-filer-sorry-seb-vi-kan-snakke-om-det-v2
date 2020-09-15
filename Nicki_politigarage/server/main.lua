local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","Nicki_politigarage")

RegisterNetEvent('Nicki_politigarage:checkPermsRepair')
AddEventHandler('Nicki_politigarage:checkPermsRepair', function()
		local user_id = vRP.getUserId({source})
    
    if user_id then
        if vRP.hasPermission({user_id, "police.pc"}) then
            TriggerClientEvent('Nicki_politigarage:repairVehicle', source)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke adgang til politigaragen'}, 5000)
        	print("Person PRØVER bruger Nicki_politigarage (Repair)")
        end
      	
    end
end)

RegisterNetEvent('Nicki_politigarage:checkPermsWash')
AddEventHandler('Nicki_politigarage:checkPermsWash', function()
		local user_id = vRP.getUserId({source})
    
    if user_id then
        if vRP.hasPermission({user_id, "police.pc"}) then
            TriggerClientEvent('Nicki_politigarage:washVehicle', source)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke adgang til politigaragen'}, 5000)
			print("Person PRØVER bruger Nicki_politigarage (Wash)")
        end
    end
end)

RegisterNetEvent('Nicki_politigarage:checkPermsParking')
AddEventHandler('Nicki_politigarage:checkPermsParking', function()
		local user_id = vRP.getUserId({source})
    
    if user_id then
        if vRP.hasPermission({user_id, "police.pc"}) then
            TriggerClientEvent('Nicki_politigarage:ParkVeh', source)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke adgang til politigaragen'}, 5000)
			print("Person PRØVER bruger Nicki_politigarage (Parking)")
        end
    end
end)