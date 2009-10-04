namespace :init do
  desc 'init test data'
  task :test_data => :environment do
    begin
      course = Course.create(:moodle_id => 711, :name => 'コンピュータネットワークII')
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

  desc 'init data'
  task :data => :environment do
    begin
      course = Course.create(:moodle_id => 711, :name => 'コンピュータネットワークII')
      Lecture.create(:course => course, :description => '2009-10-05', :start_time => Time.local(2009, 10, 5, 15, 0), :end_time => Time.local(2009, 10, 5, 16, 30))
      Lecture.create(:course => course, :description => '2009-10-12', :start_time => Time.local(2009, 10, 12, 15, 0), :end_time => Time.local(2009, 10, 12, 16, 30))
      Lecture.create(:course => course, :description => '2009-10-19', :start_time => Time.local(2009, 10, 19, 15, 0), :end_time => Time.local(2009, 10, 19, 16, 30))
      Lecture.create(:course => course, :description => '2009-10-26', :start_time => Time.local(2009, 10, 26, 15, 0), :end_time => Time.local(2009, 10, 26, 16, 30))
      Lecture.create(:course => course, :description => '2009-11-09', :start_time => Time.local(2009, 11, 9, 15, 0), :end_time => Time.local(2009, 11, 9, 16, 30))
      Lecture.create(:course => course, :description => '2009-11-16', :start_time => Time.local(2009, 11, 16, 15, 0), :end_time => Time.local(2009, 11, 16, 16, 30))
      Lecture.create(:course => course, :description => '2009-11-30', :start_time => Time.local(2009, 11, 30, 15, 0), :end_time => Time.local(2009, 11, 30, 16, 30))
      Lecture.create(:course => course, :description => '2009-12-07', :start_time => Time.local(2009, 12, 7, 15, 0), :end_time => Time.local(2009, 12, 7, 16, 30))
      Lecture.create(:course => course, :description => '2009-12-14', :start_time => Time.local(2009, 12, 14, 15, 0), :end_time => Time.local(2009, 12, 14, 16, 30))
      Lecture.create(:course => course, :description => '2009-12-21', :start_time => Time.local(2009, 12, 21, 15, 0), :end_time => Time.local(2009, 12, 21, 16, 30))
      Lecture.create(:course => course, :description => '2010-01-18', :start_time => Time.local(2010, 1, 18, 15, 0), :end_time => Time.local(2010, 1, 18, 16, 30))
      Lecture.create(:course => course, :description => '2010-01-25', :start_time => Time.local(2010, 1, 25, 15, 0), :end_time => Time.local(2010, 1, 25, 16, 30))

    rescue => error
      puts "Error occurred in test data initialization."
      puts "#{error.class}: #{error.message}"
      puts error.backtrace
    end
  end
  
end
