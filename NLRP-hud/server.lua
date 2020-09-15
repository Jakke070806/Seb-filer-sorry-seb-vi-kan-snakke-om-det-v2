local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent("wis:dataUI")
AddEventHandler("wis:dataUI", function ()
    local user_id = vRP.getUserId({source})
    TriggerClientEvent("wis_givData",source,vRP.getHunger({user_id}),vRP.getThirst({user_id}))
end)
