require 'lifx'

label = ARGV[0]
time = ARGV[1] ||= 120

client = LIFX::Client.lan
client.discover! do |c|
    c.lights.with_label(label)
end

client.lights.turn_on
light = client.lights.with_label(label)

fade_time = time # time in seconds
interval = 6 # run every 6 seconds
increment = fade_time/interval
luminence = 0.01
luminence_increment = 1/increment.to_f
hue_increment = 60/increment # Fade from red to bright yellow 0 to 60
hue = hue_increment

light.set_color(LIFX::Color.hsl(0, 1, luminence), duration: interval)

def set_interval(delay)
    Thread.new do
        loop do
            sleep delay
            yield
        end
    end
end

sunrise = set_interval(interval) do
    if luminence >= 1
        sunrise.kill
    end

    light.set_color(LIFX::Color.hsl(hue, 1, luminence), duration: interval)
    luminence = luminence + luminence_increment
    hue = hue + hue_increment
end

sunrise.join

