class HelloWorldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Hello from HelloWorldJob"
    puts "I am starting to run at #{Time.now}"
  end
end