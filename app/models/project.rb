class Project < ActiveRecord::Base
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true
  # has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  has_attached_file :image,
                    styles: { medium: "400x400>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_host_name => "s3-us-west-2.amazonaws.com",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => ENV["S3_BUCKET"], :access_key_id => ENV["S3_ACCESS_KEY"], :secret_access_key => ENV["S3_SECRET"]}
  end

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
