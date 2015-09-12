class SubBoard < ActiveRecord::Base
  self.table_name = 'subboard'
  self.primary_key = :messageid
  belongs_to :main_board, foreign_key: :threadid
  belongs_to :account, foreign_key: :userid

  validates_presence_of :threadid, :userid, :contents
end

# == Schema Information
#
# Table name: subboard
#
#  messageid :integer         not null, primary key
#  threadid  :integer(2)      default(0), not null
#  created   :datetime
#  userid    :integer(2)      default(0), not null
#  title     :string(128)
#  contents  :text            not null
#
