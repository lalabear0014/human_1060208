class EventPolicy < ApplicationPolicy
  
  def index?
    
  end

  def create?
    admin? || boss?
  end

  def new?
    admin? || boss?
  end

  def update?
    admin? || record.user == user
  end

  def edit?
    admin? || record.user == user
  end

  def destroy?
    admin? || boss?
  end

  def admin?
    user.admin?
  end

  def boss?
    user.boss?
  end

  def staff?
    user.staff?
  end

end
