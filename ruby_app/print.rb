# frozen_string_literal: true

# Class to format the console output
class Print
  def show(arr)
    str = ''
    arr.each do |i|
      str += "\t #{i[:url]} #{i[:views]} visits\n"
    end
    puts str
  end
end
