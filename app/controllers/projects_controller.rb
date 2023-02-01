class ProjectsController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: :index
    def create
        project = Project.create(project_params)
        if project.valid?
            render json: project, status: :created
        else
            render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        project = Project.find_by(id: params[:id])
        render json: project, status: :ok
    end
    
    def index
        projects = Project.all
        render json: projects, status: :ok
    end

    # def update
    #     user = @current_user
    #     project = Project.find_by(id: params[:id])
    #     if user.id == project.user_id
    #         project.update(project_params)
    #         render json: project, status: :created
    #     else
    #         render json: {errors: ["Not Authorized"]}, status: :unauthorized
    #     end
    # end

    # def destroy
    #     user = @current_user
    #     project = Project.find_by(id: params[:id])
    #     if user.id == project.user_id
    #         project.delete
    #         head :no_content
    #     else
    #         render json: { errors: ["Not Authorized"]}, status: :unauthorized
    #     end
    # end

    private

    def project_params
        params.permit(:user_id, :title, :description, :number_of_people)
    end
end
