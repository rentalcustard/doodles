#OK, so this is an experiment in writing a Ruby script with some pretty arbitrary
# and silly constraints. The idea here is for each line to have N 'words', where
# N is the fibonacci number for that line. At 13, the sequence is reversed
# because long lines are quite easy.
#
# The following things count as words:
# * Numbers, and words in strings
# * Method calls - to_a, each, etc. Note that '*' is counted as a word in "2 * 4", but not in *args
# * def, class, etc.
#
# The following things don't:
# * Punctuation: '.', '|', ',', etc. See note above re. '*'
# * end
# * comments
#
"Hello" #1
"Fibonaccis:" #1
class Fibonacci #2
  def fib n #3
    a, b = 0, 1 #5
    1.upto(n).to_a.each do |i, *args| #8
      puts "#{a}" + " is the " + "#{i}" + "th" + " Fibonacci number. \n" #13
      a, b = b, a + b, 0 #8
    end
  end
end

eval "Fibonacci.new.fib(11)" #5

at_exit do |*args| #3
  puts "Bye" #2
  puts #1
  exit #1
end
