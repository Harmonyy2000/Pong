Scoreboard = {}

function Scoreboard:load()
    self.playerScore = 0
    playerText = love.graphics.newText(love.graphics.newFont(30), self.playerScore)
    self.aiScore = 0
    aiText = love.graphics.newText(love.graphics.newFont(30), self.aiScore)
end

function Scoreboard:update(dt)
    playerText:set(self.playerScore)
    aiText:set(self.aiScore)
end

function Scoreboard:draw()
    love.graphics.draw(playerText, love.graphics.getWidth() / 2 - 50, (love.graphics.getHeight() - playerText:getHeight()) / 2, 0, 1, 1, playerText:getWidth() / 2, 0)
    love.graphics.draw(aiText, love.graphics.getWidth() / 2 + 50, (love.graphics.getHeight() - aiText:getHeight()) / 2, 0, 1, 1, aiText:getWidth() / 2, 0)
end