#Neccessary for working with csv files
require 'csv'
#Used to create window to display visualization
require 'curses'
#Used for easy intuitive menu's
require 'tty-prompt'
#Used to color the visualization
require 'colorize'
require_relative 'window'
require_relative 'algorithims'

#Main class, controls the flow of program
class MainControl
    #starts program
    def self.run_program
        puts "Hello User, Welcome to VisualSort a sorting algortithim visualization and comparison tool!"
        unsortedArray = MainControl.getReadOrManual
        MainControl.getAlgorithimChoice(unsortedArray.dup)
    end
    #Finds how user wants to enter array, directs them to that method
    def self.getReadOrManual
        system("clear")
        prompt = TTY::Prompt.new
        choice = prompt.select("How do you want to enter your unsorted array: ", %w(ReadCSVfile ManualEntry))
        case choice
        when "ReadCSVfile"
            unsortedArray = GetInputArray.getReadEntry
        when "ManualEntry"
            unsortedArray = GetInputArray.getManualEntry
        end
        return unsortedArray
    end
    #Gets choice and calls desired algorithim / visualization
    def self.getAlgorithimChoice(unsortedArray)
        system("clear")
        prompt = TTY::Prompt.new
        loop do 
            choice = prompt.select("Choose which algorithim: ", %w(BubbleSort InsertionSort SelectionSort MergeSort Quit))
            window = WindowClass.createWindow
            case choice
            when "BubbleSort"
                Algorithim.bubbleSort(unsortedArray.dup, window) do |array|
                    sorted = array.dup.sort
                    array.each_with_index do |num, index|
                        # WindowClass.updateWindow(array, window)
                        if array[0..index] == sorted[0..index]
                            WindowClass.updateWindow(array, window, (0..index).to_a, (0..0).to_a)
                            #sleep(0.05)
                        end
                    end
                end
            when "InsertionSort"
                Algorithim.insertionSort(unsortedArray.dup, window) do |array|
                    sorted = array.sort
                    array.each_with_index do |num, index|
                        if array[0..index] = sorted[0..index]
                            WindowClass.updateWindow(array, window, (0..array.length).to_a, (0..0).to_a)
                            sleep(0.5)
                        end
                    end
                    # WindowClass.drawGraph(array, window, array[0..count], array[(count + 1)..-1])
                end
            when "SelectionSort"
                Algorithim.selectionSort(unsortedArray.dup, window) do |array|
                    sorted = array.sort
                    array.each_with_index do |num, index|
                        if array[0..index] = sorted[0..index]
                            WindowClass.updateWindow(array, window, (0..index).to_a, (0..0).to_a)
                            sleep(0.5)
                        end
                    end
                end
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
#This is the class that holds all the input methods
class GetInputArray
    #This is the method for getting manual entry
    #it asks the user for input then checks the integers are spaced correctly and there are no characters
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
    #This method asks the user for the file path of their csv file
    #it then opens the csv and iterates through the file, outputting a correctly formatted array
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
#This starts the game
MainControl.run_program