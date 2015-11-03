     class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user = NullUser.new, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user || NullUser.new
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

class NullUser
  def editor?
    false
  end

  def author?
    false
  end

  def visitor?
    false
  end
end

