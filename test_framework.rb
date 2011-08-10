@successes, @failures = 0, []
def test(&block)
  block.call || raise("Expected true, got false")
  print "."
  @successes += 1
rescue => err
  print "F"
  @failures << err
end

at_exit do
  puts "\n\n#{@failures.size == 0 ? "PASS" : "FAIL"}! #{@successes + @failures.size} tests, #{@successes} pass, #{@failures.size} fail"
  puts "\n" + "Failures:\n" + @failures.map {|f| f.message + "\n" + f.backtrace.join("\n")}.join("\n\n") if @failures.size > 0
  exit @failures.size
end
