require 'csv'
require_relative 'window'
require_relative 'algorithims'

class MainControl
    def self.run_program
        MainControl.greetUser
        unsortedArray = MainControl.getReadOrManual
        MainControl.getFeatureChoice(unsortedArray)
    end
    def self.greetUser
        puts "Hello User, Welcome to VisualSort a sorting algortithim visualization and comparison tool!"
    end
    def self.getReadOrManual
        puts "You need to provide a set of random integers, if you have a csv you wuld like to read press 1, for manual entry press 2"
        input = gets.chomp
        if input.to_s == "1"
            unsortedArray = GetInputArray.getReadEntry
        else
            unsortedArray = GetInputArray.getManualEntry
        end
        return unsortedArray
    end
    def self.getFeatureChoice(unsortedArray)
        puts "If you want to visualize a sorting algorithim enter 'yes', otherwise enter 'no'"
        choice = gets.chomp
        if choice == "no" || choice == "n"
            abort("Okay have a nice day") 
        else
            MainControl.getAlgorithimChoice(unsortedArray)
        end
    end
    def self.getAlgorithimChoice(unsortedArray)
        loop do   
            puts "Okay youre almost ready! Available algortihims include: \n(1)Bubble Sort \n(2)Insertion Sort \n(3)Selection Sort \n(4)Merge Sort"
            puts "Please enter a number to select an algorithim: "
            choice = gets.chomp
            if choice =~ /\d/
                choice = choice.to_i
            end
            case choice

            when 1
                window = WindowClass.createWindow
                Algorithim.bubbleSort(unsortedArray, window)
                break
            when 2
                puts "Calls Insertion Sort"
                break
            when 3
                puts "calls Selection sort"
                break
            when 4
                puts "calls Merge sort"
                break
            else
                puts "Invalid choice"
            end
        end
    end
end
class GetInputArray
    def self.getManualEntry
        loop do
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
                puts "You've chosen to read from a csv, make sure the csv only contains integers, for an example use (example.csv), but feel free to use your own.\n Enter the filepath of you csv: "
                filepath = gets.chomp
                data = CSV.read(filepath)
                data.flatten!.map!(&:to_i)
                if data !~ /^[\d\s\,]/
                    puts "Awesome! CSV file read successfully!"
                    return data
                else
                    puts "The csv you selected contains dissallowed characters or the filepath you entered is wrong"
                end
            rescue
                puts "Invalid Path"
            end
        end
    end
end
MainControl.run_program