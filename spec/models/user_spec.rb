require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do 
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる' do
      it '全ての項目が入力されており、各々の入力条件が満たされている場合' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'usernameが空の場合' do
        @user.username = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Username can't be blank")
      end

      it 'emailが空の場合' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれない場合' do
        @user.email = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空の場合' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordがアルファベットのみでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが全角文字では登録できない' do
        @user.password = 'サンプルパスワード'
        @user.password_confirmation = 'サンプルパスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'abc12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
