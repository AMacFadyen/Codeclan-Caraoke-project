require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')

class TestGuests < MiniTest::Test

    def setup()
        @guest_group1 = Guests.new("Millar", 6)
        @guest_group2 = Guests.new("Byord", 4)
        @guest_group3 = Guests.new("Trelby", 15)
    end

    def test_get_group_size()
        expected = 15
        actual = @guest_group3.group_size()
        assert_equal(expected, actual)
    end



end
