namespace :init do
  desc 'init test data'
  task :test_data => :environment do
    begin
      course = Course.create(:moodle_id => 711, :name => 'Computer Network II')
      lecture = Lecture.create(:course => course, :description => '2009-10-05', :start_time => 1.hour.ago.localtime, :end_time => 1.hour.since.localtime)
      #lecture = Lecture.create(:course => course, :description => '2009-10-05', :start_time => Time.local(2009, 10, 5, 15, 0), :end_time => Time.local(2009, 10, 5, 16, 30))

      # for ip address duplication test
      presence = Presence.create(:login => 'test_akiyama', :name => 'Toyokazu AKIYAMA', :mail => 'hoge@google.com', :ip_addr => '127.0.0.1', :lecture => lecture)

      # for normal test
      #presence = Presence.create(:login => 'test_akiyama', :name => 'Toyokazu AKIYAMA', :mail => 'hoge@google.com', :ip_addr => '192.168.1.1', :lecture => lecture)

      # for already registered test
      #presence = Presence.create(:login => 'akiyama', :name => 'Toyokazu AKIYAMA', :mail => 'hoge@google.com', :ip_addr => '192.168.1.1', :lecture => lecture)
    rescue => error
      puts "Error occurred in test data initialization."
      puts "#{error.class}: #{error.message}"
      puts error.backtrace
    end
  end
end
