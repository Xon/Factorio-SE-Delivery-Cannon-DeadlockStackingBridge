local data_util = require("__space-exploration__.data_util")

recipies = {}
local old_recipes = se_delivery_cannon_recipes
for name, recipe in pairs(se_delivery_cannon_recipes) do
    local stackedName = "deadlock-stack-"..name
    if data.raw["item"][stackedName] and not se_delivery_cannon_recipes[stackedName] then
        recipies[stackedName] = {name = stackedName}
        log("Adding SE delivery cannon recipe for "..stackedName)
    end
end

local old_ammo_recipes = se_delivery_cannon_ammo_recipes
se_delivery_cannon_ammo_recipes = {}
se_delivery_cannon_recipes = recipies
require("__space-exploration__/prototypes/phase-3/delivery-cannon.lua")
-- restore old recipie list and add the ones which have been touched
se_delivery_cannon_recipes = old_recipes
se_delivery_cannon_ammo_recipes = old_ammo_recipes
for name, recipe in pairs(recipies) do
    if not se_delivery_cannon_recipes[name] then
        se_delivery_cannon_recipes[name] = recipe
    end
end