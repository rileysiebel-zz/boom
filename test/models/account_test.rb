require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  def setup
    @checking = accounts(:checking)
    @pay_check = flows(:pay_check);
    @siebel_mortgage = flows(:siebel_mortgage)
    @wells_mortgage = flows(:wells_mortgage)
    @car_payment = flows(:car_payment)
  end
  
  test "inbound flows" do
  	@inbound = @checking.inbound
  	assert_includes @inbound, @pay_check
  end

  test "outbound flows" do
    @outbound = @checking.outbound
    assert_includes @outbound, @siebel_mortgage
    assert_includes @outbound, @wells_mortgage
    assert_includes @outbound, @car_payment
  end

  test "income" do
    assert_in_delta @checking.income, @pay_check.amount, 0.01
  end

  test "spending" do
    assert_in_delta @checking.spending, (@siebel_mortgage.amount + @wells_mortgage.amount + @car_payment.amount), 0.01
  end

  test "net income" do
    assert_in_delta @checking.net_income, (@pay_check.amount - (@siebel_mortgage.amount + @wells_mortgage.amount + @car_payment.amount)), 0.01
  end

end
