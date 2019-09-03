# Visual-Sort Ruby Application
***
Source-code: lorem ipsum yadda yadda

## Description
***
"Visual-Sort" is a visualisation and performance comparison application, it's primary function is to educate user's about how sorting algorithim's work; secondly it can also compare various sorting algorithims to determine which algorithim works best for the user's desired application.

The user can input an unsorted array of integer's, this can be done by manual entry or alternatively the program will read a csv file specified by the user. The user can then select if they wish to continue to visualize an algorithim, compare algorithim's or quit.

## Why does this app exist?
***
For alot of beginner programmers sorting algorithims can seem like magic, however once visualised and properly explained the concepts are far easier to grasp. It is also not easy to tell which sorting algorithim is best suited for an individual's purpose, however once you have physically compared them side by side; it is obvious. 

Primarily this application is aimed to help people understand how a sorting algorithim works. It is also extremely helpful for anyone who would like to use a sorting algorithim but is not sure which to select.


## Features
***

#### MVP features
***
+ Take text input from user
+ Read csv file specified by user
+ Sort unordered integers provided by user
+ Visualize the algorithim live as it sorts
+ Display this visualization to a window, with no flickering 
+ Output the sorted list of integers to a file specified by the user

#### Extensible features
***
+ Count how many iterations each algorithim takes
+ Record exactly how long each algorithim takes
+ Compare the stats of two algorithims side by side


## Code structure
***
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu turpis egestas pretium aenean. Lacinia quis vel eros donec ac. 

#### Gems

Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Lacinia quis vel eros donec ac. Et tortor consequat id porta nibh venenatis.

## User Experience and Interaction
***
The user begins by choosing how they want to input their unsorted array, this can be done by specifying a csv file or manual entry; alternatively the program can use a default unsorted array as an example. Next the user will decide what to do with this array. The first option is visualizing the sorting algorithim as it sorts to get a better understanding of how it works, the user will also have the option to view information that desrcibes step-by-step how the algorithim works. Alternatively if the user wishes to compare two algorithims they can do that too, and ofcourse the user always has the option to quit and exit the program.

## Instructions
***
1. Make sure you have ruby downloaded, if not follow the instructions [here](https://www.ruby-lang.org/en/documentation/installation/)

2. Download the visual_sort files to your computer and unzip them

3. Install bundler(if you havent already), navigate to the visual_sort file and type: 
```>install bundler```

4. Install the required gems, type:
```>bundle install```

5. Change directory to the main_files, type:
```>cd main_files```

6. Run run_visual_sort.rb, type:
```>ruby run_visual_sort.rb```

7. If the file dosent run you may need to type:
```>gem update --system```

8. Repeat step 6

## Implementation and Design Plan
***

![timeline](./docs/diagrams/timeline.jpg?raw=true "Title")

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Laoreet sit amet cursus sit amet. Dolor sit amet consectetur adipiscing elit ut aliquam. Tempus egestas sed sed risus pretium quam.

![Process Diagram](./docs/diagrams/process_diagram.jpg?raw=true "VisualSort Process Diagram")

![class](./docs/diagrams/class_diagram.jpeg?raw=true "VisualSort Class Diagram")

![flow](./docs/diagrams/flow_diagram.jpeg?raw=true "VisualSort Flow Diagram")



