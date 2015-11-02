# create a method to go through and open each test file - (StringScanner)
# create a method to i.to_s and check if palindrome? (str = str.reverse)
# create a method to << detected palindromes into []
# create method to sort and count palindromes
# print the outcome for each file

class App

  def iterate_through_files
    Dir['test_files/*'].each { |file| open_file(file) }
  end

  def open_file(file)
    data = File.open(file).map do |range|
      range.scan(/\d+/)
    end
    data = data.flatten
    output(file, data)
  end

  def palindrome?(str)
    str == str.reverse
  end

  def initialize
    @palindromes = []
  end

  def push_palindromes(str)
    @palindromes << str if palindrome?(str)
  end

  def list_palindromes(data)
    results = data[0]..data[1]
    results.map(&:to_s).select { |str| push_palindromes(str) }  
    @palindromes.count
  end

  def empty
    @palindromes.reject! { |str| str }
  end

  def output(file, data)
    count = list_palindromes(data)
    puts "File checked: #{file} "
    puts "Range: #{data[0]}..#{data[1]}"
    puts "Palindromes: #{count}"
    puts "============="
    empty
  end
end

App.new.iterate_through_files
