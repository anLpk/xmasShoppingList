# TODO: you can build your christmas list program here!
require_relative 'gift_methods'
require 'date'

puts "> Welcome to your Christmas gift list"
puts "---------- #{days_till_christmas} DAYS till Christmas -------"
filepath  = File.join(__dir__, 'gift_list.csv')
my_gift_list = []
load_csv(filepath, my_gift_list)

loop do
  puts "> Which action [list|add|delete|mark|quit]?"
  print "> "
  answer = gets.chomp
  case answer
  when "list" then list(my_gift_list)
  when "add" then add_gift(my_gift_list)
  when "delete" then delete(my_gift_list)
  when "mark" then mark_as_purchased(my_gift_list)
  when "quit", "exit"
    save_csv(filepath, my_gift_list)
    break
  end
end


#GIFT METHODS
def days_till_christmas
    # Christmas Date - Today's date
    x_mas = Date.new(2020, 12, 25)
    x_mas.jd - Date.today.jd
    # x_mas - Date.today.to_i
  end
  
def list(gifts_array)
  gifts_array.each_with_index do |gift, index|
    puts "#{index + 1} - #{gift[:purchased] ? "[X]" : "[ ]" } #{gift[:gift_name]} "
  end
end

def add_gift(gifts_array)
  # Add a user message
  puts "What would you like to add to your Christmas List"
  # Get answer from the user
  gift_name = gets.chomp
  # Add the answer into the gift_array
  gifts_array << {gift_name: gift_name, purchased: false }
  list(gifts_array)
end

# DEBUG
def delete(my_gift_list)
  # Display all our items
  list(my_gift_list)
  # Ask user which item to delete
  puts "> What would you like to delete - select an item number"
  # Get user input
  index = gets.chomp.to_i - 1
  # Remove item from the array
  my_gift_list.delete_at(index)
  list(gifts_array)
end

def mark_as_purchased(gifts_array)
  # list all the items...
  list(gifts_array)
  # Select item to mark as purchased
  puts "> What would you like to update - select an item number"
  # Get user input
  index = gets.chomp.to_i - 1
  # Select item to mark
  gifts_array[index][:purchased] = true
  # Change the value of purchased
  list(gifts_array)
end
