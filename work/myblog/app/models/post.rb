class Post < ActiveRecord::Base
  validates :title, :body, :author, :presence => true
  validates :picture_url, :allow_blank => true, :format => {
      :with => %r{\.(gif|jpg|png)\Z}i,
      :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  has_many :comments, :dependent => :destroy

  def get_article_time
    self.created_at.strftime("%B %m, %Y")
  end

  def get_article_month
    self.created_at.strftime("%b")
  end

  def get_article_day
    self.created_at.strftime("%m")
  end
end
