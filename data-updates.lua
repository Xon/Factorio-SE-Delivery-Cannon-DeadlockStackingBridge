local data_util = require("__space-exploration__.data_util")

recipies = {}
-- find plates
for name, item in pairs(data.raw["item"]) do
    if string.find(name, "plate", 1, true) and not string.find(name, "textplate", 1, true) then
        if not se_delivery_cannon_recipes[name] then
            recipies[name] = {name = name}
        end
    end
end
-- find existing stacked recipies if they exist
for name, recipe in pairs(se_delivery_cannon_recipes) do
    local stackedName = "deadlock-stack-"..name
    if not se_delivery_cannon_recipes[stackedName] then
        if data.raw["item"][stackedName] then
            recipies[stackedName] = {name = stackedName} 
        end
    end
end
-- append to the delivery cannon recipies once
for name, recipe in pairs(recipies) do
    if not se_delivery_cannon_recipes[name] then
        se_delivery_cannon_recipes[name] = recipe
        log("Adding SE delivery cannon recipe for "..name)
    end
end