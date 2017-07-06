Given(/^I land on Start screen$/) do
  expect(start_screen.displayed?).to be true
end

And(/^I verify that message is displayed "([^"]*)"$/) do |message|
  start_screen.wait_for_static_text_to_exist message
end

And(/^I swipe right$/) do
  start_screen.swipe_right
end

Then(/^I verify that message is displayed "([^"]*)" and "([^"]*)"$/) do |message1, message2|
  start_screen.wait_for_static_text_to_exist message1
  start_screen.wait_for_static_text_to_exist message2
end

And(/^I tap on button "([^"]*)"$/) do |button|
  start_screen.click_button button
end

Then(/^I Land on Sign up screen$/) do
  expect(sign_up_screen.displayed?).to be true
end

Then /^Enter (User Name|Email|Password|Phone Number)/ do |user_data|

  if user_data == "User Name"
    @username = Faker::Internet.user_name
    sign_up_screen.register_user_name @username

  elsif user_data == "Email"
    @email = Faker::Internet.email
    sign_up_screen.register_email @email

  elsif user_data == "Password"
    @password = Faker::Internet.password
    sign_up_screen.resister_pass @password

  elsif user_data == "Phone Number"
    @phone_number = Faker::PhoneNumber.phone_number
    sign_up_screen.resister_phone @phone_number

  end
end

Then(/^I select gender "([^"]*)"$/) do |gender|
    sign_up_screen.click_text_view gender
end

And(/^I accept alerts if any$/) do
  binding.pry
  sign_up_screen.accept_all_alerts
end