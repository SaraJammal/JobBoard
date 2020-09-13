class JobsController < ApplicationController

  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /jobs
  # GET /jobs.json

  def index
    @jobs = Job.all.order("created_at DESC")
    # render json: @jobs
    #
    # @Jobs = Job.where(nil)
    # filtering(params).each do |key, value|
    #   @Jobs = @Jobs.public_send("filter_by_#{key}", value) if value.present?
    # end
  end

  # GET /jobs/1
  # GET /jobs/1.json

  def show
  end

  def new
    @job = Job.new
  end

  def create
    # if current_user.isAdmin
      @job = Job.new
      @job.user = current_user
      if @job.save
        redirect_to @job, alert: "Job offer succesfully created"
        # render json: @job, status: :created, location: @job
      else
        render new_job_path, alert: "Job was not created"
        # render json: @job.errors, status: :unprocessable_entity
      end
    # end
  end

  # GET /jobs/1/edit
  def edit
  end

  def update
    authorize @job
    @job.update(job_params)
    redirect_to @job, alert: "Job offer succesfully updated"
    # render json: @job, status: :ok, location: @job
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    redirect_to root_path, alert: "Job offer successfully deleted"
    #      format.json { head :no_content }
  end

  private

  def filtering(params)
    params.slice(:title, :description)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :company_name ,:url, :category_id, :company_id)
  end

end
