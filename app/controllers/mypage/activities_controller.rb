class Mypage::ActivitiesController < Mypage::BaseController
  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.new(activity_params)

    if @activity.save
      create_notification_about_activity_created(@activity)
      AdminMailer.with(user: @activity.user, activity: @activity).approval_required.deliver_later
      redirect_to mypage_activity_path(@activity), success: 'アクティビティを作成しました。公開まで少々お待ちください'
    else
      flash.now[:danger] = 'アクティビティの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = current_user.activities.find(params[:id])
  end

  def update
    @activity = current_user.activities.find(params[:id])

    if @activity.update(activity_params)
      create_notification_about_activity_updated(@activity)
      AdminMailer.with(user: @activity.user, activity: @activity).approval_required.deliver_later
      redirect_to mypage_activity_path(@activity), success: 'アクティビティを更新しました'
    else
      flash.now[:danger] = 'アクティビティの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @activity = current_user.activities.find(params[:id])
  end

  def index
    @q = current_user.activities.ransack(params[:q])
    @pagy, @activities = pagy(@q.result(distinct: true).includes(:location_types).order(created_at: :desc))
  end

  def destroy
  end

  private
    def activity_params
      params.require(:activity).permit(:content, { location_type_ids: [] }).merge(released: false, approved: false)
    end

    def create_notification_about_activity_created(activity)
      notification = Notification.create!(
        title: '新規作成されたアクティビティを承認してください。',
        url: "#{Settings.admin_url}/activity/#{activity.id}/edit"
      )
      notification.notify(User.admin)
    end

    def create_notification_about_activity_updated(activity)
      notification = Notification.create!(
        title: 'アクティビティが更新されました',
        url: admin_activity_path(activity)
      )
      notification.notify(User.admin)
    end
end
