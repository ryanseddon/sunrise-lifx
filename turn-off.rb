require 'lifx'

label = ARGV[0]

client = LIFX::Client.lan
client.discover! do |c|
    c.lights.with_label(label)
end

client.lights.turn_on
light = client.lights.with_label(label)

light.set_color(LIFX::Color.hsl(0, 1, 0.01), duration: 1)

sleep 1
client.lights.turn_off
client.flush
