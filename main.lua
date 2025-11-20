require ("player")
require "rectangle"

function love.load()
    tick = require "assets.libraries.tick"
    Object = require "assets.libraries.classic"

    player:load()
end



function love.update(dt)
    player:update(dt)
end



function love.draw()
    player:draw()
end

