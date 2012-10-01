#!/usr/bin/env ruby

require "pathname"

sb_path = Pathname.new ARGV[0]
original_path = Pathname.new ARGV[1]

dirname = original_path.parent.basename
result_filename = "#{dirname}#{sb_path.extname}"

temp_path = sb_path.parent.join("#{result_filename}.tmp")
final_path = sb_path.parent.join(result_filename)

group_match = /-(.{2,})$/i.match(dirname)

if group_match && !%w{x264 h264 264}.include?(group_match[1].downcase)
  sb_path.rename(temp_path)
  temp_path.rename(final_path)

  puts "Renamed to #{final_path.basename}"
else
  puts "Looks like #{dirname} has no group; not renaming"
end
