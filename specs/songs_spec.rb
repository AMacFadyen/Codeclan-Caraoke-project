require('minitest/autorun')
require('minitest/rg')

require_relative('../songs.rb')

class TestSongs < MiniTest::Test

    def setup()
        @song1 = Songs.new("Flume", "Bon Iver", "For Emma")
        @song2 = Songs.new("Skinny Love", "Bon Iver", "For Emma")
        @song3 = Songs.new("BYOB", "S.O.A.D", "Mezmerize")
        @song4 = Songs.new("Prison", "S.O.A.D", "Toxicity")
        @song5 = Songs.new("New Born", "Muse", "Origin of Symmetry")
        @song6 = Songs.new("Uprising", "Muse", "The Resistance")
    end

    def test_return_song_name
        actual = @song1.name()
        expected = "Flume"
        assert_equal(expected, actual)
    end

    def test_return_song_album
        actual = @song1.album()
        expected = "For Emma"
        assert_equal(expected, actual)
    end





end
