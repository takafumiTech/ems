# README

## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| center_code         | text       | Not null            　　　　　　 |
| center_name         | text       | Not null                       |
| password            | text       | Not null                       |
| delivery            | integer    | Not null             　　　　　　|
| consumption_type_id | references | Not null                       |

### Association
- has_one    :standard_value
- has_many   :daily_deliveries
- has_many   :items
- has_many   :tweets
- has_many   :comments


## standard_valuesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_code         | text       | Not null            　　　　　　 |
| item_name         | text       | Not null                       |
| consumption       | integer    | Not null                       |
| consumption_dc    | integer    | Not null             　　　　　　|
| consumption_csc   | integer    | Not null                       |
| user              | references | Not null                       |

### Association
- belongs_to :user


## daily_deliveriesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_code         | text       | Not null            　　　　　　 |
| user              | references | Not null                       |

### Association
- belongs_to :user


## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_code         | text       | Not null            　　　　　　 |
| item_name         | text       | Not null                       |
| unit              | integer    | Not null                       |
| lead time         | integer    | Not null             　　　　　　|
| price             | integer    | Not null                       |
| current_amount    | integer    | Not null                       |
| score             | integer    |                                |
| user              | references | Not null             　　　　　　|
| daily_deliveries  | references | Not null                       |

### Association
- belongs_to :users
- belongs_to :daily_deliveries


## tweetsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | text       | Not null                       |
| amount            | integer    | Not null                       |
| deadline          | integer    | Not null                       |
| user              | references | Not null             　　　　　　|

### Association
- belongs_to :users
- has_many   :comments


## commentsテーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| content    | text       | Not null            　　　　　　 |
| tweet      | references | Not null, 外部キー            　 |
| user       | references | Not null, 外部キー　　　　　　　   |

### Association
- belongs_to :users
- belongs_to :comments