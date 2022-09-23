class ResumesController < ApplicationController
  before_action :set_resume, only: %i[ show edit update destroy ]


  def index
    @resumes = current_user.resumes
    authorize @resumes
  end

  def print
    @resume = Resume.find(params[:resume_id])

    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "Resume No. #{@resume.id}",
            page_size: 'A4',
            template: "resumes/print.html.erb",
            layout: "pdf.html",
            orientation: "Landscape",
            lowquality: true,
            zoom: 1,
            dpi: 75
        end
    end
  end

  def show
    authorize @resume
  end

  def new
    @resume = Resume.new
    authorize @resume
  end

  def edit
    authorize @resume
  end

  def create
    @resume = Resume.new(resume_params)
    authorize @resume
    @resume.user_id = current_user.id

    respond_to do |format|
      if @resume.save
        format.html { redirect_to resume_path(@resume), notice: "Resume was successfully created." }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @resume
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to resume_url(@resume), notice: "Resume was successfully updated." }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @resume
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: "Resume was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def resume_params
      params.require(:resume).permit(:first_name, :picture, :last_name, :discription, :serial_number, :phone, :adress, :email, :designation, :skills, experiences_attributes: [:id, :title, :skills, :sart_date, :end_date, :_destroy],  educations_attributes: [:id, :degree, :institute, :major_subjects, :sart_date, :end_date, :_destroy], languages_attributes: [:id, :language, :level, :_destroy] )
    end
end
