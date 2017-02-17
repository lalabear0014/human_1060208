class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    # user ||= User.new # guest user (not logged in)
    
    if user.blank?                       # 驗證user是不是有登入，如果沒有的話執行下方這一段
        cannot :manage, :all             # 先將執行所有權限的能力取消
    elsif user.admin?
        can :manage, :all
    else                                 # 有登入的user能做的事情
        can :create, @event               # 包括new跟create
        can :update, @event do |e|              
            (e.user_id == user.id)       # 讓user只能編輯自己的
        end
        can :destroy, @event do |e|
            (e.user_id == user.id)
        end
        can :read, @event
    end

  end
end
