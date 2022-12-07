class Admin::ActivitiesController < Admin::BaseController
  def index
    @pagy, @activities = pagy(Activity.all.includes(:user))
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activitiy_params)
      ActivityMailer.with(activity: @activity).update_activity.deliver_later
      redirect_to admin_activity_path, success: 'アクティビティを更新しました'
    else
      render :edit
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy!
    redirect_to admin_activities_path, success: 'アクティビティを削除しました'
  end

  private

  def activitiy_params
    params.require(:activity).permit(:content, { location_type_ids: [] }, :approved, :released)
  end
end
