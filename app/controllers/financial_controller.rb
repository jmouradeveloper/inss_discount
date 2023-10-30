class FinancialController < ApplicationController
  skip_before_action :verify_authenticity_token

  def calculate_inss
    inss_discount = InssDiscountCalculator.call(params[:wage])

    render json: { amount: inss_discount }, status: :ok
  end
end
