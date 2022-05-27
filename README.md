# DB設計

## Users table
| Column            | Type                  | Options                             |
|-------------------|-----------------------|-------------------------------------|
| nickname          | string                | null:false                          |
| email             | string                | null:false, unique :true            |
| encrypted_password| string                | null:false                          |
| first_name        | string                | null:false                          |
| last_name         | string                | null:false                          |
| kana_first_name   | string                | null:false                          |
| kana_last_name    | string                | null:false                          |
| birthday          | date                  | null:false                          |

### Asociation

- has_many :items
- has_many :purchese_records

## items table
| Column          | Type                    | Options                            |
|-----------------|-------------------------|------------------------------------|
| name            | string                  | null:false                         |
| text            | text                    | null:false                         |
| category_id     | integer                 | null:false                         |
| grade_id        | integer                 | null:false                         |
| postage_id      | integer                 | null:false                         |
| area_id         | integer                 | null:false                         |
| schedule_id     | integer                 | null:false                         |
| price           | integer                 | null:false                         |
| user            | reference               | null:false, foreign_key: true      |

### Asociation

- belongs_to :user
- has_one :purchese_record

## purchase_records table
| Column           | Type                   | Options                             |
|------------------|------------------------|-------------------------------------|
| user             | reference              | null:false, foreign_key: true       |
| item             | reference              | null:false, foreign_key: true       |

### Asociation

belongs_to :item
belongs_to :user
has_one :shipping_infomation

## shipping_infomations table
| Column           | Type                   | Options                             |
|------------------|------------------------|-------------------------------------|
| post_number      | string                 | null:false                          |
| area_id          | integer                | null:false                          |
| municipalitie    | string                 | null:false                          |
| address          | string                 | null:false                          |
| building_name    | string                 |                                     |
| phone_number     | string                 | null:false                          |

### Asociation

belongs_to :purchase_record