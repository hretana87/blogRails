class ArticulosController < ApplicationController

	def index
		@articulos = Articulo.all
	end

	def new
		@articulo = Articulo.new
	end

	def edit
		@articulo = Articulo.find(params[:id])
	end

	def update
		@articulo = Articulo.find(params[:id])

		if @articulo.update(articulo_params)
			redirect_to @articulo
		else
			render 'edit'
		end
	end

	def create		
		@articulo = Articulo.new(articulo_params)

		if @articulo.save
			redirect_to @articulo
		else
			render 'new'
		end
	end

	def show
    	@articulo = Articulo.find(params[:id])
  	end

	def destroy
		@articulo = Articulo.find(params[:id])
		@articulo.destroy

		redirect_to articulos_path
	end
 
	private
	def articulo_params
		params.require(:articulo).permit(:titular, :contenido)
	end

end
