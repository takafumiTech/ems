require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全て入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "center_codeが空では登録できない" do
        @user.center_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Center code can't be blank")
      end
      it "center_codeが半角数字でなけれは登録できない" do
        @user.center_code = '二十六'
        @user.valid?
        expect(@user.errors.full_messages).to include("Center code is invalid")
      end
      it "center_nameが空では登録できない" do
        @user.center_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Center name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "yearly_deliveryが空では登録できない" do
        @user.yearly_delivery = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Yearly delivery can't be blank")
      end
      it "consumption_type_idが空では登録できない" do
        @user.consumption_type_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Consumption type can't be blank")
      end
    end
  end
end
