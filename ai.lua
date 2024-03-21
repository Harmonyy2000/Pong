AI = {}

function AI:load()
    self.name = "AI"
    self.width = 20
    self.height = 100
    self.bottomOfWindow = love.graphics.getHeight() - self.height
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = self.bottomOfWindow / 2
    self.velocityY = 0
    self.speed = 500
    self.timer = 0
    self.rate = 0.5
end

function AI:update(dt)
    self:move(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = self.timer - self.rate
        self:findBall()
    end
end

function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function AI:move(dt)
    self.y = self.y + self.velocityY * dt
    if insideBoundariesY(self) == false then
        correctPosition(self)
    end
end

function AI:findBall()
    if Ball.y + Ball.height < self.y then
        self.velocityY = -self.speed
    elseif Ball.y > self.y + self.height then
        self.velocityY = self.speed
    else
        self.velocityY = 0
    end
end