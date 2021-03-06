class Business < ActiveRecord::Base
  belongs_to :user

  has_many :jobs
  has_many :addresses, as: :addressable

  before_validation :generate_slug

  validates :name, uniqueness: true, presence: true
  validates :about, presence: true
  validates :slug, uniqueness: true, presence: true

  scope :online, -> { where(status: "online") }

  def to_param
    self.slug
  end

  private

  def generate_slug
    self.slug = name.parameterize if name
  end
end
