class Universities::ProgramsController < ApplicationController
  before_action :set_university
  before_action :set_program, only: %i[ show edit update destroy ]


  def index
    @programs = @university.programs
  end

  def show
  end

  def new
    @program = Program.new
  end

  def edit
  end

  def create
    @program = @university.programs.build(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to university_programs_url(@program), notice: "Programa creado" }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to university_programs_url(@program), notice: "Program was successfully updated." }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @program.destroy

    respond_to do |format|
      format.html { redirect_to university_programs_url, notice: "Program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_university
      @university = University.find(params[:university_id])
    end

    def set_program
      @program = Program.find(params[:id])
    end


    def program_params
      params.require(:program).permit(:nombre, :beca, :requisito, :descripcion, :university_id)
    end
end
