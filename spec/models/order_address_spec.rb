require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全てが正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
    end
    it 'postal_codeが全角だと保存できないこと' do
      @order_address.postal_code = '０００ー００００'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'postal_codeが「-」を含まないとと保存できないこと' do
      @order_address.postal_code = '0000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角だと保存できないこと' do
      @order_address.postal_code = '０００００００００００'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'phone_numberが12文字以上だと保存できないこと' do
      @order_address.postal_code = '000000000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'municipalityが空だと保存できないこと' do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'prefecture_idが1だと保存できないこと' do
      @order_address.prefecture_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
