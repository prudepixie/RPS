require 'io/console'
require './lib/rps.rb'

class TerminalClient
  def start
    #User chooses to sign up - create a new account
    puts "[1] Sign in"
    puts "[2] Sign up"

    input= gets.chomp
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

    end




    # start

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

  def sign_up(username, password)
    result = RPS::SignUp.run(:name => username, :pw => password)
    # username = "Wendy"
    # password = "123"
    # result = RPS::SignUp.run({ :name => "Wendy", :pw => "123" })
    if result.success?
      user = result.user
      puts "#{user.name} is had been added as a new user"
    else
      if result.error == :name_taken
        puts "name is taken"
      end
    end
end
end
end
TerminalClient.new.start
