class PrintersController < ApplicationController

	before_action :set_printer, only: [:show, :edit, :update, :destroy]
	def index
		@printers = Printer.all
	end

	def new
		@printer = Printer.new
	end

	def show 
	end

	def create
		@printer = Printer.new(printer_params)

		respond_to do |format|
			if @printer.save
				format.html { redirect_to @printer, notice: 'Net form was successfully created.' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	def set_printer
      @printer = Printer.find(params[:id])
    end

	def printer_params
		params.require(:printer).permit(:ip_address)
	end

end




