module ApplicationHelper

  def read_hash(h)
    h.each {|key, value| puts "#{key} is #{value}" }
  end

end
