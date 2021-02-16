require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '新規作成' do
    before do
      @task = FactoryBot.build(:task) 
    end

    context '新規作成できる' do
      it '全ての必須項目が入力されており、各々の入力条件が全て満たされている場合' do
        expect(@task).to be_valid
      end

      it 'memoが空の場合' do
        @task.memo = ''
        expect(@task).to be_valid
      end
    end

    context '新規作成できない' do
      it 'task_titleが空の場合' do
        @task.task_title = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Task title can't be blank")
      end

      it 'task_titleが20文字以上の場合' do
        @task.task_title = Faker::Lorem.sentence(word_count: 21)
        @task.valid?
        expect(@task.errors.full_messages).to include("Task title is too long (maximum is 20 characters)")
      end

      it 'memoが100文字以上の場合' do
        @task.memo = Faker::Lorem.sentence(word_count: 101)
        @task.valid?
        expect(@task.errors.full_messages).to include("Memo is too long (maximum is 100 characters)")
      end

      it 'limit_dateが空の場合' do
        @task.limit_date = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Limit date can't be blank")
      end

      it 'userが紐づいていない場合' do
        @task.user = nil
        @task.valid?
        expect(@task.errors.full_messages).to include('User must exist')
      end
    end
  end
end
