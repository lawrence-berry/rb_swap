#! /usr/local/bin/ruby

require 'fileutils'

fail "Needs 2 arguments (find, replace)" unless ARGV.length == 2

original=ARGV[0]
replacement=ARGV[1]

Dir["**/*" + original + "*"].each do |f|
  target = f.gsub(original, replacement)
  puts "from #{f} to #{target}"
  # FileUtils.mv f, target, :force => true
end

