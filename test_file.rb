require 'test/unit'
require_relative 'main'

class MainControlTest < Test::Unit::TestCase
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
    def test_getManualEntry
        array = MainControl.getManualEntry
        assert_equal([1, 2, 3, 4], array)
    end
end