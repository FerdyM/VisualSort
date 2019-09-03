require 'curses'
require 'ascii_charts'
class WindowClass
    def self.formatArray(unsortedArray)
        formattedArray = []
        (unsortedArray.length).times do |num| 
            formattedArray.push([num, unsortedArray[num]])
        end
        return formattedArray
    end
    def self.createWindow
        Curses.init_screen
        Curses.start_color
        Curses.curs_set(0)
        Curses.noecho
        window = Curses::Window.new(0, 0, 1, 2)
        return window
    end
    def self.updateWindow(unsortedArray, window)
        window.erase
        WindowClass.drawGraph(formatArray(unsortedArray), window)
        sleep(0.005)
        window.refresh
    end
    def self.drawGraph(array, window)
        table = AsciiCharts::Cartesian.new((array), :bar => true, :hide_zero => true).draw
        table.split("\n").each.with_index do |line, row|
          window.setpos(row, 0)
          window.addstr(line)
        end
    end
end

