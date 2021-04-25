# ながのCAKE　ECサイト

- 通販では注文に応じて製作する受注生産型としている。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
- 送料は1配送につき全国一律800円。  
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。  
- 支払方法はクレジットカード、銀行振込から選択できる。

# 開発環境

AWS Cloud9
Ruby ver. 2.6.3
Ruby on rails ver. 5.2.5

## 詳細

[会員側実装機能]
- 顧客の会員登録、ログイン、ログアウト、退会
- 会員のログインはメールアドレスとパスワード
- 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示する
- サイトの閲覧はログインなし
- 商品をカートに入れ、1度に複数種類、複数商品の購入ができること。また、カート内の商品は個数変更・削除ができる
- カートへの商品追加はログインなしでは行えない
- クレジットカード情報はシステム上保持しない
- 会員は配送先を複数登録しておくことが可能である
- 会員はマイページから、ユーザ情報の閲覧・編集、注文履歴の閲覧 、配送先の閲覧・編集
- 注文履歴一覧には、注文日・配送先・支払金額(商品合計+送料)・注文ステータスの情報が表示されること 
- 注文履歴詳細には、注文日・配送先・支払方法・注文ステータス・商品の注文内容詳細(商品名、単価、個数、小計)・請求情報(商品合計、送料、支払金額)の情報が表示されること 
- 会員登録時、名前(姓・名）・名前(カナ姓・カナ名)・郵便番号・住所・電話番号・メールアドレスパスワードの情報をユーザ情報として入力できること 
- 商品は税込価格で表示される
   
[店側実装機能]
- 管理者用メールアドレスとパスワードでログインできる(管理者用メールアド レスとパスワードは事前にデータベースへ登録)
- 商品について、新規追加・編集・販売停止(売切表示)が行える
- 商品情報は、商品名・商品説明文・ジャンル・税抜価格・商品画像・販売ステータスを持つ
- 会員登録されているユーザ情報の閲覧、編集、退会処理が行える
- ユーザの注文履歴が一覧・詳細表示できる
- 注文履歴には注文ごとに購入者・購入日・購入内容・請求額合計・配送先・注文ステータス・各注文商品の製作ステータス情報が表示される
- 注文ステータス、製作ステータスの更新ができる
    
## 環境構築

  git clone https://github.com/dwc-kabukiage/nagano-cake.git (HTTPS)
  or
  git clone git@github.com:dwc-kabukiage/nagano-cake.git (SSH)
  cd nagano-cake
  rails db:migrate
  rails db:seed
  bundle install


## 実装した機能
・Gem 
deviseを使用したログイン機能

refile/refile-mini_magickを使用した画像機能

bootstrapを使用したレイアウト・ステータスバー
Etc...

## 設計書

要件定義書
 https://wals.s3-ap-northeast-1.amazonaws.com/curriculum/ec_site/design_documents/commit_ecsite_rdd.pdf

顧客(member側）フレームワーク
https://s3-ap-northeast-1.amazonaws.com/wals/curriculum/ec_site/design_documents/wire_ec.pdf

管理人(manager側)フレームワーク
https://s3-ap-northeast-1.amazonaws.com/wals/curriculum/ec_site/design_documents/wire_admin.pdf

## 使用方法

顧客(member側)は新規作成でご自由に使用ください。

管理人(manager側)は以下の手順をご覧ください。
まず、管理人側はログアウト確認の上URLに直接以下のリンクを入力お願いします。
https://38fb6a1445a1435fbf58921ab0bc8e6b.vfs.cloud9.us-east-1.amazonaws.com/managers/sign_in

管理人ログイン画面は以下の通り入力をお願いします。
ログインアドレス　{m@m}
パスワード　{manager}


# 作者
鞠古兼寿　野村慧　檜垣成冶　今津達志
