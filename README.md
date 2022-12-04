# 散歩くじ
## サービスURL
https://www.walking-lot.com/

## 概要
- 「散歩くじ」は散歩の行先と目的をくじ引きのように提案するサービスです。
- 行先のタイプと出発地点を登録することで、くじの結果（行先とアクティビティ）が表示されます。
  - 行先は、出発地点から半径約2km以内のスポットをランダムに取得して提示します。
  - アクティビティは、予め用意したものの中から行先のタイプに応じたものをランダムで選択し、提示します。
- また、「寄り道スポット」として、目的地の他にも同様のスポットをユーザーに提示します。
- くじの結果はSNSで共有することができます。

## 目的・作ろうと思ったきっかけ
- 私たちの日常の行動範囲は限られていて、近隣に良いスポットがあっても気づかないことが多く、非常にもったいないと感じていました。
- そういった点では、新しい旅先をガチャ形式で提案してくれるPeach航空の[旅くじ](https://www.flypeach.com/campaign/shakelabo/tabikuji/)がすごく良いアイデアだなと感じています。
- 飛行機の旅は少々お金と時間がかかりますので、散歩程度の小さな旅をくじ引きのように提案できるサービスがあれば良いなと考え、本サービスを開発しました。

## 使い方
1. 行先と出発地点を選択し、くじを引きます。出発地点は地図クリック・現在地取得・地名検索より設定します。
[![Image from Gyazo](https://i.gyazo.com/36a6dab420a469b5a814fa9e45f71613.png)](https://gyazo.com/36a6dab420a469b5a814fa9e45f71613)
2. くじの結果を確認し、目的地まで散歩しましょう！ルートの指定はありませんが、不安であればGoogleMapを開いて確認してください。
[![Image from Gyazo](https://i.gyazo.com/4da2b58172be56597f234bded8872f69.png)](https://gyazo.com/4da2b58172be56597f234bded8872f69)
4. 余裕があれば、表示された目的（アクティビティ）にチャレンジしたり、寄り道スポットに立ち寄ったりするのも良いでしょう。
[![Image from Gyazo](https://i.gyazo.com/fffc99108d5d39e74aece5ae298f5daf.png)](https://gyazo.com/fffc99108d5d39e74aece5ae298f5daf)
5. 気に入ってもらえたら、ご家族や友人にシェアできます。
6. ユーザー登録をすることで、アクティビティの作成・くじの履歴管理ができます。

## 主な機能
### User認証
- メールアドレスとパスワードを用いた通常のユーザー認証
- TwitterとLINEを用いたユーザー認証
- パスワードリセット機能
### くじ引き
- くじの作成・表示
- GoogleMapsAPIを用いた位置情報の取得
- GoogleMapsAPIを用いた目的地情報の取得(PlaceAPIとNearbySearch)
- くじの結果のSNSシェア機能
### マイページ（ログイン後）
- くじの履歴管理（一覧と詳細確認）
- 通知機能
### アクティビティ管理（ログイン後）
- アクティビティの作成・管理

## 使用している言語や環境、テクノロジーなど
### 言語・フレームワーク
- Ruby 3.1.2
- Ruby on Rails 7.0.4
- DaisyUI(TailwindCSS)
### データベース
- MySQL
### 環境構築
- Docker
### 外部API
- GoogleMap Maps API
  - 地図の表示
- GoogleMap Places API
  - 出発地点の取得（検索と現在地取得）
  - 目的地情報の取得
### ジョブワーカー
- Sidekiq
### CI
- GithubActions
### 本番環境
#### デプロイ先
 - Heroku
#### ストレージ
- AWS S3
#### メールサービス
- Sendgrid
### その他使用している主なGemについて
#### User認証
- sorcery
#### 管理画面
- rails_admin
- cancancan
#### 定数管理
- config
#### 検索機能
- ransack
#### ページネーション
- pagy

## インストールと環境構築
```
$ git clone https://github.com/satoshitodaka/walking_lot.git
$ docker-compose build --no-cache
$ docker-compose run --rm web bin/setup
$ docker-compose up -d
```
## 工夫したところ
### 簡単に使ってもらえるを意識した
- ユーザー未登録でもサービス利用できるようにし、気軽に試してもらえるように意識しました。くじを引くというコア機能も極力、利用の手間を省くことを意識しています。
- また、ユーザー登録の工数削減のため、各種SNSログインを用意しています。
### プライバシーへの配慮
- くじの結果をSNSにシェアする場合、内容に位置情報を含むため、プライバシーに配慮する必要があります。くじのIDにUUIDを利用する、SNSシェア時の注意喚起するなどを対応しました。
### 散歩というコンテンツの提供を意識
- このアプリのコア機能は、くじを引くという非常にシンプルなものです。そのため、散歩のメリットについてのコンテンツを用意して散歩自体をユーザーにリコメンドし、その中で「散歩くじ」を活用してもらえるよう意識しました。

## 今後の計画と検討中の内容
- 寄り道スポットの設定の精度を向上させ、より寄り道しやすいスポットを設定できるよう改善する。
- 管理ユーザー向け画面の実装（現在は管理画面をgem 'rails-admin'を使用）
- アクティビティに大吉から大凶までのレベルを設定する。違うレベルのアクティビティを設定できるようにすると、イタズラ的なアクティビティを設定できるので、アクティビティ登録（ユーザー登録）、サービス利用のモチベーションが向上するかもしれない。
