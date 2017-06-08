require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#display_name when admin" do
     user = User.new(admin: true, name:'bob')
     assert_equal("bob (admin)",user.display_name)
     #assert_equal("bob",user.display_name)
  end
  test "#display_name when not admin" do
     user = User.new(admin: false, name:'jane')
     assert_equal("jane",user.display_name)
  end
  test 'validates small password not valid' do
    user = User.new(password: 'xxxxxx')

    assert_not user.valid?
    assert_equal [:password], user.errors.keys
  end
  
end
