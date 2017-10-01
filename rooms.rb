class Rooms
    def initialize(name, guest, song, capacity)
        @room_name = name
        @current_guests = guest
        @current_song = song
        @max_capacity = capacity
    end

    def get_room_name()
        return @room_name
    end

    def current_song_playing()
        return @current_song
    end

    def get_current_guests()
        return @current_guests
    end

    def give_song(song)
        @current_song << song
    end

    def check_in(guest)
        if guest.group_size <= @max_capacity
        @current_guests << guest
        else
            return "I'm afraid that room is too small for your group."
        end
    end

    def check_out(guest)
        @current_guests.delete(guest)
    end

    def room_capacity()
        return @max_capacity
    end

    def available_rooms(guest)
        for room in @rooms
            if room.room_capacity >= guest.group_size && room.get_current_guests() == []
                return "#{room.get_room_name} is available."
            else
                return "I'm afraid no rooms are available at the moment."
            end
        end
    end


end
