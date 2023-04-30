class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments.order(id: :desc)
  end

  def show
    @payment = Payment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def pay
    @payment = Payment.find(params[:id])
    @payment.mark_as_paid

    redirect_to payments_path
  end
end
