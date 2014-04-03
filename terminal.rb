require 'io/console'
require './lib/rps.rb'

class TerminalClient
  def start
    @db = RPS.db

    puts "WENDY's Rock-Paper-Scissors Game"
    puts "[1] Sign in"
    puts "[2] Sign up"

    while true
      input = gets.chomp.to_i
      break if input =="exit"
      if input == 1
        puts "What is your username?"
        username = gets.chomp
        puts "what is your password?"
        password = gets.chomp

        sign_in(username, password)

      elsif input == 2
        puts 'create a username for yourself'
        username = gets.chomp
        puts 'create a password'
        password = gets.chomp

        sign_up(username, password)

      elsif input == "users list"
        list_users


      end
    end



    # start

  end

  def commands
    puts "  users list - List all users"
    puts "  match list - List active matches"
    puts "  match play MID - Start playing game with id=MID"
    puts "  invites - List all pending invites"
    puts "  invite accept IID - Accept invite with id=IID"
    puts "  invite create USERNAME - Invite user with username=USERNAME to play a game"
  end

  def list_users
    puts "Users List:"
    puts "[ID]       User Name"
    @db.show_users.each{|x| puts "#{x.id}       #{x.name}" }
  end

  def list_active_mathces
    puts "--Active Matches--------------------"
    puts "| MID | Game | Status     | Player |"
    puts "------------------------------------"
    ##???
  end

  def match_play(mid)
    puts"--Match #{mid}---------------------------"
    puts"| Game | You      | Alice    | Win |"
    puts "------------------------------------"
    @db.show_rounds_for_each_match(mid).each{|x| puts "| #{x.id}    | #{x.p1_move}     | #{x.p2_move} |  x  |"}
  end

  def sign_in(username, password)
    result = RPS::SignIn.run(:name =>username, :pw =>password)
    if result.success?
      user = result.user
      puts "You are now logged in as #{user.name}."
    else
      if result.error == :username_missing
        puts "This username does not exist, try again."
      end
    end
  end

  def sign_up(username, password)
    result = RPS::SignUp.run(:name => username, :pw => password)
    if result.success?
      user = result.user
      puts "#{user.name} had been added as a new user"
    else
      if result.error == :name_taken
        puts "name is taken"
      end
    end
  end
end
TerminalClient.new.start
