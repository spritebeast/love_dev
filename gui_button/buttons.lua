buttons = {}
buttons[1] = {
    window.width/2 - 180, -- bX
    window.height/2 - 36, -- bY
    360,                  -- bW
    72,                   -- bH
    "CLICK ME"            -- bText
}
buttons.message = ""

function buttons:draw()
    for _, b in ipairs(buttons) do
        
        local bX = b[1]
        local bY = b[2]
        local bW = b[3]
        local bH = b[4]
        local bText = b[5]

        -- Base effect
        love.graphics.setColor(255/255, 255/255, 255/255, 100/255)
        love.graphics.setLineWidth(6)
        love.graphics.rectangle("line", bX, bY, bW, bH)
        love.graphics.setFont(gameFont)
        love.graphics.printf(bText, bX, bY + 20, bW, "center")

        if buttons:mouseCheck(b) then
            -- Hover effect
            love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
            love.graphics.setLineWidth(6)
            love.graphics.rectangle("line", bX, bY, bW, bH)
            love.graphics.setFont(gameFont)
            love.graphics.printf(bText, bX, bY + 20, bW, "center")
        end
        
    end

    love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
    love.graphics.printf(buttons.message, 0, window.height - 64, window.width, "center")
end

function buttons:mouseCheck(b)
    local mX, mY = love.mouse.getPosition()

    local bX = b[1]
    local bY = b[2]
    local bW = b[3]
    local bH = b[4]

    if mX > bX and mX < bX + bW and mY > bY and mY < bY + bH then
        return true
    end
    return false
end

function buttons:click()
    for i, b in ipairs(self) do

        if buttons:mouseCheck(b) then

            if i == 1 then
                buttons.message = "clicked the button"
            end

        end

    end
end