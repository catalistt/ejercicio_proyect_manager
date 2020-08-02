class ProyectsController < ApplicationController

  
  def new
    @proyect = Proyect.new
  end

  def index
    if params[:search]
      @proyects = Proyect.where(status: params[:search])

    else 
      @proyects = Proyect.all
    end
  end

  def create
    puts params
     @proyect = Proyect.new(name: params[:proyect][:name],description: params[:proyect][:description], start_date: params[:proyect][:start_date], end_date: params[:proyect][:end_date], status: params[:proyect][:status])

    if @proyect.save
      redirect_to proyects_new_path
    else
      flash[:error] = "Ocurrió un error guardando el proyecto"
      redirect_to proyects_new_path
    end 

  end
end
