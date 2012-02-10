=begin
 doctest: month_days test suite (run during a leap year and breaks during non-leap year)
 >> month_days(1)
 => 31
 >> month_days(2)
 => 29
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

def month_days( *args )
  year = args[1] || Time.new.year
  month = args[0]
  t = Time.utc(year, month)
  days = find_days( t )
end

def find_days( time )
  month = time.month
  num = 0
  begin
    time += 60*60*24
    num += 1
  end while month == time.month
  num
end
