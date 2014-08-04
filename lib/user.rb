class User < ActiveRecord::Base

  def self.authenticate(username, password)
    find_by(username: username, password: password)
    # has_many :to_do_items
  end

end