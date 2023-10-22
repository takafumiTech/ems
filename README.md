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
- has_many   :tweets
- has_many   :comments


## managementsテーブル

| Column                  | Type       | Options               |
| ----------------------- | ---------- | --------------------- |
| item_code               | string     | Not null              |
| item_name               | string     | Not null              |
| unit                    | integer    | Not null              |
| lead_time               | integer    | Not null              |
| price                   | integer    | Not null              |
| current_amount          | integer    | Not null              |
| spare                   | integer    | Not null              |
| consumption_by_delivery | integer    | Not null              |
| consumption_by_repair   | integer    | Not null              |
| consumption_by_exchange | integer    | Not null              |
| user                    | references | Not null, foreign_key |

### Association
- belongs_to :user


## daily_countsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| date              | date       | Not null                       |
| delivery_count    | integer    | Not null                       |
| repair_count      | integer    | Not null                       |
| exchange_count    | integer    | Not null                       |
| user              | references | Not null, foreign_key          |

### Association
- belongs_to :user


## tweetsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | text       | Not null                       |
| amount            | integer    | Not null                       |
| deadline          | integer    | Not null                       |
| user              | references | Not null                       |

### Association
- belongs_to :users
- has_many   :comments


## commentsテーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| content    | text       | Not null                       |
| tweet      | references | Not null, foreign_key          |
| user       | references | Not null, foreign_key          |

### Association
- belongs_to :users
- belongs_to :comments