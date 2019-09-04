require 'curses'
require 'tty-cursor'
require 'colorize'
require_relative 'window'

class Algorithim
    def self.bubbleSort(array, window)
        flag = true
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
                iterations += 1
                sleep(0.001)
                WindowClass.updateWindow(array, window)
            end
        end
        Curses.close_screen
        puts TTY::Cursor.clear_screen_up
        p array
        puts "\nSorting complete took: #{iterations} iterations".colorize(:color => :white, :background => :red)
        sleep(3)
        puts TTY::Cursor.clear_screen_up
    end
    def self.selectionSort(array, window)
        n = array.length - 1
        iterations = 0
        n.times do |i|
            min_index = i
            for j in (i + 1)..n
                min_index = j if array[j] < array[min_index]
                iterations += 1
            end
            array[i], array[min_index] = array[min_index], array[i] if min_index != i
            sleep(0.1)
            WindowClass.updateWindow(array, window)
        end
        Curses.close_screen
        puts TTY::Cursor.clear_screen_up
        p array
        puts "\nSorting complete took: #{iterations} iterations".colorize(:color => :red, :background => :black)
        sleep(3)
        puts TTY::Cursor.clear_screen_up
    end
    def self.insertionSort(array, window)
        iterations = 0
        (array.length).times do |j|
            while j > 0
                if array[j-1] > array[j]
                array[j], array[j-1] = array[j-1], array[j]
                else
                break
                end
                iterations += 1
                j-=1
                sleep(0.001)
                WindowClass.updateWindow(array, window)
            end
        end
        Curses.close_screen
        puts TTY::Cursor.clear_screen_up
        p array
        puts "\nSorting complete took: #{iterations} iterations".colorize(:color => :red, :background => :black)
        sleep(3)
        puts TTY::Cursor.clear_screen_up
    end
end
class Merge
    def self.merge_sort(left, array, right, window, iterations)
        if array.length <= 1
          array
        else
          WindowClass.updateWindow((left + array + right), window, (0..left.length).to_a, (left.length..(left.length + array.length)).to_a)
          sleep(0.1)
          mid = (array.length / 2).floor
          left_split = array[0..mid-1]
          right_split = array[mid..array.length]
          left_split_ordered =  merge_sort(left, array[0..mid-1], right_split + right, window, iterations)
          right_split_ordered = merge_sort(left + left_split_ordered, array[mid..array.length], right, window, iterations)
         
          merge = merge(left_split_ordered, right_split_ordered, iterations)
          WindowClass.updateWindow((left + merge + right), window, (0..(left.length + array.length)).to_a, (0..0).to_a)
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

