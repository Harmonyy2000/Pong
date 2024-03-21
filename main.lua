require("player")
require("ball")
require("ai")
require("scoreboard")

function love.load()
    Player:load()
    Ball:load()
    AI:load()
    Scoreboard:load()
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    score()
    Scoreboard:update(dt)
end

function love.draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    Scoreboard:draw()
end

function insideBoundariesY(object)
    if object.y >= 0 and object.y <= object.bottomOfWindow then
        return true
    else
        return false
    end
end

function correctPosition(object)
    if object.y < 0 then
        object.y = 0
    elseif object.y > object.bottomOfWindow then
        object.y = object.bottomOfWindow
    end
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end

function score()
    if Ball.x >= 0 and Ball.x + Ball.width <= love.graphics.getWidth() then
        return
    elseif Ball.x < 0 then
        Scoreboard.aiScore = Scoreboard.aiScore + 1
    elseif Ball.x + Ball.width > love.graphics.getWidth() then
        Scoreboard.playerScore = Scoreboard.playerScore + 1
    end
    reset()
end

function reset()
    Player.y = Player.bottomOfWindow / 2
    AI.y = AI.bottomOfWindow / 2
    AI.velocityY = 0
    AI.timer = 0
    Ball.x = (love.graphics.getWidth() - Ball.width) / 2
    Ball.y = Ball.bottomOfWindow / 2
    Ball.velocityY = 0
end