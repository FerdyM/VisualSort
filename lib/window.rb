#This gem is used to display the visualizations to screen
require 'curses'
#This gem actually draws the graph
require 'ascii_charts'
#This class contains all of the method to manipulate the screen
class WindowClass
    #the ascii-charts gem only takes a certain format of array [[0, 1], [1, 3], [2, 6]]
    def self.formatArray(unsortedArray)
        formattedArray = []
        (unsortedArray.length).times do |num| 
            formattedArray.push([num, unsortedArray[num]])
        end
        return formattedArray
    end
    #initializes the window, 3 colors for mergeSort, and sets the cursor to invisible
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
    #Erases the leftover graph, draws the new graph to screen, then refreshes the window to actually display it, this is for the merge algorithim only
    def self.updateWindowMerge(unsortedArray, window, sorted_range, sorting_range)
        window.erase
        WindowClass.drawGraphMerge(formatArray(unsortedArray), window, sorted_range, sorting_range)
        sleep(0.005)
        window.refresh
    end
    #This is for the mergeSort algo, table is set equal to the graph, we then split the graph into lines, next we iterate through each line, if num is sorted color is set to green, orange for sorting red for unsorted
    def self.drawGraphMerge(array, window, sorted_range, sorting_range)
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
    #this works the same as one above, except calls the drawgraph function for normal algorithims
    def self.updateWindow(unsortedArray, window)
        window.erase
        WindowClass.drawGraph(formatArray(unsortedArray), window)
        sleep(0.005)
        window.refresh
    end
    #This splits the graph into lines, then prints line by line
    def self.drawGraph(array, window)
        table = AsciiCharts::Cartesian.new((array), :bar => true, :hide_zero => true).draw
        table.split("\n").each.with_index do |line, row|
          window.setpos(row, 0)
          window.addstr(line)
        end
    end
end
#This turns on the colour for the character, then returns it and turns off the colour in preparation for the next character
def paint(win, color)
    win.attron(Curses.color_pair(color))
    yield
    win.attroff(Curses.color_pair(color))
end

