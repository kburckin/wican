class InitiativeSign < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :initiative

  validates :name, presence: true, unless: :user_set?
  validates :email, presence: true, unless: :user_set?
  validates :user_id, uniqueness: { scope: :initiative_id }

  validates_each :user_id do |record, attr, value|
    unless (record.name && record.email) || record.user_id
      record.errors.add(attr, 'Debes ingresar información de usuario o seleccionar usuario')
    end
  end

  private

  def user_set?
    self.user_id
  end

end