require 'rails_helper'

describe Admin::ProductsController do
  prepare_login_admin

  let!(:product) { FactoryGirl.create(:product) }

  describe 'GET #index' do
    context 'ログインユーザーの場合' do
      before { sign_in admin }
      it '一覧が返ってくること' do
        get :index
        expect(response).to be_success
        expect(assigns[:products]).to eq([product])
      end
    end
  end

  describe 'GET #show' do
    context 'ログインユーザーの場合' do
      before { sign_in admin }
      it '詳細ページが返ってくること' do
        get :show, slug: product.to_param
        expect(response).to be_success
        expect(assigns[:product]).to eq(product)
      end
    end
  end

  describe 'GET #new' do
    context 'ログインユーザーの場合' do
      before { sign_in admin }
      it '新規登録ページが返ってくること' do
        get :new
        expect(response).to be_success
      end
    end
  end

  describe 'POST #create' do
    context 'ログインユーザーの場合' do
      before { sign_in admin }
      it '新規登録されること' do
        expect{ post :create, product: FactoryGirl.attributes_for(:product) }
          .to change(Product, :count).by(1)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログインユーザーの場合' do
      before { sign_in admin }
      it '編集ページが返ってくること' do
        get :edit, slug: product.to_param
        expect(response).to be_success
        expect(assigns[:product]).to eq(product)
      end
    end
  end

  describe 'PUT #update' do
    context 'ログインユーザーの場合' do
      before { sign_in admin }
      it '更新されること' do
        put :update, slug: product.to_param, product: { name: 'update name' }
        expect(product.reload.name).to eq('update name')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログインユーザーの場合' do
      before { sign_in admin }
      it '削除されること' do
        expect{ delete :destroy, slug: product.to_param }
          .to change(Product, :count).by(-1)
      end
    end
  end
end
