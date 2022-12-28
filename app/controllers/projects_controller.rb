class ProjectsController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: :index
    def create

    end

    def show
        project = Project.find_by(id: params[:id])
        render json: project
    end
    
    def index
        projects = Project.all
        render json: projects
    end

    def update
        user = @current_user
        project = Project.find_by(id: params[:id])
        if user.id == project.user_id
            project.update(project_params)
            render json: project, status: :created
        else
            render json: {errors: ["Not Authorized"]}, status: :unauthorized
        end
    end

    def destroy
        user = @current_user
        project = Project.find_by(id: params[:id])
        project_creator = project.creator
        if user.username === project_creator
            project.delete
            head :no_content
        else
            render json: { errors: ["Not Authorized"]}, status: :unauthorized
        end
    end

    private

    def project_params
        params.permit(:title, :description, :number_of_people)
    end
end
