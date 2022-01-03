# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?

    can :manage, Exchange, user: user
    can :manage, Category, user: user
  end
end
