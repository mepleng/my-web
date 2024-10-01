# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_reader :name, :email, :password , :message

    def initialize(name,email,password)
        @name = name
        @email = email
        @password = password
    end

    def enter_room(room)
        room.user_enter(self)
    end

    def send_message(room,content)
        room.user_enter(self)
        message = Message.new(self,room,content)
        room.broadcast(self,content)
    end

    def acknowledge_message(sender,content)
        puts "#{@name} ackowledge messange from #{sender.name}: '#{content}'"
    end

end


# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_reader :name, :description, :users

    def initialize(name,description)
        @name = name
        @description = description
        @users = []
    end

    def user_enter (user)
        unless @users.include?(user)
            @users << user
            puts "#{user.name} entered #{@name}"
        end
    end
    
    def current
        @users.each {|user| puts user.name}
    end

    def broadcast (sender, content)
        @users.each do |user|
            user.acknowledge_message(sender, content) unless user == sender
        end
    end

end

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_reader :user, :room, :content

    def initialize(user,room,content)
        @user = user
        @room = room
        @content = content
    end

end

user1 = User.new("MinTo","@mil",123456)
user2 = User.new("Motin","@em",244854)
user3 = User.new("Tinmo","@lime",748596)

jopiter = Room.new("Jupiter","where we fly")

user1.enter_room(jopiter)
user2.enter_room(jopiter)
user3.enter_room(jopiter)

user1.send_message(jopiter,"How r u bro")

# add a method to user so, user can enter to a room
# user.enter_room(room)

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
