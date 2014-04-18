require 'lifx'

client = LIFX::Client.lan
client.discover! do |c|
    c.lights.with_label('Bedroom')
end

client.lights.turn_on
light = client.lights.with_label('Bedroom')

green = LIFX::Color.hsl(0, 1, 0.01)
light.set_color(green, duration: 1)

sleep 1
client.lights.turn_off
client.flush
