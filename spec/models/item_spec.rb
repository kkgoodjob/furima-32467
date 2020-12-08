require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '商品登録がうまくいくとき' do
    context '新規登録がうまくいくとき' do
      it "nameと、explanationとcategory_idとcondition_idとshipping_fee_burden_idとprefecture_idとdays_to_ship_idとpriceが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "category_idとcondition_idとshipping_fee_burden_idとprefecture_idとdays_to_ship_idが全て1以外で登録できる" do
        @item.category_id = 2
        @item.condition_id = 2
        @item.shipping_fee_burden_id = 2
        @item.prefecture_id = 2
        @item.days_to_ship_id = 2
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
      end
    end

    context '商品登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
      end
      it "explanationが空だと登録できない" do
      end
      it "category_idが空だと登録できない" do
      end
      it "category_idが1だと登録できない" do
      end
      it "condition_idが空だと登録できない" do
      end
      it "condition_idが1だと登録できない" do
      end
      it "shipping_fee_burden_idが空だと登録できない" do
      end
      it "shipping_fee_burden_idが1だと登録できない" do
      end
      it "prefecture_idが空だと登録できない" do
      end
      it "prefecture_idが1だと登録できない" do
      end
      it "days_to_ship_idが空だと登録できない" do
      end
      it "days_to_ship_idが1だと登録できない" do
      end
      it "priceが空だと登録できない" do
      end
      it "priceが300未満だと登録できない" do
      end
      it "priceが9999999より大きいと登録できない" do
      end
      it "priceが全角だと登録できない" do
      end
    end
  end
end
