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

- has_many :item
- has_one :purchese_record

## items table
| Column          | Type                    | Options                            |
|-----------------|-------------------------|------------------------------------|
| name            | string                  | null:false                         |
| text            | text                    | null:false                         |
| category        | integer                 | null:false                         |
| grade           | integer                 | null:false                         |
| postage         | integer                 | null:false                         |
| area            | integer                 | null:false                         |
| Schedule        | integer                 | null:false                         |
| price           | integer                 | null:false                         |
| user_id         | reference               | null:false, foreign_key: true      |

### Asociation

- belongs_to :user
- has_one :purchese_record

## purchase_records table
| Column           | Type                   | Options                             |
|------------------|------------------------|-------------------------------------|
| user_id          | reference              | null:false, foreign_key: true       |
| item_id          | reference              | null:false, foreign_key: true       |

### Asociation

belongs_to :items
belongs_to :user
has_one :shipping_infomation

## shipping_infomations table
| Column           | Type                   | Options                             |
|------------------|------------------------|-------------------------------------|
| post_number      | string                 | null:false                          |
| area             | integer                | null:false                          |
| municipalitie    | string                 | null:false                          |
| address          | string                 | null:false                          |
| building_name    | string                 |                                     |
| phone_number     | integer                | null:false                          |

### Asociation

belongs_to :purchase_record