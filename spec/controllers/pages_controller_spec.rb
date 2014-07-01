require 'rails_helper'

describe PagesController do
  describe 'GET #home' do
    it 'トップページが返ってくること' do
      get :home
      expect(response).to be_success
    end
  end
end
