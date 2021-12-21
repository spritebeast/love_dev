function love.load()
    window = {
        width = 800,
        height = 600,
        title = "gui_button"
    }
    love.window.setMode(window.width, window.height)
    love.window.setTitle(window.title)

    gameFont = love.graphics.newFont(32)

    require("buttons")
end

function love.update(dt)
end

function love.draw()
    buttons:draw()
end

function love.mousepressed(x, y, button, isTouch)
    if button == 1 then
        buttons:click()
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end