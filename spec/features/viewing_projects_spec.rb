require 'spec_helper'

feature "Viewing Projects" do
  let!(:user) {FactoryGirl.create(:confirmed_user)}
  let!(:project) {FactoryGirl.create(:project)}

  before do
    sign_in_as!(user)
    define_permission!(user, :view, project)
  end

  scenario "Listing all Projects" do
    visit '/'
    click_link project.name
    page.current_url.should == project_url(project)
  end
end