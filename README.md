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
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| content            | text       | null: false                    |
| price              | integer    | null: false                    |
| performance_id     | integer    | null: false, active_hash       |
| category_id        | integer    | null: false, active_hash       |
| postage_id         | integer    | null: false, active_hash       |
| shipping_origin_id | integer    | null: false, active_hash       |
| post_time_id       | integer    | null: false, active_hash       |

### Association

- belongs_to :user
- has_one    :purchase
- belongs_to_active_hash :performance
- belongs_to_active_hash :category
- belongs_to_active_hash :postage
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :post_time

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchases        | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false, active_hash       |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| tel_number       | string     | null: false                    |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture