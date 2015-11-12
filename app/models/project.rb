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
    {:bucket => "brayzen1", :access_key_id => "AKIAJZ2RRVTZIUPFDCSQ", :secret_access_key => "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"}
  end

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
