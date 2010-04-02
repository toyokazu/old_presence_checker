namespace :batch do
  require 'csv'
  # intermediate data
  DST_CSV="db/students.csv"
  # final results
  DST_TSV="db/records.tsv"
  ATTRS = ["セメスター", "入学年度", "学生証番号", "氏名", "ローマ字氏名"]

  class AlreadyExistsError < StandardError
  end

  desc 'Count presence for each user and output as a csv format'
  task :count_presence => :conv_tsv_to_csv do
    begin
      csv_students = CSV.read("#{RAILS_ROOT}/#{DST_CSV}")
      attrs_array = csv_students.shift
      attrs = {}
      attrs_array.each_with_index {|v, i| attrs[v] = i}
      db_students_own = Presence.count(:group => :login, :conditions => {:proxyed => false})
      db_students_proxyed = Presence.count(:group => :login, :conditions => {:proxyed => true})
      #Presence.count(:group => :login).sort.each {|a| puts "#{a[0].gsub(/g0/, '')}, #{a[1]}"}
      dst_tsv = ENV["DST_TSV"].nil? ? "#{RAILS_ROOT}/#{DST_TSV}" : "#{ENV["DST_TSV"]}" 
      open(dst_tsv, "w") do |fout|
        ATTRS.each {|v| fout.print NKF.nkf('-Ws', "#{v}\t")}
        fout.print NKF.nkf('-Ws', "出席回数 (DB, 本人)\t出席回数 (DB, 代理)\t出席回数 (紙)\n")
        csv_students.each do |student|
          ATTRS.each do |v|
            fout.print NKF.nkf('-Ws', "#{student[attrs[v]]}\t")
          end
          fout.print NKF.nkf('-Ws', "#{db_students_own["g0" + student[attrs["学生証番号"]]]}\t#{db_students_proxyed["g0" + student[attrs["学生証番号"]]]}\t\r\n")
        end
      end
    rescue => error
      puts "Error occurred in :count_presence."
      puts "#{error.class}: #{error.message}"
      puts error.backtrace
    end
  end

  desc 'Delete db/students.csv.'
  task :delete_csv => :environment do
    begin
      File.delete("#{RAILS_ROOT}/#{DST_CSV}")
    rescue => error
      puts "Error occurred in :delete_csv."
      puts "#{error.class}: #{error.message}"
      puts error.backtrace
    end
  end

  desc 'Convert from Excel tsv to Ruby csv, source tsv file name should be specified by SRC_TSV.'
  task :conv_tsv_to_csv => :environment do
    begin
      raise AlreadyExistsError, "#{DST_CSV} is already exists." if File.exist?("#{RAILS_ROOT}/#{DST_CSV}")
      src_tsv = ENV["SRC_TSV"].nil? ? "#{RAILS_ROOT}/db/source.tsv" : "#{ENV["SRC_TSV"]}" 
      open(src_tsv) do |fin|
        open("#{RAILS_ROOT}/#{DST_CSV}", "w") do |fout|
          lines = fin.readlines
          lines.each do |line|
            fout.puts NKF.nkf('-Sw', "\"#{line.gsub(/\t/, '","').gsub(/\r\n/, '')}\"")
          end
        end
      end
    rescue AlreadyExistsError => error
      puts "#{error.class}: #{error.message}"
    rescue => error
      puts "Error occurred in :convert_csv."
      puts "#{error.class}: #{error.message}"
      puts error.backtrace
    end
  end
end
