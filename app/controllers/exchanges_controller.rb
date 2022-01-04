class ExchangesController < ApplicationController
  load_and_authorize_resource

  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = current_user.exchanges.build(exchange_params)

    respond_to do |format|
      format.html do
        if @exchange.save
          redirect_to category_path(@exchange.categories.first.id), notice: 'Exchange has been successfully created'
        else
          render new_exchange_path, alert: 'Exchange not created. Please, try again!'
        end
      end
    end
  end

  private

  def exchange_params
    params.require(:exchange).permit(:name, :amount, category_ids: [])
  end
end
