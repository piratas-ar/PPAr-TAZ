# encoding: utf-8
Afiliate.controllers :afiliaciones do

  get :index do
    @comunas = Comuna.all(:order => "id")
    @piratas = Pirata.count()

    render "afiliaciones/index", :locals => {
      :comunas => @comunas,
      :piratas => @piratas,
      :action => url(:afiliaciones, :nueva)
    }
  end

  post :nueva do
    @pirata = Pirata.new(params[:pirata])
    if @pirata.save
      redirect url(:comunas, :show, :id => @pirata.comuna)
    else
      flash[:error] = "Hubo un error al procesar tu afiliación, ¿completaste todos tus datos? Son pocos ;)"
      redirect url(:afiliaciones, :index)
    end
  end

end
