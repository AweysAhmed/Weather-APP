# frozen_string_literal: true

require 'test_helper'
# User testing
class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Sample User', email: 'sample@example.com')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'name needs to be present' do
    @user.name = '    '
    assert_not @user.valid?
  end

  test 'email needs to be present' do
    @user.email = '   '
    assert_not @user.valid?
  end

  test 'name cannot be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 100 + '@example.com'
    assert_not @user.valid?
  end

  test 'valid emails should be accepted' do
    valid_addresses = %w[example@example.com user@user.com a_a@example.com
                         AAA_D@foobar.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'invalid emails should not be accepted' do
    invalid_addresses = %w[example@example,com user_user.com a_a@examplecom
                           AAA_Dfoobarcom]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email address needs to be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses need to be saved in lower-case' do
    camel_case_email = 'SaMpLe@ExAmPlE.com'
    @user.email = camel_case_email
    @user.save
    assert_equal camel_case_email.downcase, @user.reload.email
  end
end
