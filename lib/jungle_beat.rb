require './lib/linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    beats = string.split(' ')
    beats.each do |beat|
      list.append(beat)
    end
    string
  end

  def count
    list.count
  end

  def play
    `say -r 400 -v Boing #{list.to_string}`
  end
end
