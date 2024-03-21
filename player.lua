Player = {}

function Player:load()
    self.name = "Player"
    self.width = 20
    self.height = 100
    self.bottomOfWindow = love.graphics.getHeight() - self.height
    self.x = 50
    self.y = self.bottomOfWindow / 2
    self.speed = 500
end

function Player:update(dt)
    self:move(dt)
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
    if love.keyboard.isDown("w") and insideBoundariesY(self) then
        self.y = self.y - self.speed * dt
    end
    if love.keyboard.isDown("s") and insideBoundariesY(self) then
        self.y = self.y + self.speed * dt
    end
    if insideBoundariesY(self) == false then
        correctPosition(self)
    end
end
