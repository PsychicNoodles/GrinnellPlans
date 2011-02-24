require 'lib/bellmyer/create_alias.rb'
class Account < ActiveRecord::Base
  include Bellmyer::CreateAlias
  set_primary_key :userid
  validates :username, :presence => true, :length =>{ :maximum => 16 }
  validates :password, :length =>{ :maximum => 34 }
  validates :email, :length =>{ :maximum => 64 }
  validates :guest_password, :length =>{ :maximum => 64 }
  validates :show_images, :presence => true
  
  has_many :interests_in_others, :class_name => "Autofinger", :foreign_key => "owner"
  has_many :people_that_interest_me, :class_name => "Accounts", :through => :interests_in_others, :source=>"subject_of_interest"
  
  has_many :board_votes, :foreign_key=> :userid
  has_many :opt_links, :foreign_key=> :userid
  has_one :permission, :foreign_key=> :userid
  has_many :poll_votes, :foreign_key=> :userid
  has_one :stylesheet, :foreign_key=> :userid
  has_many :main_board, :foreign_key=> :userid
  has_many :sub_board, :foreign_key=> :userid
  has_one :viewed_secret, :foreign_key=> :userid
  has_one :plan, :foreign_key => :user_id
  has_one :display, :foreign_key => :user_id
  
  #can't have "changed" attribute because of changed? method
  class << self
    def instance_method_already_implemented?(method_name)
      return true if (method_name == 'changed?'||method_name == 'changed')
          super
    end
  end
  def changed_date= value
    self[:changed] = value
  end
  def changed_date
    self[:changed]
  end

end



# == Schema Information
#
# Table name: accounts
#
#  userid         :integer(2)      not null, primary key
#  username       :string(16)      default(""), not null
#  created        :datetime
#  password       :string(34)
#  email          :string(64)
#  pseudo         :string(64)
#  login          :datetime
#  changed        :datetime
#  poll           :integer(1)
#  group_bit      :string(1)
#  spec_message   :string(255)
#  grad_year      :string(4)
#  edit_cols      :integer(1)
#  edit_rows      :integer(1)
#  webview        :string(1)       default("0")
#  notes_asc      :string(1)
#  user_type      :string(128)
#  show_images    :boolean(1)      default(FALSE), not null
#  guest_password :string(30)
#  is_admin       :boolean(1)      default(FALSE)
#

