require 'rails_helper'

RSpec.describe 'Lots', type: :system do
  let!(:user) { create(:user) }
  let!(:location_type) { create(:location_type) }
  let!(:activity) { create(:activity) }
  let!(:activity_location_type) { create(:activity_location_type, activity: activity, location_type: location_type) }

  describe '地図をクリックしてくじを作成する' do
    context '未ログインユーザー' do
      it 'くじを作成できる' do
        visit '/'
        within '#header' do
          click_on 'くじを引く'
        end
        select 'どこでも', from: 'lot_location_type_id'
        find('#map').click.click(x: 30, y: 30)
        find('#map').click.click(x: 30, y: 30)
        find('#map').click.click(x: 30, y: 30)
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
        find('#map').click.click(x: 30, y: 30)
        find('#map').click.click(x: 30, y: 30)
        find('#map').click.click(x: 30, y: 30)
        click_on '登録する'
        expect(page).to have_content '散歩くじの結果'
      end
    end
  end

  describe '現在地を取得してくじを作成する' do
    context '未ログインユーザー' do
      it 'くじを作成できる' do
        visit '/'
        within '#header' do
          click_on 'くじを引く'
        end
        select 'どこでも', from: 'lot_location_type_id'
        page.execute_script 'navigator.geolocation.getCurrentPosition = function(success) { success({coords: {latitude: 35.6895014, longitude: 139.6917337}}); }'
        click_on '現在地から歩く'
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
        page.execute_script 'navigator.geolocation.getCurrentPosition = function(success) { success({coords: {latitude: 35.6895014, longitude: 139.6917337}}); }'
        click_on '現在地から歩く'
        click_on '登録する'
        expect(page).to have_content '散歩くじの結果'
      end
    end
  end

  describe '出発地を検索してくじを作成する' do
    context '未ログインユーザー' do
      xit 'くじを作成できる' do
        visit '/'
        within '#header' do
          click_on 'くじを引く'
        end
        select 'どこでも', from: 'lot_location_type_id'
        fill_in '検索', with: '東京駅'
        within 'setStartPoint' do
          click_on 'ここから歩く'
        end
        click_on '登録する'
        expect(page).to have_content '散歩くじの結果'
      end
    end

    context 'ログインユーザー' do
      before do
        login_as(user)
      end
      xit 'くじを作成できる' do
        within '#header' do
          click_on 'くじを引く'
        end
        select 'どこでも', from: 'lot_location_type_id'
        find('#map').click
        click_on '登録する'
        expect(page).to have_content '散歩くじの結果'
      end
    end
  end
end
