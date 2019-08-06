# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:aweys)
  end

  test 'should redirect edit when not logged in' do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  # test 'should redirect edit when logged in as wrong user' do
  #   log_in_as(@user_two)
  #   get edit_user_path(@user)
  #   assert flash.empty?
  #   assert_redirected_to login_url 
  # end

  # test 'should redirect update when logged in as wrong user' do
  #   log_in_as(@user_two)
  #   patch user_path(@user), params: { user: { name: @user.name,
  #                                             email: @user.email } }
  #   assert flash.empty?
  #   assert_redirected_to login_url
  # end
end
