require 'rails_helper'

RSpec.describe Management, type: :model do
  before do
    @management = FactoryBot.build(:management)
  end

  describe '件数登録' do
    context '登録できる場合' do
      it "全て入力されていれば登録できる" do
        expect(@management).to be_valid
      end
    end
    context '登録できない場合' do
      
    end
  end
end
