class CreateFileJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
	   file = File.new("testfile","w+")
	   file.puts "testing"
	   file.close
  end
end
