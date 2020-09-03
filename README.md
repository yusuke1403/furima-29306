# テーブル設計

## users テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| family_name      | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name       | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birthday         | date       | null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| image              | string     | null: false                    |
| content            | string     | null: false                    |
| price              | integer    | null: false                    |
| Performance_id     | integer    | null: false, active_hash       |
| category_id        | integer    | null: false, active_hash       |
| postage_id         | integer    | null: false, active_hash       |
| Shipping_origin_id | integer    | null: false, active_hash       |
| post_time_id       | integer    | null: false, active_hash       |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase


## comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| comment          | text       |                                |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchases_id     | references | null: false, foreign_key: true |
| postal_code      | integer    | null: false                    |
| prefectures_id   | integer    | null: false, active_hash       |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| tel_number       | integer    | null: false                    |

### Association

- has_one  :purchases