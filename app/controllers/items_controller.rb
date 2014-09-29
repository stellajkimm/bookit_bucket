class ItemsController < ApplicationController
	def create
		bucket = Bucket.find(params[:bucket_id])
		item = bucket.items.create(item_params)
		redirect_to bucket_path(params[:bucket_id])
	end

	def show
		@item = Item.find(params[:id])
	end

	def destroy
		item = Item.find(params[:id])
		item.destroy
		redirect_to bucket_path(item.bucket)
	end

	def status
		item = Item.find(params[:id])
		item.status == "done" ? item.update(status: "todo") : item.update(status: "done")
		redirect_to bucket_path(item.bucket)
	end

	private
  
  def item_params
    params.require(:item).permit(:name, :location, :start_time, :end_time, :status, :bucket_id, :notes, :rating, :review)
  end

end
