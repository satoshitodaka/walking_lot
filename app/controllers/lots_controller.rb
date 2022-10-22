class LotsController < ApplicationController
  def new
    @lot = Lot.new
  end

  def create
    if current_user
      @lot = current_user.lots.new(lot_params)
    else
      @lot = Lot.new(lot_params)
    end

    if @lot.save
      redirect_to lot_path(@lot), success: 'くじを作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lot = Lot.find(params[:id])
  end

  private
    def lot_params
      params.require(:lot).permit(
        :location_type_id,
        :start_point_name,
        :start_point_address,
        :start_point_latitude,
        :start_point_longitude,
      )
    end
end
