# アプリケーション名
- 備品管理システム / EMS(Equipment Management System)

# アプリケーション概要
- 備品の次回購入日と購入数量が自動計算され、最小の在庫で備品運用できるシステム

# URL
[備品管理システム](https://ems-39380.onrender.com "EMS")

# テスト用アカウント
- Basic認証
ID   : admin
Pass : 2222

- アカウント
メールアドレス  : sample@gmail.com 
パスワード   　　 : sample1

# 利用方法
1. 新規登録または、ログインをする
2. 左側サイドバーの件数入力をクリックし、情報を登録する
3. 左側サイドバーの備品登録をクリックし、情報を登録する
4. メイン画面に登録した備品の購入予定日と数量が表示される
5. 毎日件数を入力すると購入予定日が更新され、購入予定日が1週間以内になると赤の下線が表示される
6. 購入予定日が近づき、備品を購入した際は各備品情報右側の購入ボタンをクリックし購入後の在庫数と購入日を入力するとメイン画面の購入予定日が更新される

# アプリケーションを作成した背景
現職の物流会社では備品管理ができておらず、何がどこに何個あるのかが分からない状態だった。そのため備品が過剰に溢れていたり、足らず他部署にもらうことが多々発生していた。メーカー物流のためローコストオペレーションが必要であり、備品というどの拠点も使用するもの仕組みを変えることでコスト削減が可能になるのではないかという改善活動の一環としてこのシステムを作成した。

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1q5b1nphNuOS4Xsm8X4cUrrEGo2ictZ00kmxV4Y5AZM4/edit?usp=sharing "要件定義")

# データベース設計
[![ER図](https://i.gyazo.com/60b04220ceab12a89901a1655c563604.png)](https://gyazo.com/60b04220ceab12a89901a1655c563604)

# 画面遷移図
[![画面遷移図](https://i.gyazo.com/d86ca25b0a81fd8f3ed0cc6737c85c0e.png)](https://gyazo.com/d86ca25b0a81fd8f3ed0cc6737c85c0e)

# 開発環境
- バックエンド (Ruby on Rails)
- フロントエンド (HTML)
- フロントエンド (CSS)
- デプロイ (Render)
- テスト
- タスク管理 (Github)

# 工夫したポイント
- 購入予定日を自動計算される仕組み作りを工夫した
備品を日々どれだけ消費しているのかを現場や昨年の備品購入実績をもとに調査を行い、配達一件あたりの備品消費量を計算した。それをリードタイム（納期）やイレギュラー対策の予備保管等を考慮して計算されるよう作業した。

- 計算式
①何件配達したら予備備品数量以下になるのか　= (現在の数量 - 予備備品数量) / 1件配達あたり消費数)
②リードタイムを除く後何日で予備備品数量以下になるのか = ① / 2週間の平均配達件数 - リードタイム
前回購入日から②の結果の日数後が購入予定日となる。

件数を２週間にすることで配達件数の曜日変動や月変動も考慮した計算が可能。

# README

## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| center_code         | string     | Not null                       |
| center_name         | string     | Not null                       |
| email               | string     | Not null                       |
| password            | string     | Not null                       |
| yearly_delivery     | integer    | Not null                       |
| consumption_type_id | integer    | Not null                       |

### Association
- has_many   :daily_counts
- has_many   :managements



## managementsテーブル

| Column                  | Type       | Options               |
| ----------------------- | ---------- | --------------------- |
| item_name               | string     | Not null, unique      |
| unit                    | integer    | Not null              |
| lead_time               | integer    | Not null              |
| current_amount          | integer    | Not null              |
| spare                   | integer    | Not null              |
| consumption_by_delivery | float      | Not null              |
| consumption_by_repair   | float      |                       |
| consumption_by_exchange | float      |                       |
| user                    | references | Not null, foreign_key |

### Association
- belongs_to :user


## daily_countsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| date              | date       | Not null, unique               |
| delivery_count    | integer    | Not null                       |
| repair_count      | integer    | Not null                       |
| exchange_count    | integer    | Not null                       |
| user              | references | Not null, foreign_key          |

### Association
- belongs_to :user
