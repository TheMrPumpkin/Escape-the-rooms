player = {}
function player:load()
    coordinates = { "x", "y" }
    table.insert(coordinates, "z")


    player.x = 100
    player.y = 200
    player.width = 200
    player.height = 150
end

function player:update(dt)
    if love.keyboard.isDown("d") then
        player.x = player.x + 100 * dt
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - 100 * dt
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + 100 * dt
    end
    if love.keyboard.isDown("w") then
        player.y = player.y - 100 * dt
    end
end

function player:draw()

    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end
