#----USER METHODS----

# user sees the general welcome message, gets prompted to log in or create new user

# log in asks for name or email and validates input
# if no record found suggest checking spelling or creating a new account
# if user found asks for password
# gem to star out password entry
# if password is correct goes to main menu
# if not correct suggest checking spelling or creating a new account

# create account asks for user name, email and password
# once account created goes to main menu

# personalised welcome
# main menu options now including including log out option which re-runs the whole file

# methods below are inside the my account menu branch of the main menu
# start with most basic methods - adding to user_beers by name to create the join between beers and users

# see user_beers - realitively easy
# add to user_beers harder - how?

# add beer by name
 $user = "user"

def log_in
  puts "Please type '1' to log in or '2' to create a new account"
  user_input = gets.chomp
  if user_input == "1"
    existing_user_log_in
  elsif user_input == "2"
    create_new_account
  else log_in
  end
end

def existing_user_log_in
  puts "Please type '1' to log in with your name or '2' to log in with your email address"
  user_input = gets.chomp
  if user_input == "1"
    existing_user_log_in_with_name
  elsif user_input == "2"
    existing_user_log_in_with_email
  else existing_user_log_in
  end
end

def existing_user_log_in_with_name
  puts "Please enter your name"
  user_input = gets.chomp
  $user = User.find_by(name: user_input)
  authenticate
end

def existing_user_log_in_with_email
  puts "Please enter your email address"
  user_input = gets.chomp
  $user = User.find_by(email: user_input)
  authenticate
end

def authenticate
  puts "Welcome #{$user.name}, please enter your password"
  user_input = gets.chomp
  if user_input == $user.password
    main_menu_options
  else authenticate
  end
end

def create_new_account
  puts "Please enter your name"
  user_input = gets.chomp
  $user = User.create(name: user_input)
  create_password
end

def create_password
  puts "Please enter your new password"
  user_input = gets.chomp
  $user.password = user_input
  puts "Welcome to beer me #{$user.name}!"
  main_menu_options
end
