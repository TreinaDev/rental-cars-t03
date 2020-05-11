module LoginHelper
  def user_login(user = create(:user))
    login_as user, scope: :user
    user
  end
end