class TimersController < ApplicationController

	def timing
		last_entry = Timer.where(user_id: params[:id]).group_by(&:user_id).map{|s| s.last.last}.pluck(:user_status)
		if (last_entry[0] == "Wake")
			user_status_updated = "Sleep"
		else
			user_status_updated = "Wake"
		end
	    user_id = params[:id]
	    @timer = Timer.create(user_id: user_id, user_status: user_status_updated)

	    if @timer.save
	      render json: {message: "timer saved", user_status: user_status_updated, status: "success"}
	    else
	      render json: {message: "timer not saved", status: "failed"}
	    end
	end

	def show
	end
end
