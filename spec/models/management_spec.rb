require 'rails_helper'

RSpec.describe Management, type: :model do
  before do
    @management = FactoryBot.build(:management)
  end

  describe '件数登録' do
    context '登録できる場合' do
      it '全て入力されていれば登録できる' do
        expect(@management).to be_valid
      end
    end
    context '登録できない場合' do
      it 'item_nameが空では登録できない' do
        @management.item_name = ''
        @management.valid?
        expect(@management.errors.full_messages).to include("Item name can't be blank")
      end
      it 'unitが空では登録できない' do
        @management.unit = ''
        @management.valid?
        expect(@management.errors.full_messages).to include("Unit can't be blank")
      end
      it 'unitが半角数字でなけれは登録できない' do
        @management.unit = '二十六'
        @management.valid?
        expect(@management.errors.full_messages).to include('Unit is not a number')
      end
      it 'lead_timeが空では登録できない' do
        @management.lead_time = ''
        @management.valid?
        expect(@management.errors.full_messages).to include("Lead time can't be blank")
      end
      it 'lead_timeが半角数字でなけれは登録できない' do
        @management.lead_time = '二十六'
        @management.valid?
        expect(@management.errors.full_messages).to include('Lead time is not a number')
      end
      it 'current_amountが空では登録できない' do
        @management.current_amount = ''
        @management.valid?
        expect(@management.errors.full_messages).to include("Current amount can't be blank")
      end
      it 'current_amountが半角数字でなけれは登録できない' do
        @management.current_amount = '二十六'
        @management.valid?
        expect(@management.errors.full_messages).to include('Current amount is not a number')
      end
      it 'spareが空では登録できない' do
        @management.spare = ''
        @management.valid?
        expect(@management.errors.full_messages).to include("Spare can't be blank")
      end
      it 'spareが半角数字でなけれは登録できない' do
        @management.spare = '二十六'
        @management.valid?
        expect(@management.errors.full_messages).to include('Spare is not a number')
      end
      it 'cunsumption_by_deliveryが空では登録できない' do
        @management.consumption_by_delivery = ''
        @management.valid?
        expect(@management.errors.full_messages).to include("Consumption by delivery can't be blank")
      end
      it 'userが紐ついていなければ登録できない' do
        @management.user = nil
        @management.valid?
        expect(@management.errors.full_messages).to include('User must exist')
      end
    end
  end
end
