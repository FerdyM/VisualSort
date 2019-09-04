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
        Curses.init_pair(1, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
        Curses.init_pair(2, Curses::COLOR_YELLOW, Curses::COLOR_BLACK)
        Curses.init_pair(3, Curses::COLOR_RED, Curses::COLOR_BLACK)
        Curses.curs_set(0)
        Curses.noecho
        window = Curses::Window.new(0, 0, 1, 2)
        return window
    end
    def self.updateWindow(unsortedArray, window, sorted_range, sorting_range)
        window.erase
        WindowClass.drawGraph(formatArray(unsortedArray), window, sorted_range, sorting_range)
        sleep(0.005)
        window.refresh
    end
    def self.drawGraph(array, window, sorted_range, sorting_range)
        table = AsciiCharts::Cartesian.new((array), :bar => true, :hide_zero => true).draw
        table.split("\n").each.with_index do |line, row|
            line.chars.each.with_index do |char, col|

                current_col = (col - 4) / 3

                color = 3
                color = 2 if current_col < sorting_range.max && current_col > sorting_range.min
                color = 1 if sorted_range.include?(current_col)

                window.setpos(row, col)
                paint(window, color) do
                    window.addch(char)
                end
            end
        end
    end
end

def paint(win, color)
    win.attron(Curses.color_pair(color))
    yield
    win.attroff(Curses.color_pair(color))
end

