ActiveAdmin.register Order do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    id_column
    column :user do |order|
      order.user.name
    end
    column :cans
    column :water_brand
    column :address
    column :mobile
    column :action do |order|
      if order.delivered?
        "Delivered"
      elsif order.created?
        link_to "Confirm", confirm_admin_order_path(order.id)
      elsif order.confirmed?
        link_to "Deliver", deliver_admin_order_path(order.id)   	
      end
    end
    actions
  end
  
  Order.aasm.events.collect(&:name).each do |action|
    member_action action do 
      @order = Order.find(params[:id])
      @order.send(action.to_s + "!")
      redirect_to admin_orders_path
    end
  end
end
