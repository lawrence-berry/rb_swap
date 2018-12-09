#! /usr/local/bin/ruby

require 'fileutils'
fail "Needs 2 arguments (find, replace)" unless ARGV.length == 2

DRY_RUN = true

original=ARGV[0]
replacement=ARGV[1]
search_path="**/*" + original + "*"
Dir[search_path].each do |f|
  target = f.gsub(original, replacement)
  puts "from #{f} to #{target}" if DRY_RUN
  FileUtils.mv f, target, force: true unless DRY_RUN
end

all_files = Dir.glob("**/*")
all_files.each do |file_name|
  next if File.directory?(file_name) || File.zero?(file_name)
  next if file_name == "rb_swap.rb" # No idea!
  text = File.read(File.join(Dir.pwd, file_name))
  if text.include?(original)
    replacement_text = text.gsub(Regexp.quote(original), Regexp.quote((replacement))
    puts File.join(Dir.pwd, file_name) if DRY_RUN
    File.open(file_name, "w") { |file| file.puts replacement_text } unless DRY_RUN
  end
end
