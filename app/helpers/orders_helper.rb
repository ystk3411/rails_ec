module OrdersHelper
  def zip_code_format(zip_code)
    zip_codeformatted = zip_code.to_s.insert(3, "-")
    zip_codeformatted
  end
end
