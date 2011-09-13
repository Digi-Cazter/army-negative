# encoding: utf-8

Given /^an ActiveRecord 'User' model with an 'enabled' boolean field and a 'username' field$/ do
  # Done: see the dummy rails app
end

When /^I create a user named '([^']+)' with '([^']+)' set to true$/ do |username, column|
  User.create :username => username, column.intern => true
end

Then /^the '([^']+)' column for '([^']+)' should be '(-?\d+)'$/ do |column, username, value|
  user = User.find_by_username(username)
  user.send("#{column}_before_type_cast").should == value.to_i
end

When /^I load a user named '([^']+)' who's '([^']+)' column is '(-?\d+)'$/ do |username, column, value|
  @user = User.send("find_by_username_and_#{column}", username, value.to_i)
  @user || raise("Unable to find user '#{username}' (who's '#{column}' column is '#{value}')")
end

Then /^the user model's '([^']+)' field for '([^']+)' should be true$/ do |column, username|
  @user.username.should == username
  @user.send("#{column}?").should be_true
end

