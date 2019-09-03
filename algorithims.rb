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
                sleep(0.001)
                WindowClass.updateWindow(unsortedArray, window)
            end
        end
        Curses.close_screen
    end
    def self.selectionSort(array, window)
        n = array.length - 1
        n.times do |i|
            min_index = i
            for j in (i + 1)..n
                min_index = j if array[j] < array[min_index]
            end
            array[i], array[min_index] = array[min_index], array[i] if min_index != i
            sleep(0.5)
            WindowClass.updateWindow(array, window)
        end
        Curses.close_screen
    end
    def self.insertionSort(array, window)
        (array.length).times do |j|
            while j > 0
                if array[j-1] > array[j]
                array[j], array[j-1] = array[j-1], array[j]
                else
                break
                end
                j-=1
                sleep(0.005)
                WindowClass.updateWindow(array, window)
            end
        end
        Curses.close_screen
    end
    
    #Whole thing is fucking broken
    # def self.mergeSort(array, window)
    #     if array.length <= 1
    #       array
    #     else
    #         mid = (array.length / 2).floor
    #         left = mergeSort(array[0..mid-1], window)
    #         right = mergeSort(array[mid..array.length], window)
    #         merge(left, right, window)   
    #     end  
    # end   
    # def self.merge(left, right, window)
    #     if left.empty?
    #       right
    #     elsif right.empty?
    #       left
    #     elsif left[0] < right[0]
    #       [left[0]] + merge(left[1..left.length], right, window)
    #     else
    #       [right[0]] + merge(left, right[1..right.length], window)
    #     end
    # end
end


