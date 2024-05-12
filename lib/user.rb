class User
  attr_reader :name, :age, :sex

  def initialize(name)
    @name = name
  end
  
  def welcome_message
    puts "welcome #{@name}, here are your tasks:"
    puts "\nwhat would you like to do?\n1. new task\n2. edit task\n3. filter current tasks"
  end

  def save(user_obj)
    File.open('user.yml', 'w') do |file|
      file.write(YAML.dump(user_obj))
    end
  end
end