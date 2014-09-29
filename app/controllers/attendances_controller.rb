class AttendancesController < ApplicationController

	def create
		@item = Item.find(params[:id])
		@item.attendances.create(attendances_params)
		redirect_to bucket_path(@item.bucket)
	end

	def destroy
		@item = Item.find(params[:id])
		@attendance = @bucket.attendances.find_by(user_id: params[:attendance][:user_id])
		@attendance.destroy
		redirect_to bucket_path(@item.bucket)
	end

	private
	
	def attendances_params
    params.require(:attendance).permit(:user_id)
  end
end
