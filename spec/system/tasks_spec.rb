require 'rails_helper'

Capybara.app_host = 'http://google.com'
describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    let(:task_a) { FactoryBot.create(:task, name: 'ユーザーB', user: user_a) }
    before do
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      visit 'http://app:3000/login'
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a}
      it 'ユーザーAでが作成したタスクが表示される' do
        expect(page).to have_content '最初のタスク'
      end

    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_b}

      it 'ユーザーAが作成したタスクが表示されない' do
        expect(page).to have_no_content '最初のタスク'
      end
    end

    describe '詳細表示機能' do
      context ' ユーザーAガログインしているとき'
      let(:login_user) { user_a }

      before do
        page.save_screenshot "ss.png", full: true
        visit 'http://app:3000/tasks'
        click_link('最初のタスク')
        sleep 3
      end

      it 'ユーザーAが作成したタスクが表示される' do
        page.save_screenshot "sc.png", full: true
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end