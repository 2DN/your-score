require 'rails_helper'

RSpec.describe CreateScoreSubjectAverage, type: :model do
  describe '成績新規作成' do
    before do
      @form = FactoryBot.build(:create_score_subject_average)
    end

    context '新規作成出来る' do
      it '全ての必須項目が入力されており、各々の入力条件が全て満たされている場合' do
        expect(@form).to be_valid
      end

      it 'tag_nameが空の場合' do
        @form.tag_name = ""
        expect(@form).to be_valid
      end

      it 'reviewが空の場合' do
        @form.review = ""
        expect(@form).to be_valid
      end
    end

    context '新規作成出来ない' do
      it 'titleが空の場合' do
        @form.title = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Title can't be blank")
      end

      it 'titleが20文字以上の場合' do
        @form.title = Faker::Lorem.sentence(word_count: 21)
        @form.valid?
        expect(@form.errors.full_messages).to include("Title is too long (maximum is 20 characters)")
      end

      it 'tag_nameが10文字以上の場合' do
        @form.tag_name = Faker::Lorem.sentence(word_count: 11)
        @form.valid?
        expect(@form.errors.full_messages).to include("Tag name is too long (maximum is 10 characters)")
      end

      it 'reviewが1000文字以上の場合' do
        @form.review = Faker::Lorem.sentence(word_count: 1001)
        @form.valid?
        expect(@form.errors.full_messages).to include("Review is too long (maximum is 1000 characters)")
      end
    end
  end
end
