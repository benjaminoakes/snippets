# For ANSI color in the terminal.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class String
  COLORS = {:black => 30, :red => 31, :green => 32}.freeze

  def color(color_name, dark = false)
    return build_color(color_name, dark) + self + build_color(:black, false)
  end

  private
    def build_color(color_name, dark)
      color_string = "\e["
      color_string << "0" # if !dark
      color_string << COLORS[color_name].to_s
      color_string << "m"
    end
end

puts "green text ".color(:green) + "red text ".color(:red) + "black text"

