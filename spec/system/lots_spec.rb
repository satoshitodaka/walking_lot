require 'rails_helper'

RSpec.describe "Lots", type: :system do
  let!(:user) { create(:user) }
  let!(:location_type) { create(:location_type) }
  let!(:activity) { create(:activity) }
  let!(:activity_location_type) { create(:activity_location_type, activity: activity, location_type: location_type) }

  describe 'くじを作成する' do
    context '未ログインユーザー' do
      it 'くじを作成できる' do
        visit '/'
        within '#header' do
          click_on 'くじを引く'
        end
        select 'どこでも', from: 'lot_location_type_id'
        fill_in '出発地の名称', with: 'hogehoge'
        fill_in '出発地の住所', with: '44803 村上, 新長谷川市, 20 673-0505'
        map = find('#map').native
        page.driver.browser.action.move_to(map, 200, 190).click.perform
        click_on '登録する'
        expect(page).to have_content '散歩くじの結果'
      end
    end
    
    context 'ログインユーザー' do
      before do
        login_as(user)
      end
      it 'くじを作成できる' do
        within '#header' do
          click_on 'くじを引く'
        end
        select 'どこでも', from: 'lot_location_type_id'
        fill_in '出発地の名称', with: 'hogehoge'
        fill_in '出発地の住所', with: '44803 村上, 新長谷川市, 20 673-0505'
        map = find('#map').native
        page.driver.browser.action.move_to(map, 200, 190).click.perform
        click_on '登録する'
        expect(page).to have_content '散歩くじの結果'
      end
    end
  end
end

  