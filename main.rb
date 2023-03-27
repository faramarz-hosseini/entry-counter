class EntryCounter
  def initialize
    @entries = {}
  end
  def run
    while true
      entry = prompt('type something: ')
      entry = entry.gsub("\n",'')
      if @entries.key?(entry)
        @entries[entry] += 1
      else
        @entries[entry] = 1
      end
      clear_terminal
      present_data
    end
  end

  private

  def prompt(*args)
    print(*args)
    gets
  end

  def clear_terminal
    system("clear") || system("cls")
  end

  def present_data
    puts @entries.map {|entry, count| "#{entry}: #{count}" if entry != ""}
    puts '--------'
  end
end


ec = EntryCounter.new
ec.run