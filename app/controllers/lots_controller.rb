class LotsController < ApplicationController
  def new
    @lot = Lot.new
  end

  def create
    ActiveRecord::Base.transaction do
      if current_user
        @lot = current_user.lots.new(lot_params)
      else
        @lot = Lot.new(lot_params)
      end

      if @lot.valid?
        @lot.get_nearby_locations

        if @lot.nearby_locations['status'] == 'OK'
          @place_order_numbers = set_place_order_number(@lot)
          @lot.set_destination(@place_order_numbers)
          @lot.save

          LotActivity.create_with_lot(@lot) # 従属するモデルLotActivityを生成
          OtherPlace.create_with_lot(@lot) # 従属するモデルOtherPlaceを生成

          redirect_to lot_path(@lot), success: 'くじを作成しました'
        elsif @lot.nearby_locations['status'] = 'ZERO_RESULTS'
          flash.now[:info] = '近くにスポットがありませんでした。条件を変えてもう一度引いてください。'
          render :new, status: :unprocessable_entity
        else
          flash.now[:error] = '不具合が発生しました。管理者にお問い合わせください。'
          redirect_to root_path
        end
      else
        render :new, status: :unprocessable_entity
      end
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

    def set_place_order_number(lot)
      place_order_numbers = Array.new
      loop do
        place_order_numbers << Random.rand(0 .. lot.nearby_locations['results'].size - 1)
        place_order_numbers.uniq!
        # 配列の数が3つ（行き先の1つ+OtherPlace用の2つ）になるか、nearby_searchの結果と配列の数が同数になれば終了
        break if place_order_numbers.count == 3 || place_order_numbers.count == lot.nearby_locations['results'].size
      end
      place_order_numbers
    end
end
