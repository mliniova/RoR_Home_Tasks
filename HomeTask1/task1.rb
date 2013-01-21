require 'Date'
class WeekDay < Date
  def self.today
    DAYNAMES[Date.today.wday]
  end

  def to_modify(method)
    if WeekDay.respond_to? method
      p "Method doesn't exists, nothing to modify"
    else
      WeekDay.send(:define_method, method) do
        if DAYNAMES[(Date.today+1).wday]
          puts DAYNAMES[(Date.today+1).wday]
        else
          DAYNAMES[0]
        end
        Date.today + 1
      end
    end
  end

  def tomorrow
    p "Method exists, but code absent"
  end
end

puts "Today is #{WeekDay.today}"
puts "Before modifying:"
WeekDay.new.tomorrow
WeekDay.new.to_modify(:tomorrow)
puts "After modifying:"
WeekDay.new.tomorrow
puts "Trying to modify unexisted method"
WeekDay.new.to_modify(:i_am_fake)
