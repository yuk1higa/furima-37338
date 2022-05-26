# DB設計

## Users table
| Column           | Type                  | Options                             |
|------------------|-----------------------|-------------------------------------|
| nickname         | string                | null:false                          |
| email            | string                | null:false, unique :true            |
| password         | string                | null:false                          |
| zenkaku_name     | string                | null:false                          |
| kana_name        | string                | null:false                          |
| birthday         | integer               | null:false                          |

### Asociation

- has_many :items

## items table
| Column          | Type                    | Options                            |
|-----------------|-------------------------|------------------------------------|
| name            | string                  | null:false                         |
| text            | text                    | null:false                         |
| category        | string                  | null:false                         |
| joutai          | string                  | null:false                         |
| area            | string                  | null:false                         |
| nanniti         | string                  | null:false                         |
| price           | integer                 | null:false                         |
| user_id         | reference               | null:false, foreign_key: true      |

### Asociation

- belongs_to :user
- has_one :purchese_record

## purchase_record table
| Column           | Type                   | Options                             |
|------------------|------------------------|-------------------------------------|
| user_id          | reference              | null:false, foreign_key: true       |
| item_id          | reference              | null:false, foreign_key: true       |

### Asociation

belongs_to items
belongs_to shipping_infomation

## shipping_infomation
| Column           | Type                   | Options                             |
|------------------|------------------------|-------------------------------------|
| post_number      | integer                | null:false                          |
| prefecture       | string                 | null:false                          |
| municipalitie    | string                 | null:false                          |
| address_number   | integer                | null:false                          |
| building_name    | string                 |                                     |

### Asociation

belongs_to purchase_record