class Flow < ActiveRecord::Base

	belongs_to :source, :class_name => "Account", :foreign_key => "source_id"
	belongs_to :sink, :class_name => "Account", :foreign_key => "sink_id"

end
