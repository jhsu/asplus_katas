require 'benchmark'
require_relative 'look_and_say'

n = 50
Benchmark.bmbm do |x|
  x.report("string.scan regex") do
    look_and_say = LookAndSay.new("1", :regex)
    n.times { look_and_say.next }
  end
  x.report("basic loop") do
    look_and_say = LookAndSay.new("1", :loop)
    n.times { look_and_say.next }
  end
end

