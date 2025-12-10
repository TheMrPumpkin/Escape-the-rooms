player = {}
function player:load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    player.x = 400
    player.y = 200
    player.offsetY = 15 * 2
    player.spritesheet = love.graphics.newImage("assets/sprites/character.png")
    player.grid = anim8.newGrid(16, 32, player.spritesheet:getWidth(), player.spritesheet:getHeight())

    player.collider = world:newBSGRectangleCollider(400, 250 + player.offsetY, 16 * 4, 16 * 4, 14)
    player.collider:setFixedRotation(true)

    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 2), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 3), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 4), 0.2)
    player.animations.idle = anim8.newAnimation(player.grid('1-1', 1), 0.2)

    player.anim = player.animations.idle

    cam = camera()
end

function player:update(dt)
    local isMoving = false
    local vx = 0
    local vy = 0

    if love.keyboard.isDown("d") then
        vx = 100
        player.anim = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown("a") then
        vx = -100
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("s") then
        vy = 100
        player.anim = player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown("w") then
        vy = -100
        player.anim = player.animations.up
        isMoving = true
    end
    player.collider:setLinearVelocity(vx, vy)
    if isMoving == false then
        player.anim:gotoFrame(1)
    end
    player.anim:update(dt)

    cam:lookAt(player.x, player.y)

     local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    --Top left border
    if cam.x < w/2 then
        cam.x = w/2
    end
    -- Top border
    if cam.y < h/2 then
        cam.y = h/2
    end

    local mapW = map.width * map.tilewidth
    local mapH = map.height * map.tileheight

    -- Right border
    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end

    --Bottom border
    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end

    player.x = player.collider:getX()
    player.y = player.collider:getY() - player.offsetY
end

function player:draw()
    player.anim:draw(player.spritesheet, player.x, player.y, nil, 4, nil, 8, 11)
end
