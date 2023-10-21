require 'rails_helper'

RSpec.describe DailyCount, type: :model do
  before do
    @daily_count = FactoryBot.build(:daily_count)
  end

  describe '件数登録' do
    context '登録できる場合' do
      it "全て入力されていれば登録できる" do
        expect(@daily_count).to be_valid
      end
    end
    context '登録できない場合' do
      it "dateが空では登録できない" do
        @daily_count.date = ''
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("Date can't be blank")
      end
      it "delivery_countが空では登録できない" do
        @daily_count.delivery_count = ''
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("Delivery count can't be blank")
      end
      it "delivery_countが半角数字でなけれは登録できない" do
        @daily_count.delivery_count = '二十六'
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("Delivery count is not a number")
      end
      it "repair_countが空では登録できない" do
        @daily_count.repair_count = ''
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("Repair count can't be blank")
      end
      it "repair_countが半角数字でなけれは登録できない" do
        @daily_count.repair_count = '二十六'
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("Repair count is not a number")
      end
      it "exchange_countが空では登録できない" do
        @daily_count.exchange_count = ''
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("Exchange count can't be blank")
      end
      it "exchange_countが半角数字でなけれは登録できない" do
        @daily_count.exchange_count = '二十六'
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("Exchange count is not a number")
      end
      it "userが紐ついていなければ登録できない" do
        @daily_count.user = nil
        @daily_count.valid?
        expect(@daily_count.errors.full_messages).to include("User must exist")
      end
    end
  end
end
