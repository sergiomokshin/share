  class User < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :posts
  has_many :comments
  has_many :links
  has_many :atachments


  def self.login(auth)
    @user = User.find(:all, :conditions => { :provider => auth["provider"], :uid => auth["uid"]}).first

    if not @user
      user = User.new
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      puts 'retorno'
      puts auth
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.image = auth["info"]["image"]
      #user.name = auth["user_info"]["name"]    
      user.save 
      user
    end
    @user
  end 


private
   def create_user(auth)
      user = User.new
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      puts 'retorno'
      puts auth
      user.name = auth["name"]
      user.email = auth["info"]["email"]
      user.image = auth["info"]["image"]
      #user.name = auth["user_info"]["name"]    
      user.save 
      user
    end
end