Class Check-In
========================

Class Check-In is a Command Line application written in Ruby to streamline a class check-in process for students and attendance view for teachers. 

---

## Getting Started

After you git clone this application run 'bundle install' in your terminal. You can then input your own data by updating the values in the seeds.rb file. After complete, run rake db:migrate and rake db:seed to update and populate the database. To start the application, run "ruby bin/run.rb" in your terminal.

## Functions

- Student User registration
- Student User class check-in/check-out
- Student Users can view class message of the day
- Teacher User sign-in verification
- Teacher User can view class attendance
- Teacher User can add/delete students from roster

#### Gems

This application makes use of the following gems...

- activerecord
- sinatra-activerecord
- sqlite3
- rake
- tty-prompt


#### Authors

- Andrew Mullan 
- Kendall Stephens


#### License

This code is considered public domain. 


