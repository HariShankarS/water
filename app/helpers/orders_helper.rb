module OrdersHelper
  def class_for
    {created: "info", confirmed: "primary", delivered: "warning"}
  end
end
