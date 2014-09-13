class ItemsController < ApplicationController
	def create
		p params
		bucket = Bucket.find(params[:bucket_id])
		item = bucket.items.create(item_params)
		redirect_to bucket_path(params[:bucket_id])
	end

	private
  
  def item_params
    params.require(:item).permit(:name, :location, :start_time, :end_time, :status, :bucket_id, :notes, :rating, :review)
  end

end
