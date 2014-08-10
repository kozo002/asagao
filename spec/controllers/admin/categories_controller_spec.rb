require 'rails_helper'

describe Admin::CategoriesController do
  prepare_login_admin

  let!(:category) { create(:category) }
  let(:category_attr) { attributes_for(:category) }
  before { sign_in admin }

  describe 'GET #index' do
    it '一覧ページが返ってくること' do
      get :index
      expect(response).to be_success
      expect(assigns[:categories]).to eq({ category => {} })
    end
  end

  describe 'GET #new' do
    it '新規作成ページが返ってくること' do
      get :new
      expect(response).to be_success
      expect(assigns[:category]).to be_an_instance_of(Category)
    end
  end

  describe 'POST #create' do
    it '新規作成されること' do
      expect{ post :create, category: category_attr }
        .to change(Category, :count).by(1)
    end
  end

  describe 'GET #edit' do
    it '編集ページが返ってくること' do
      get :edit, slug: category.to_param
      expect(response).to be_success
      expect(assigns[:category]).to eq(category)
    end
  end

  describe 'PUT #update' do
    it '更新されること' do
      put :update, slug: category.to_param, category: { name: 'update name' }
      expect(category.reload.name).to eq('update name')
    end
  end

  describe 'DELETE #destroy' do
    it '削除されること' do
      expect{ delete :destroy, slug: category.to_param }
        .to change(Category, :count).by(-1)
    end
  end
end
