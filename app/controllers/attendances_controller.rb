class AttendancesController < ApplicationController

	def create
		item = Item.find(params[:item_id])
		item.attendances.create(user_id: current_user.id)
		redirect_to bucket_path(item.bucket)
	end

	def destroy
		item = Item.find(params[:item_id])
		attendance = item.attendances.find_by(user_id: current_user.id)
		attendance.destroy
		redirect_to bucket_path(item.bucket)
	end

	# private
	
	# def attendances_params
 #    params.require(:attendances).permit(:user_id)
 #  end
end
