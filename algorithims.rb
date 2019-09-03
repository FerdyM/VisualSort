require 'curses'
require_relative 'window'
class Algorithim
    def self.bubbleSort(unsortedArray, window)
        flag = true
        while flag 
            flag = false
            (unsortedArray.length - 1).times do |count|
                currentNum = unsortedArray[count]
                nextNum = unsortedArray[count + 1]
                if currentNum > nextNum
                    flag = true
                    unsortedArray[count + 1] = currentNum
                    unsortedArray[count] = nextNum
                end
                WindowClass.updateWindow(unsortedArray, window)
            end
        end
        Curses.close_screen
    end
end


