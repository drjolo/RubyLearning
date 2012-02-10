require 'date'

=begin
 doctest: month_days test suite
 >> month_days(1)
 => 31
 >> month_days(2) == (leap_year?( Date.today.year ) ? 29 : 28)
 => true
 >> month_days(2,2009)
 => 28
 >> month_days(2,2012)
 => 29
 >> month_days(3)
 => 31
 >> month_days(4)
 => 30
 >> month_days(5)
 => 31
 >> month_days(6)
 => 30
 >> month_days(7)
 => 31
 >> month_days(8)
 => 31
 >> month_days(9)
 => 30
 >> month_days(10)
 => 31
 >> month_days(11)
 => 30
 >> month_days(12)
 => 31
=end

require 'date'

def month_days( *args )
  year = args[1] || Time.new.year
  month = args[0]
  new_month = (month + 1) % 12
  Date.new(year, month).step(Date.new(year + (month == 12 ? 1 : 0), (new_month == 0 ? 12 : new_month))).count - 1
end

def leap_year? year
  year % 400 == 0 || year % 100 != 0 && year % 4 == 0
end

