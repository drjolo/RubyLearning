require File.dirname(__FILE__) + '/exercise1-Dog_class.rb'

=begin
 doctest: Dog class exists
 >> duke = Dog.new
 >> duke.class
 => Dog
 doctest: a Dog has a name which defaults to 'Lassie' or name can be set by assignment during initialization
 >> default = Dog.new
 >> default.name
 => 'Lassie'
 >> duke = Dog.new('duke')
 >> duke.name
 => 'duke'
 doctest: a Dog can bark, eat, and chase_cat
 >> duke = Dog.new('duke')
 >> duke.respond_to? :bark
 => true
 >> duke.respond_to? :eat
 => true
 >> duke.respond_to? :chase_cat
 => true
 doctest: a Dog can learn new tricks by Dog.teach_trick( :poo ) and default block is used if no block is given
 >> duke = Dog.new('duke')
 >> duke.respond_to? :poo
 => false
 >> duke.teach_to( :poo ) { "#{duke.name} is using the facilities" }
 >> duke.respond_to? :poo
 => true
 >> duke.poo
 => 'duke is using the facilities'
 >> duke.respond_to? :run_in_circles
 => false
 >> duke.teach_to( :run_in_circles )
 >> duke.run_in_circles
 => "duke is doing the run_in_circles trick!"
 doctest: a Dog won't learn a trick it has already learned
 >> duke = Dog.new('duke')
 >> duke.teach_to( :bark )
 => nil
 doctest: if a Dog doesn't know a trick, the class will let you know the Dog is confused
 >> duke = Dog.new('duke')
 >> duke.respond_to? :dance
 => false
 >> duke.dance
 => "Duke is confused because he/she hasn't been taught how to dance yet"
=end