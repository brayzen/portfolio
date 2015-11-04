class Project < ActiveRecord::Base
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
