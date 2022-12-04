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

    if @lot.valid?
      @lot.get_nearby_locations

      if @lot.nearby_locations['status'] == 'OK'
        @lot.set_destination
        @lot.save
        redirect_to lot_path(@lot), success: 'くじを作成しました'
      elsif @lot.nearby_locations['status'] = 'ZERO_RESULTS'
        flash.now[:info] = '近くにスポットがありませんでした。条件を変えてもう一度引いてください。'
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lot = Lot.find(params[:id])
    @other_places = @lot.other_places
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
