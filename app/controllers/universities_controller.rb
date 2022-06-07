class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[ show edit update destroy ]

  def index
    @universities = University.all
  end

  def show
  end

  def new
    @university = University.new
  end

  def edit
  end

  def create
    @university = University.new(university_params)
    respond_to do |format|
      if @university.save
        format.html { redirect_to university_url(@university), notice: "University was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to university_url(@university), notice: "University was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @university.destroy

    respond_to do |format|
      format.html { redirect_to universities_url, notice: "University was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_university
      @university = University.find(params[:id])
    end

    def university_params
      params.require(:university).permit(:universidad, :pais)
    end
end
