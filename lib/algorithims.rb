require 'curses'
require 'tty-cursor'
require 'colorize'
require_relative 'window'

#Class that holds all the algorithims
class Algorithim
    #this algorithim works by iterating through the array
    #it will compare the current number to the next number and if the next is smaller they will swap
    #this continues until the array is sorted
    def self.bubbleSort(array, window)
        flag = true
        #this is the variable we use to measure effeciency
        iterations = 0
        while flag 
            flag = false
            (array.length - 1).times do |count|
                currentNum = array[count]
                nextNum = array[count + 1]
                if currentNum > nextNum
                    flag = true
                    array[count + 1] = currentNum
                    array[count] = nextNum
                end
                #every iteration is counted
                iterations += 1
                sleep(0.001)
                #every time the array is updated it is passed to the updatewindow method which updates the window
                WindowClass.updateWindow(array, window)
            end
        end
        #once the sorting is complete the window close and tells the user how many iterations it took
        Curses.close_screen
        puts TTY::Cursor.clear_screen_up
        p array
        puts "\nSorting complete took: #{iterations} iterations".colorize(:color => :red, :background => :white)
        sleep(3)
        puts TTY::Cursor.clear_screen_up
    end
    #selection sort works by constantly looking for the minimum integer and adds it to the front of the array
    def self.selectionSort(array, window)
        n = array.length - 1
        iterations = 0
        n.times do |i|
            min_index = i
            for count in (i + 1)..n
                min_index = count if array[count] < array[min_index]
                iterations += 1
            end
            array[i], array[min_index] = array[min_index], array[i] if min_index != i
            sleep(0.1)
            WindowClass.updateWindow(array, window)
        end
        Curses.close_screen
        puts TTY::Cursor.clear_screen_up
        p array
        puts "\nSorting complete took: #{iterations} iterations".colorize(:color => :red, :background => :white)
        sleep(3)
        puts TTY::Cursor.clear_screen_up
    end
    #Insertion sort works by keeping one element constant, checks if the next element is bigger than the current if it is swaps them
    #If it is not bigger the if/else terminates
    #it iterates the array.length times
    def self.insertionSort(array, window)
        iterations = 0
        (array.length).times do |count|
            while count > 0
                iterations += 1
                count-=1
                sleep(0.01)
                if array[count-1] > array[count]
                array[count], array[count-1] = array[count-1], array[count]
                else
                break
                end
                WindowClass.updateWindow(array, window)
            end
        end
        Curses.close_screen
        puts TTY::Cursor.clear_screen_up
        p array
        puts "\nSorting complete took: #{iterations} iterations".colorize(:color => :red, :background => :white)
        sleep(3)
        puts TTY::Cursor.clear_screen_up
    end
end
class Merge
    #Merge sort works by splitting the array into two halves recursively until it cant be divided anymore
    #Next it merges the smaller arrays into a largr sorted array
    #We need to put the array back together every iteration which is why it looks like alien language
    def self.merge_sort(left, array, right, window, iterations)
        if array.length <= 1
          array
        else
          WindowClass.updateWindowMerge((left + array + right), window, (0..left.length).to_a, (left.length..(left.length + array.length)).to_a)
          sleep(0.1)
          mid = (array.length / 2).floor
          left_split = array[0..mid-1]
          right_split = array[mid..array.length]
          left_split_ordered =  merge_sort(left, array[0..mid-1], right_split + right, window, iterations)
          right_split_ordered = merge_sort(left + left_split_ordered, array[mid..array.length], right, window, iterations)
         
          merge = merge(left_split_ordered, right_split_ordered, iterations)
          WindowClass.updateWindowMerge((left + merge + right), window, (0..(left.length + array.length)).to_a, (0..0).to_a)
          sleep(0.1)
          return merge
        end
    end
      
    def self.merge(left_split, right_split, iterations)
        if left_split.empty?
          right_split
        elsif right_split.empty?
          left_split
        elsif left_split[0] < right_split[0]
          [left_split[0]] + merge(left_split[1..left_split.length], right_split, iterations)
        else
          [right_split[0]] + merge(left_split, right_split[1..right_split.length], iterations)
        end
    end
end

