require_relative './lib/user.rb'
require 'yaml'

def new_user
  puts "enter your name"
  name = gets.chomp
  User.new(name)
end

def load_user
  YAML.unsafe_load(File.read('user.yml'))
end

def start
  mode = startup_input
  if mode == 'new'
    new_user
  elsif mode == 'load'
    load_user
  end
end

def startup_input
  puts "type 'new' to create a new user, or 'load' to load a saved user"

  loop do
    error_message = "Invalid input. \n\n"
    mode = gets.chomp
    return mode if %w[new load].include?(mode.downcase)

    puts error_message
  end
end

user = start
user.welcome_message
user.save(user)
