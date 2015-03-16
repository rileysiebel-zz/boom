class FlowsController < ApplicationController

	def show
		@flow = Flow.find(params[:id])
	end

end
