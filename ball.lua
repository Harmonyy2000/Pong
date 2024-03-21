Ball = {}

function Ball:load()
    self.width = 20
    self.height = 20
    self.bottomOfWindow = love.graphics.getHeight() - self.height
    self.x = (love.graphics.getWidth() - self.width) / 2
    self.y = self.bottomOfWindow / 2
    self.speed = 250
    self.velocityX = -self.speed
    self.velocityY = 0
end

function Ball:update(dt)
    self:move(dt)
    if checkCollision(self, Player) then
        self:collide(Player)
    end
    if checkCollision(self, AI) then
        self:collide(AI)
    end
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:move(dt)
    self.x = self.x + self.velocityX * dt
    self.y = self.y + self.velocityY * dt
    if insideBoundariesY(self) == false then
        self.velocityY = -self.velocityY
    end
end

function Ball:collide(object)
    if object.name == "Player" then
        self.velocityX = self.speed * 1.5
    elseif object.name == "AI" then
        self.velocityX = -self.speed * 1.5
    end
    local middleOfBall = self.y + self.height / 2
    local middleOfObject = object.y + object.height / 2
    self.velocityY = (middleOfBall - middleOfObject) * 5
end