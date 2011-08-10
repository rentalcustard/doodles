@tests, @successes, @failures = [], 0, []
def assert(&block)
  block.call || raise
end
def test(&block)
  @tests << block
end
at_exit do
  @tests.each do |t|
    begin
      t.call
      print "."
      @successes += 1
    rescue => err
      print "F"
      @failures << err
    end
  end
  puts "\n\n#{@failures.size == 0 ? "PASS" : "FAIL"}! #{@tests.size} tests, #{@successes} pass, #{@failures.size} fail"
  puts "\n" + "Failures:\n" + @failures.map {|f| f.message + "\n" + f.backtrace.join("\n")}.join("\n\n") if @failures.size > 0
  exit @failures.size
end
