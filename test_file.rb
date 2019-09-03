require 'test/unit'
# require_relative 'main'
# require_relative 'window'
require_relative 'algorithims'
# class MainControlTest < Test::Unit::TestCase
    # def test_greetUser
    #     greeting = MainControl.greetUser
    #     assert_equal("Hello User, Welcome to VisualSort a sorting algortithim visualization and comparison tool!", greeting)
    # end
    # def test_getFeatureChoice
    #     choice = MainControl.getFeatureChoice
    #     assert_equal("visualize", choice)
    #     choice2 = MainControl.getFeatureChoice
    #     assert_equal("no", choice2)
    # end
    # def test_getReadOrManual
    #     choice3 = MainControl.getReadOrManual
    #     assert_equal("read", choice3)
    #     choice4 = MainControl.getReadOrManual
    #     assert_equal("manual", choice4)
    # end
    # def test_getManualEntry
    #     array = MainControl.getManualEntry
    #     assert_equal([1, 2, 3, 4], array)
    # end
    # def test_getReadEntry
    #     array = MainControl.getReadEntry
    #     assert_equal([76, 55, 93, 15, 35, 37, 70, 30, 75, 14, 38, 16, 2, 81, 21, 10, 32, 36, 42, 69, 31, 66, 79, 26, 54, 83, 58, 84, 95, 40, 92, 25, 41, 65, 39, 74, 56, 18, 34, 23, 64, 6, 3, 7, 29, 44, 45, 94, 19, 100], array)
    # end
# end
# class WindowClassTest < Test::Unit::TestCase
#     def test_formatArray
#         arr = WindowClass.formatArray([3, 7, 5, 9, 10, 8, 12])
#         assert_equal([[0, 3], [1, 7], [2, 5], [3, 9], [4, 10], [5, 8], [6, 12]], arr)
#     end
# end

class BubbleSort < Test::Unit::TestCase
    # def test_bubbleSort
    #     unsortedArray = [3, 2, 4, 1]
    #     sorted = Algorithim.bubbleSort(unsortedArray)
    #     assert_equal([1, 2, 3, 4], sorted)
    # end
    # def test_selectionSort
    #     unsortedArray = [3, 2, 4, 1]
    #     sorted = Algorithim.selectionSort(unsortedArray)
    #     assert_equal([1, 2, 3, 4], sorted)
    # end
    # def test_insertionSort
    #     unsortedArray = [3, 2, 4, 1]
    #     sorted = Algorithim.insertionSort(unsortedArray)
    #     assert_equal([1, 2, 3, 4], sorted)
    # end
    def test_mergeSort
        unsortedArray = [3, 2, 4, 1]
        sorted = Algorithim.mergeSort(unsortedArray)
        assert_equal([1, 2, 3, 4], sorted)
    end
end