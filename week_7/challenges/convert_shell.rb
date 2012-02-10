require_relative 'convert'
require_relative 'prompt'


def convert_one( test_input = false )
  test = false ^ test_input
  input = (test_input or prompt('> ').chomp)
  args = input.match(/^(-?\d+(.\d+)?) ?(\w{2})$/)
  if (args && args[3])
    begin
      "= #{convert(args[1], args[3]).round(2)} #{args[3][1].upcase}"
    rescue Exception => e
      case e.message
      when 'unit'
        "Please select from the available temperatures to convert: degF (f), Rankine (r), degC (c), or Kelvin (k)"
      when "below 0"
        unit = args[3][0].upcase
        "That temperature (#{args[1].to_s} #{unit}) is below absolute zero!"
      else
        "An error cccurred, please try again"
      end
    end
  elsif (input == 'x' || input == 'exit')
    "Have a nice day!"
  else
    "Incorrect Usage!\nTry #{Random.new.rand(30..90)} #{ %w(f c k r).sample + %w(f c k r).sample }"
  end
end

def convert_prompt
  puts <<EOT
Welcome to Nathan's Temperature Converter!
------------------------------------------
Remember: Type 'exit' or 'x' to quit
 
To perform a conversion, type the temperature to be converted
first, then type the unit the temperature is in followed by
the temperature you'd like to convert to:

To convert 72 degF to degC:
> 72 fc
= 22.22 C

Convert:
EOT
  puts statement = convert_one until statement == "Have a nice day!"
end

if __FILE__ == $0
  convert_prompt
end