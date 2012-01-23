=begin
 doctest: quiz_report( n, binary_completion_ary ) returns a report telling how many students have and have not completed the quiz given in binary_completion_ary
 >> quiz = [0,0,0,1,0,0,1,1,0,1]
 >> quiz_report( 1, quiz )
 => 'The number of participants who did not attempt Quiz 1 is 6 out of 10 total participants' 
=end

def quiz_report( quiz_num, quiz_binary )
  "The number of participants who did not attempt Quiz #{quiz_num} is #{quiz_binary.count(0)} out of #{quiz_binary.size} total participants"
end
