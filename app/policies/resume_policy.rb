class ResumePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    index?
  end

  def show?
    user.id == resume.user_id
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def new?
    index?
  end

  private

    def resume
      record
    end
end
