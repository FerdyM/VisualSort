require 'ascii_charts'
require 'tty-cursor'
require_relative 'updateScreen'
require 'curses'
include Curses
def bubble_sort(array)
    win = Screen.createScreen
    if array.length <= 1
        return array
    end
    flag = true
    while flag
        flag = false
        (array.length - 1).times do |count|
            currentNum = array[count]
            nextNum = array[count + 1]
            if currentNum > nextNum
                array[count + 1] = currentNum 
                array[count] = nextNum 
                flag = true
            end
            Screen.updateScreen(array, win)
        end      
    end
    close_screen
end

bubble_sort([8, 21, 3, 97, 94, 43, 51, 26, 57, 29, 53, 68, 70, 86, 30, 44, 15, 99, 88, 93, 87, 80])
