# card_number = "5541808923795240"

# Your Luhn Algorithm Here
class CreditCard
  attr_reader :card_number, :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
    @numbers = card_number.split("")
    @to_integers = []
    @results = 0
  end

  def last_four
    @card_number[-4, @card_number.size - 1]
  end

  def is_valid?
    (0..@numbers.size - 1).each do |index|
      if index % 2 == 0
        @to_integers << @numbers[index].to_i * 2
      else
        @to_integers << @numbers[index].to_i
      end
    end

    (0..@to_integers.size - 1).each do |index|
      if @to_integers[index] >= 10
        @to_integers[index] -= 9
      end
    end 

    @to_integers.each { |integer| @results += integer }

    @results % 10 == 0
  end
end

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
