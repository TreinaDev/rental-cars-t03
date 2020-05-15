require 'rails_helper'

describe 'rental authorization' do
  context 'create' do
    it 'redirect to sign in' do
      post rentals_path, params: {}

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end