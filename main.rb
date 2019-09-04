require 'csv'
require 'curses'
require 'tty-prompt'
require 'colorize'
require_relative 'window'
require_relative 'algorithims'

class MainControl
    def self.run_program
        MainControl.greetUser
        unsortedArray = MainControl.getReadOrManual
        MainControl.getAlgorithimChoice(unsortedArray.dup)
    end
    def self.greetUser
        puts "Hello User, Welcome to VisualSort a sorting algortithim visualization and comparison tool!"
    end
    def self.getReadOrManual
        puts TTY::Cursor.clear_screen_down
        puts "You need to provide a set of random integers, if you have a csv you wuld like to read press 1, for manual entry press 2"
        input = gets.chomp
        if input.to_s == "1"
            unsortedArray = GetInputArray.getReadEntry
        else
            unsortedArray = GetInputArray.getManualEntry
        end
        return unsortedArray
    end
    def self.getAlgorithimChoice(unsortedArray)
        system("clear")
        prompt = TTY::Prompt.new
        loop do 
            choice = prompt.select("Choose which algorithim: ", %w(BubbleSort InsertionSort SelectionSort MergeSort Quit))
            window = WindowClass.createWindow
            case choice
            when "BubbleSort"
                Algorithim.bubbleSort(unsortedArray.dup, window)
            when "InsertionSort"
                Algorithim.insertionSort(unsortedArray.dup, window)
            when "SelectionSort"
                Algorithim.selectionSort(unsortedArray.dup, window)
            when "MergeSort"
                Merge.merge_sort([], unsortedArray.dup, [], window, 0)
                sleep(5)
            when "Quit"
                abort("")
            end      
            Curses.close_screen
            system("clear")
        end
    end
end
class GetInputArray
    def self.getManualEntry
        loop do
            puts TTY::Cursor.clear_screen_down
            puts "Ah you've chosen manual entry, please enter up to 50 integers ranging from 1-100, MAKE SURE TO LEAVE SPACES BETWEEN YOUR NUMBERS"
            input = gets.chomp
            if input =~ /[^\d^\s]/ || input.length >= 50
                puts "Invalid entry, please try again:"
            else
                unsortedArray = input.split(' ')
                unsortedArray.map!(&:to_i)
                return unsortedArray
            end
        end
    end
    def self.getReadEntry
        loop do
            begin 
                puts TTY::Cursor.clear_screen_up
                puts "You've chosen to read from a csv, make sure the csv only contains integers, for an example use (example.csv), but feel free to use your own.\n Enter the filepath of you csv: "
                filepath = gets.chomp
                data = CSV.read(filepath)
                data.flatten!.map!(&:to_i)
                if data !~ /^[\d\s\,]/
                    puts TTY::Cursor.clear_screen_up
                    puts "Awesome! CSV file read successfully!"
                    return data
                else
                    puts TTY::Cursor.clear_screen_up
                    puts "The csv you selected contains dissallowed characters or the filepath you entered is wrong"
                end
            rescue
                puts "Invalid Path"
            end
        end
    end
end
MainControl.run_program