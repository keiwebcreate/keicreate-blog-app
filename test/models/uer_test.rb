# == Schema Information
#
# Table name: uers
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_uers_on_email                 (email) UNIQUE
#  index_uers_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
