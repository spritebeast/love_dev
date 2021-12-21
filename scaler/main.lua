function love.load()
    window = {
        width = 800,
        height = 600,
        title = "scaler"
    }
    love.window.setMode(window.width, window.height)
    love.window.setTitle(window.title)
    love.graphics.setDefaultFilter("nearest", "nearest")
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end