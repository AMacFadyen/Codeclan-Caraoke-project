require('minitest/autorun')
require('minitest/rg')

require_relative('../rooms.rb')
require_relative('../songs.rb')
require_relative('../guest.rb')

class TestRooms < MiniTest::Test

    def setup()
        @room1 = Rooms.new("Red Room", [], [], 5)
        @room2 = Rooms.new("Blue Room", [], [], 9)
        @room3 = Rooms.new("Green Room", [], [], 17)
        @room4 = Rooms.new("Stage Room", [], [], 26)
        @rooms = [@room1, @room2, @room3, @room4]

        @guest_group1 = Guests.new("Millar", 6)
        @guest_group2 = Guests.new("Byord", 4)
        @guest_group3 = Guests.new("Trelby", 15)

        @song1 = Songs.new("Flume", "Bon Iver", "For Emma")
    end

    def test_room_name()
        actual = @room2.get_room_name()
        expected = "Blue Room"
        assert_equal(expected, actual)
    end

    def test_give_room_song()
        @room2.give_song(@song1)
        expected = [@song1]
        actual = @room2.current_song_playing()
        assert_equal(expected, actual)
    end

    def test_insert_guest()
        @room1.check_in(@guest_group1)
        @room1.check_in(@guest_group2)
        actual = @room1.get_current_guests()
        expected = [@guest_group2]
        assert_equal(expected, actual)
    end

    def test_remove_guest()
        @room1.check_in(@guest_group1)
        @room1.check_out(@guest_group1)
        actual = @room1.get_current_guests()
        expected = []
        assert_equal(expected, actual)
    end

    def test_room_capacity()
        expected = 9
        actual = @room2.room_capacity()
        assert_equal(expected, actual)
    end

    def test_size_exceeds_capacity()
        expected = "I'm afraid that room is too small for your group."
        actual = @room1.check_in(@guest_group1)
        assert_equal(expected, actual)
    end

    def test_which_room_can_hold_group()
        expected = [@room3, @room4]
        actual = @rooms.map{ |room| room.available_room_for(@guest_group3)}
        assert_equal(expected, actual)
    end
end
