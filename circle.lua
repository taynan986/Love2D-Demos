lg = love.graphics
width, height = lg.getWidth(), lg.getHeight()
points = {}
sides = 3
radius = 100
area = 0
cameraX = width/2
cameraY = height/2
time = 0
playing = false
font = love.graphics.getFont()

function NSidedPolygon(r,n)
   area = 0.5 * n * math.sin((2 * math.pi) / n)
   local temp = {}
   for i=1, n, 1 do
      table.insert(temp, r * math.cos(2*math.pi*i/n))
      table.insert(temp, r * math.sin(2*math.pi*i/n))
   end
   return temp
end

points = NSidedPolygon(radius, 3)

function love.draw()
   lg.translate(cameraX, cameraY)
   
   lg.setColor(0.8,0,0)
   lg.circle("fill", 0, 0, radius)
   lg.rectangle("fill",-(radius+230),-30,20,20)
   lg.rectangle("fill",-(radius+230),30, 20, 20)
   lg.print("+",-(radius+230)+30,(40-font:getHeight("+")/2))
   
   lg.setColor(0,0,0.8)
   lg.polygon("fill", points)
   lg.rectangle("fill",-(radius+230),0,20,20)
   lg.rectangle("fill",-(radius+230)+50,30,20,20)
   
   lg.setColor(1,1,1)
   lg.print(math.pi - area.."...", -(radius+200),-(20+font:getHeight(math.pi/area)/2))
   lg.print(area.."...", -(radius+200), (10-font:getHeight(area)/2))
   lg.print(area + (math.pi - area).."...", -(radius+200)+50, (40-font:getHeight(math.pi+area)/2))
end

function love.touchpressed(id, x, y)
   if playing then playing = false
   else playing = true end
end

function love.mousepressed(x, y)
   if playing then playing = false
   else playing = true end
end

function love.update(dt)
   if (playing) then
      if (time > 5000 * dt) then
         radius = radius + 10
         cameraX = (width/2)+radius
         sides = sides + 1
         points = NSidedPolygon(radius,sides)
         time = 0
      end
      --if (cameraX  < (width/2)+radius) then cameraX = cameraX + 2 end
      time = time + 1
   end
end