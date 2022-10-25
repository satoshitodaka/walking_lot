# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user && user.admin? # 管理者でなければ抜ける
    can :access, :rails_admin
    can :manage, :all
  end
end