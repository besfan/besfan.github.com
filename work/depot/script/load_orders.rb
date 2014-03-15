Order.transaction do
  (1..100).each do |i|
    Order.create(:name=>"Custem #{i}",:address=>"#{i} Main Street",
                 :email=>"custem_#{i}@example.com",:pay_type=>"Check")
  end
end