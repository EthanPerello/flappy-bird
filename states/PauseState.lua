PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.score = params.score
    self.bird = params.bird
    self.pipePairs = params.pipePairs
    self.timer = params.timer
end

function PauseState:update(dt)
    -- pause music
    sounds['music']:pause()
    
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        -- play music
        sounds['music']:play()
        
        gStateMachine:change('play', {bird = self.bird,
        pipePairs = self.pipePairs,
        timer = self.timer,
        score = self.score})
    end
end

function PauseState:render()
    -- display pause icon
    image = love.graphics.newImage('pause.png')
    love.graphics.draw(image, VIRTUAL_WIDTH/2 - (image:getWidth()/2), VIRTUAL_HEIGHT/2 - (image:getHeight()/2))
    love.graphics.printf('Press enter to continue', 0, 64, VIRTUAL_WIDTH, 'center')
end