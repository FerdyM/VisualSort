# Visual-Sort Ruby Application
***
Source-code: https://github.com/FerdyM/VisualSort

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
+ Merge-Sort with coloured visualization 
+ Selection-Sort visualization
+ Insertion-Sort visualization
+ Selection-Sort visualization
+ Bubble-Sort visualization
+ Compare iterations of different algorithims
+ Read custom csv files

#### Features to be added soon
***
+ More algorithms
+ Coloured visualization's
+ Output to a file


## Code structure
***
+ 'main.rb' - This file holds the MainControl class and the logic to start the game
+ 'window.rb' - This file holds the WindowClass, all the methods that control the display
+ 'algorithms.rb' - Holds all the algorithm's and calls the display methods
+ This all gets stored in the lib folder

#### Gems

- 'curses'
- 'ascii-charts'
- 'tty-prompt'
- 'tty-cursor'
- 'colorize'
- 'csv'

## User Experience and Interaction
***
The user begins by choosing how they want to input their unsorted array, this can be done by specifying a csv file or manual entry; alternatively the program can use a default unsorted array as an example. Next the user picks which sorting algorithm they would like to visualize. The user can pick from BubbleSort, InsertionSort, SelectionSort and MergeSort. In the future many more sorting algorithm's will be added. After the sorting algorithm complete's  the sorted array will be displayed along with the amount of iterations it took to complete.

## Instructions
***
1. Make sure you have ruby downloaded, if not follow the instructions [here](https://www.ruby-lang.org/en/documentation/installation/)

2. Download the visual_sort files to your computer and unzip them

3. Install bundler(if you havent already), navigate to the visual_sort file and type: 


```>install bundler```

4. Install the required gems, type:


```>bundle install```

5. Change directory to the lib, type:


```>cd lib```

6. Run maint.rb, type:


```>ruby main.rb```

7. If the file dosent run you may need to type:


```>gem update --system```

8. Repeat step 6

## Implementation and Design Plan
***

Implementation plan was done using trello.com

![Implementation](./docs/diagrams/implementation.PNG?raw=true "Implementation plan")

![timeline](./docs/diagrams/timeline.jpg?raw=true "Title")

![Process Diagram](./docs/diagrams/process_diagram.jpg?raw=true "VisualSort Process Diagram")

![class](./docs/diagrams/class_diagram.jpeg?raw=true "VisualSort Class Diagram")

![flow](./docs/diagrams/flow_diagram.jpeg?raw=true "VisualSort Flow Diagram")



