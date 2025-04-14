lg = love.graphics
w = lg.getWidth()
h = lg.getHeight()
distance = 0
test = {a=100, b=100}
scale = test[1]

sun = {
	x=0,
	y=0,
	radius=10,
	mass = 150
}

planet = {
	x=-20,
	y=-100,
	radius=5,
	vx = 12,
	vy = 0,
	mass = 10
}

function distance(x1, y1, x2, y2)
   return math.sqrt((x2-x1)^2 + (y2 - y1)^2)
end

function love.draw()
   lg.translate(w/2,h/2)
   lg.scale(scale, scale)
   lg.setColor(1,0,0)
   lg.circle("fill", sun.x, sun.y, sun.radius)
   lg.setColor(0,1,0)
   lg.circle("fill", planet.x, planet.y, planet.radius)
end

function love.update()
   local force = (sun.mass*planet.mass)/distance(sun.x, sun.y, planet.x, planet.y)^2
   local forceX = force * (sun.x - planet.x)*0.8
   local forceY = force * (sun.y - planet.y)*0.8
   planet.vx = planet.vx+(forceX/planet.mass)
   planet.vy = planet.vy+(forceY/planet.mass)
   
   planet.x = planet.x + planet.vx
   planet.y = planet.y + planet.vy
end