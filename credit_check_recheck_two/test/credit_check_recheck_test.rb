require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check_recheck'
require 'pry'

class CreditCheckRecheckTest < Minitest::Test

  def test_class_exists
    check = CreditCheckRecheck.new("5541808923795240")

    assert_instance_of CreditCheckRecheck, check
  end

  def test_check_it_can_accept_a_new_credit_card_number
    check = CreditCheckRecheck.new("5541808923795240")

    assert_equal "5541808923795240", check.card_number
  end

  def test_it_can_break_up_card_number_into_individual_numbers
    check = CreditCheckRecheck.new("5541808923795240")
    split = ["5", "5", "4", "1", "8", "0", "8", "9", "2", "3", "7", "9", "5", "2", "4", "0"]

    assert_equal split, check.split_original
  end

  def test_it_can_convert_strings_to_integers
    check = CreditCheckRecheck.new("5541808923795240")
    integers = [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0]

    assert_equal integers, check.strings_to_integers

  end

  def test_it_can_return_split_card_number_with_doubled_digits
    check = CreditCheckRecheck.new("5541808923795240")
      with_doubles_as_integers = [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0]

    assert_equal with_doubles_as_integers, check.double_split_original
  end
  #
  def test_it_can_reduce_two_digit_numbers_in_split
    check = CreditCheckRecheck.new("5541808923795240")
    with_doubles_reduced = [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0]

    assert_equal with_doubles_reduced, check.reduce_doubles
  end

  def test_it_can_sum_split_and_reduced_numbers
    check = CreditCheckRecheck.new("5541808923795240")

    assert_equal 70, check.sum_of_reduced
  end

  def test_it_can_determine_if_valid
    check = CreditCheckRecheck.new("5541808923795240")

    assert_equal true, check.valid?
    assert check.valid?
  end

  def test_it_can_determine_if_invalid
    check = CreditCheckRecheck.new("5541808923795241")

    assert_equal false, check.valid?
    refute check.valid?
  end


end
