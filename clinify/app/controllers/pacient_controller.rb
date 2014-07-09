class PacientController < ApplicationController
  def new
  end

   def show
   	@pacient = Pacient.find(params[:id])
  end
end
