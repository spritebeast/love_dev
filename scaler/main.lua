function love.load()
    math.randomseed(os.time())

    window = {
        width = 800,
        height = 600,
        title = "scaler"
    }
    love.window.setMode(window.width, window.height)
    love.window.setTitle(window.title)
    love.graphics.setDefaultFilter("nearest", "nearest")

    game_font = love.graphics.newFont("retro_computer.ttf", 18)

    bg = {}
    bg.img = love.graphics.newImage("grass32.png")
    background = {}

    player = {}
    player.img = love.graphics.newImage("spritebeast32.png")
    player.x = window.width/2
    player.y = window.height/2
    player.size = player.img:getWidth()
    player.dir = 1
    player.scale = 2
    player.speed = 4
    player.score = 0

    apples = {}
    apple = {}
    apple.img = love.graphics.newImage("apple32.png")

    StartGame()
end

function love.update(dt)
    if love.keyboard.isDown("left") and player.x > (player.scale * player.img:getWidth()) / 2 then
        player.x = player.x - player.speed
        player.dir = -1
    end
    if love.keyboard.isDown("right") and player.x < window.width - (player.scale * player.img:getWidth()) / 2 then
        player.x = player.x + player.speed
        player.dir = 1
    end
    if love.keyboard.isDown("up") and player.y > (player.scale * player.img:getHeight()) / 2 then
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("down") and player.y < window.height - (player.scale * player.img:getHeight()) / 2 then
        player.y = player.y + player.speed
    end

    for i, a in ipairs(apples) do
        if CheckCollision(player, a) then
            table.remove(apples, i)
            player.scale = player.scale * 1.05
            player.score = player.score + 1
        end
    end
end

function love.draw()
    for y = #background, window.height, 96 do
        for x = #background, window.width, 96 do
            love.graphics.draw(bg.img, x, y, nil, 3, 3)
        end
    end

    for _, a in ipairs(apples) do
        love.graphics.draw(apple.img, a.x, a.y, nil, 1, 1, apple.img:getWidth()/2, apple.img:getHeight()/2)
    end

    love.graphics.draw(player.img, player.x, player.y, nil, player.scale * player.dir, player.scale, player.img:getWidth()/2, player.img:getHeight()/2)

    love.graphics.setFont(game_font)
    love.graphics.print("SCORE: " .. player.score, 18, 18)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    if key == "r" then
        StartGame()
    end
end

function SpawnApple()
    local a = {}
    a.x = math.random(apple.img:getWidth(), window.width - apple.img:getWidth())
    a.y = math.random(apple.img:getHeight(), window.height - apple.img:getHeight())
    a.size = apple.img:getWidth()
    table.insert(apples, a)
end

function StartGame()
    player.scale = 2
    player.score = 0
    for a in ipairs(apples) do
        apples[a] = nil
    end
    for i = 0, 9 do
        SpawnApple()
    end
end

function CheckCollision(obj1, obj2)
    local distance = math.sqrt((obj1.x - obj2.x)^2 + (obj1.y - obj2.y)^2)
    return distance < obj1.size + obj2.size
end