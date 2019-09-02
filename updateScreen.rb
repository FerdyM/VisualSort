require 'ascii_charts'
require 'tty-cursor'
require 'curses'
include Curses

class Screen
    def self.returnArray(array)
        formatted_array = []
        (array.length).times do |num|
            formatted_array << [num, array[num]]
        end
        return formatted_array
    end
    def self.drawArray(array, window)
        table = AsciiCharts::Cartesian.new(returnArray(array), :bar => true, :hide_zero => true).draw
        table.split("\n").each.with_index do |line, row|
          window.setpos(row, 0)
          window.addstr(line)
        end
    end
    def self.updateScreen(array, window)
        window.erase
        Screen.drawArray(array, window)
        window.refresh
        sleep(0.05)
    end
    def self.createScreen
        init_screen
        start_color
        curs_set(0)
        noecho
        return Curses::Window.new(0, 0, 1, 2)
    end
end
