class PatientController < ApplicationController
  def new
  end

   def show
   	@patient = Patient.find(params[:id])
  end
end
