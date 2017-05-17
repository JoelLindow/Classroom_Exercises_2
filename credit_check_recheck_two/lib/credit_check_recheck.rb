class CreditCheckRecheck
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def split_original
    card_number.chars
  end

  def strings_to_integers
    split_original.map do |num|
      num.to_i
    end
  end

  def double_split_original
    with_doubles = []
    strings_to_integers.each.with_index do |num, i|
      if i.even? == true
        with_doubles << (num * 2)
      else
        with_doubles << num
      end
    end
    with_doubles
  end

  def reduce_doubles
    double_split_original.map do |num|
      if num.to_s.length == 2
        (num.to_s[0].to_i + num.to_s[1].to_i)
      else
        num
      end
    end
  end

  def sum_of_reduced
    sum = 0
    reduce_doubles.each do |num|
      sum += num
    end
    sum
  end

  def valid?
    if sum_of_reduced % 10 == 0
      true
    else
      false
    end
  end
end
