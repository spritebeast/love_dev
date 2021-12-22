function love.load()
    window = {
        width = 800,
        height = 600,
        title = "scaler"
    }
    love.window.setMode(window.width, window.height)
    love.window.setTitle(window.title)
    love.graphics.setDefaultFilter("nearest", "nearest")

    bg = {}
    bg.img = love.graphics.newImage("grass32.png")
    background = {}

    player = {}
    player.img = love.graphics.newImage("spritebeast32.png")
    player.x = window.width/2
    player.y = window.height/2

end

function love.update(dt)
end

function love.draw()
    for y = #background, window.height, 96 do
        for x = #background, window.width, 96 do
            love.graphics.draw(bg.img, x, y, nil, 3, 3)
        end
    end

    love.graphics.draw(player.img, player.x, player.y, nil, player.size, player.size, player.img:getWidth()/2, player.img:getHeight()/2)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end