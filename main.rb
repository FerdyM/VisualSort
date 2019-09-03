require 'csv'
class MainControl
    def self.greetUser
        return "Hello User, Welcome to VisualSort a sorting algortithim visualization and comparison tool!"
    end
    def self.getReadOrManual
        puts "You need to provide a set of random integers, if you have a csv you wuld like to read press 1, for manual entry press 2"
        input = gets.chomp
        if input.to_s == "1"
            getReadEntry
        else
            getManualEntry
        end
    end
    def self.getFeatureChoice
        puts "If you want to visualize a sorting algorithim enter: yes"
        choice = gets.chomp
        if choice == "no" || choice == "n"
            return "no"
        else
            return "visualize"
        end
    end
    def self.getManualEntry
        puts "Ah you've chosen manual entry, please enter up to 50 integers ranging from 1-100, MAKE SURE TO LEAVE SPACES BETWEEN YOUR NUMBERS"
        input = gets.chomp
        if input =~ /\d/ && input.length > 1 && input.length <= 50
            array = input.split(' ')
            array.map!(&:to_i)
            return array
        else
            puts "Invalid entry, please try again:"
            getManualEntry
        end
    end
    def self.getReadEntry
        puts "Ah you've chosen to read from a csv, please ensure the csv you select contains only integers, please enter the path of the csv: "
        filepath = gets.chomp
        data = CSV.read(filepath)
        data.flatten!.map!(&:to_i)
        if data !~ /^[\d\s\,]/
            puts "Awesome! CSV file read successfully!"
            return data
        else
            puts "You need to select a csv that contains ONLY integers"
            getReadOrManual
        end
    end
end
MainControl.getReadEntry