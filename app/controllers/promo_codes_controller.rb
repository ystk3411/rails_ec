# frozen_string_literal: true

class PromoCodesController < ApplicationController
  def discount
    code = PromoCode.find_by(code: params[:promo_code][:code])

    unless code&.is_used?
      session[:register_code] = params[:promo_code][:code]
      code.is_used = false
      code.save
    else
      flash[:danger] = '入力されたコードは無効です'
    end
    redirect_to request.referer
  end

  def cancel
    code = PromoCode.find_by(code: session[:register_code])
    code.is_used = true
    code.save!
    session[:register_code].clear
    redirect_to request.referer
  end
end
