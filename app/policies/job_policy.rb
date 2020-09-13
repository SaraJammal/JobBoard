class JobPolicy < ApplicationPolicy

  # User is a company and created this job
  def created_by_company?
    user.company? && record.company_id == user.id
  end

  # Only admin users or companies can create jobs
  def create?
    user.admin? || user.company?
  end

  # Only admin users or companies that created current job can update it
  def update?
    user.admin? || created_by_company?
  end

  # Only admin users or companies that created current job can delete it
  def destroy?
    user.admin? || created_by_company?
  end

end