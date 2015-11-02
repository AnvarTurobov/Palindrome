# create a method to go through and open each test file - (StringScanner)
# create a method to i_to_s and check if palindrome? (str = str.reverse)
# create a method to << detected palindromes into []
# create method to sort and count palindromes
# print the outcome for each file

class App

  def iterate_through_files
    Dir['test_files/*'].each do |file|
      open_file(file)
    end
  end
  
  def open_file(file)
    data = File.open(file).map do |range|
      range.scan(/\d+/)
    end
    data = data.flatten
  end


  def is_palindrome?(str)
    str == str.reverse
  end

  def initialize
    @palindromes = []
  end

  def push_palindromes(str)
    @palindromes << str if is_palindrome?(str)
  end


  
end
