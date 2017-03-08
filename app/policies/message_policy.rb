class MessagePolicy < ApplicationPolicy
  
  # def index?
    
  # end

  def create?
    staff?
  end

  def new?
    staff?
  end

  def update?
    staff? || record.user == user
  end

  def edit?
    staff? || record.user == user
  end

  def destroy?
    admin?
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
