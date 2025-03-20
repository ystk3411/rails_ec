# frozen_string_literal: true

module OrdersHelper
  def zip_code_format(zip_code)
    if zip_code
      zip_code.to_s.insert(3, '-')
    end
  end
end
