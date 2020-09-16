FactoryBot.define do
  factory :shipping_address_purchase do
    postal_code          { '111-2222' }
    prefecture_id        { 2 }
    city                 {'名古屋市'}
    address              {'名古屋町1-1'}
    building_name        {'名古屋ビル'}
    tel_number           {'09011112222'}
    token                {'uyu1y2uyy21y2u'}
    association :user
    association :item
  end
end
