# frozen_string_literal: true

class PromoCodesController < ApplicationController
  def discount
    code = PromoCode.find_by(code: params[:promo_code][:code])

    if code
      session[:register_code] = params[:promo_code][:code]
    else
      flash[:danger] = '入力されたコードは無効です'
    end
    redirect_to request.referer
  end

  def cancel
    session[:register_code].clear
    redirect_to request.referer
  end
end
