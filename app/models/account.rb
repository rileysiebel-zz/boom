class Account < ActiveRecord::Base
  belongs_to :parent, :class_name => "Account", :foreign_key => "parent_id"
  has_many :children, :class_name => "Account", :foreign_key => "parent_id"

  has_many :outbound, :class_name => "Flow", :foreign_key => "source_id"
  has_many :inbound,  :class_name => "Flow", :foreign_key => "sink_id"

  def income
    self.inbound.reduce(0) { |sum, f| sum + f.amount } 
  end

  def spending
    self.outbound.reduce(0) { |sum, f| sum + f.amount }
  end

  def net_income
    self.income - self.spending
  end
  
end
