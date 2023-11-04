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