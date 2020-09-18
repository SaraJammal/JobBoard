require 'rails_helper'


#I faced some errors due to not fully understand how the Copybara works
# as when I search for the cause of the error not much information were displayed
# and i tried a lot of ways to solve the problems
#
RSpec.describe JobsController, :type => :controller do
  describe "GET index" do
    it "returns successfull response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @jobs" do
      job = Job.new()
      get :index
      expect(assigns(:jobs)).to eq([job])
    end

    it "renders the index template" do
      get :index
      expect(respond_to?).to render_template("index")
    end
  end
  describe "POST jobs#create" do
    it "should create a new job" do
      user = User.new()
      login_as(user, scope: :user)
      visit new_job_path
      fill_in "job_title", with: "Job1"
      fill_in "job_description", with: "Job1 description"
      expect { click_button "Save" }.to change(Job, :count).by(1)
    end
  end

  describe "PUT jobs#update" do
    it "should update an existing job" do
      user = User.new()
      login_as(user, scope: :user)
      job = Job.new()
      visit edit_story_path(job)
      fill_in "job_title", with: "React job"
      fill_in "job_description", with: "Description"
      click_button "Save"
      expect(job.reload.title).to eq "React job"
      expect(job.content).to eq "Description"
    end
  end

  describe "DELETE jobs#destroy" do
    it "should delete a job" do
      user = User.new()
      job = Job.new()
      login_as(user, scope: :user)
      visit story_path(job.id)
      page.should have_link("Delete")
      expect { click_link "Delete" }.to change(Job, :count).by(-1)
    end
  end
end

