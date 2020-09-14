class JobApplicationsController < ApplicationController
    before_action :set_job_application, :except => [:index, :new, :create]

    def index
      if params[:user_id] || current_user.user?
        @job_applications = current_user.job_applications
      elsif current_user.admin?
        @job_applications = JobApplication.all
      end
    end

    def new
      @job_application = JobApplication.new
    end

    def create

      @job_application = JobApplication.find_by_user_id_and_job_id(params[:job_application][:user_id], params[:job_application][:job_id])
      if !@job_application.nil?
        redirect_to root_path, alert: "You already applied for this job."
      else
        @job_application = JobApplication.new(job_application_params)
        # authorize @job_application
        if @job_application.save
          redirect_to root_path, alert: "Your application has been sent. Good Luck!"
          # render json: @job_applcation, status: :created
        else
          render new_job_application_path , alert: "Oops, there was a problem, please try again"
          # render json: @job_applcation.errors, status: :unprocessable_entity
        end
      end
    end

    def show
      authorize @job_application
      @jobs = Job.all_sort_by_date.limit(8)
    end

    def edit
      authorize @job_application
    end

    def update
      @job_application.update(job_applications_update_params)
    end

    def destroy
      authorize @job_application
      @job_application.destroy
      redirect_to root_path
    end

    private


    def job_application_params
      params.require(:job_application).permit(:user_id, :job_id, :resume)
    end

    def job_applications_update_params
      params.require(:job_application).permit(:status)
    end

    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

end
