def prepare_login_admin
  include Devise::TestHelpers
  before { @request.env['devise.mapping'] = Devise.mappings[:admin] }
  let!(:admin) { FactoryGirl.create(:confirmed_admin) }
end
