class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable

  before_destroy :ensure_an_admin_remains

  private
  def ensure_an_admin_remains
	  if User.count.zero?
	    raise "Can't delete last user"
	  end
	end
end
