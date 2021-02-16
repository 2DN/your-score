## users テーブル

| Column             | Type   | Options     |
| :----------------- | :----- | :---------- |
| username           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

-has_many :scores
-has_many :tasks



## scores テーブル

| Column                      | Type       | Options                        |
| :-------------------------- | :--------- | :----------------------------- |
| title                       | string     |                                | 
| jpn_ctp                     | integer    |                                | 現代文
| jpn_classic                 | integer    |                                | 古文
| jpn_chinese                 | integer    |                                | 漢文
| jpn                         | integer    |                                | 国語
| math_1_a                    | integer    |                                | 数学ⅠA
| math_2_b                    | integer    |                                | 数学ⅡB
| math_3_c                    | integer    |                                | 数学ⅢC
| math_1                      | integer    |                                | 数学Ⅰ
| math_2                      | integer    |                                | 数学Ⅱ 
| math_3                      | integer    |                                | 数学Ⅲ
| math_a                      | integer    |                                | 数学A
| math_b                      | integer    |                                | 数学B
| math_c                      | integer    |                                | 数学C
| math                        | integer    |                                | 数学
| book_keep                   | integer    |                                | 簿記・会計 
| basic_info                  | integer    |                                | 情報関係基礎
| science_n_life              | integer    |                                | 科学と人間生活
| basic_physics               | integer    |                                | 物理基礎
| physics                     | integer    |                                | 物理
| basic_chemistry             | integer    |                                | 化学基礎
| chemistry                   | integer    |                                | 化学
| basic_earth_science         | integer    |                                | 地学基礎
| earth_science               | integer    |                                | 地学
| basic_biology               | integer    |                                | 生物基礎
| biology                     | integer    |                                | 生物
| science                     | integer    |                                | 理科
| wld_history_a               | integer    |                                | 世界史A
| wld_history_b               | integer    |                                | 世界史B
| dms_history_a               | integer    |                                | 日本史A
| dms_history_b               | integer    |                                | 日本史B
| geography_a                 | integer    |                                | 地理A
| geography_b                 | integer    |                                | 地理B
| ctp_society                 | integer    |                                | 現代社会
| ethics                      | integer    |                                | 倫理
| politics_n_economy          | integer    |                                | 政治・経済
| ethics_n_politics_n_economy | integer    |                                | 倫理・政治・経済
| society                     | integer    |                                | 社会
| listening                   | integer    |                                | リスニング
| reading                     | integer    |                                | リーディング
| english                     | integer    |                                | 英語
| language                    | integer    |                                | 外国語
| review                      | string     |                                |
| user                        | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-has_many :averages
-has_many :subjects

## tags テーブル

| Column                          | Type       | Options                        |
| :------------------------------ | :--------- | :----------------------------- |
| tag_name                        | string     | uniqueness: true               | 

### Association

-has_many :score_tag_relations
-has_many :scores, through: :score_tag_relations

## score_tag_relations テーブル

| Column                          | Type       | Options                        |
| :------------------------------ | :--------- | :----------------------------- |
| score                           | references | null: false, foreign_key: true | 
| tag                             | references | null: false, foreign_key: true |

### Association

-belongs_to :score
-belongs_to :tag



## averages テーブル

| Column                          | Type       | Options                        |
| :------------------------------ | :--------- | :----------------------------- |
| avg_title                       | string     |                                | 
| avg_jpn_ctp                     | integer    |                                | 現代文(平均点)
| avg_jpn_classic                 | integer    |                                | 古文(平均点)
| avg_jpn_chinese                 | integer    |                                | 漢文(平均点)
| avg_jpn                         | integer    |                                | 国語(平均点)
| avg_math_1_a                    | integer    |                                | 数学ⅠA(平均点)
| avg_math_2_b                    | integer    |                                | 数学ⅡB(平均点)
| avg_math_3_c                    | integer    |                                | 数学ⅢC(平均点)
| avg_math_1                      | integer    |                                | 数学Ⅰ(平均点)
| avg_math_2                      | integer    |                                | 数学Ⅱ(平均点) 
| avg_math_3                      | integer    |                                | 数学Ⅲ(平均点)
| avg_math_a                      | integer    |                                | 数学A(平均点)
| avg_math_b                      | integer    |                                | 数学B(平均点)
| avg_math_c                      | integer    |                                | 数学C(平均点)
| avg_math                        | integer    |                                | 数学(平均点)
| avg_book_keep                   | integer    |                                | 簿記・会計(平均点) 
| avg_basic_info                  | integer    |                                | 情報関係基礎(平均点)
| avg_science_n_life              | integer    |                                | 科学と人間生活(平均点)
| avg_basic_physics               | integer    |                                | 物理基礎(平均点)
| avg_physics                     | integer    |                                | 物理(平均点)
| avg_basic_chemistry             | integer    |                                | 化学基礎(平均点)
| avg_chemistry                   | integer    |                                | 化学(平均点)
| avg_basic_earth_science         | integer    |                                | 地学基礎(平均点)
| avg_earth_science               | integer    |                                | 地学(平均点)
| avg_basic_biology               | integer    |                                | 生物基礎(平均点)
| avg_biology                     | integer    |                                | 生物(平均点)
| avg_science                     | integer    |                                | 理科(平均点)
| avg_wld_history_a               | integer    |                                | 世界史A(平均点)
| avg_wld_history_b               | integer    |                                | 世界史B(平均点)
| avg_dms_history_a               | integer    |                                | 日本史A(平均点)
| avg_dms_history_b               | integer    |                                | 日本史B(平均点)
| avg_geography_a                 | integer    |                                | 地理A(平均点)
| avg_geography_b                 | integer    |                                | 地理B(平均点)
| avg_ctp_society                 | integer    |                                | 現代社会(平均点)
| avg_ethics                      | integer    |                                | 倫理(平均点)
| avg_politics_n_economy          | integer    |                                | 政治・経済(平均点)
| avg_ethics_n_politics_n_economy | integer    |                                | 倫理・政治・経済(平均点)
| avg_society                     | integer    |                                | 社会(平均点)
| avg_listening                   | integer    |                                | リスニング(平均点)
| avg_reading                     | integer    |                                | リーディング(平均点)
| avg_english                     | integer    |                                | 英語(平均点)
| avg_language                    | integer    |                                | 外国語(平均点)
| score                           | references | null: false, foreign_key: true |

### Association

-belongs_to :score



## subjects テーブル

| Column                          | Type       | Options                        |
| :------------------------------ | :--------- | :----------------------------- |
| sub_title                       | string     |                                | 
| sub_jpn_ctp                     | string     |                                | 現代文
| sub_jpn_classic                 | string     |                                | 古文
| sub_jpn_chinese                 | string     |                                | 漢文
| sub_jpn                         | string     |                                | 国語
| sub_math_1_a                    | string     |                                | 数学ⅠA
| sub_math_2_b                    | string     |                                | 数学ⅡB
| sub_math_3_c                    | string     |                                | 数学ⅢC
| sub_math_1                      | string     |                                | 数学Ⅰ
| sub_math_2                      | string     |                                | 数学Ⅱ 
| sub_math_3                      | string     |                                | 数学Ⅲ
| sub_math_a                      | string     |                                | 数学A
| sub_math_b                      | string     |                                | 数学B
| sub_math_c                      | string     |                                | 数学C
| sub_math                        | string     |                                | 数学
| sub_book_keep                   | string     |                                | 簿記・会計 
| sub_basic_info                  | string     |                                | 情報関係基礎
| sub_science_n_life              | string     |                                | 科学と人間生活
| sub_basic_physics               | string     |                                | 物理基礎
| sub_physics                     | string     |                                | 物理
| sub_basic_chemistry             | string     |                                | 化学基礎
| sub_chemistry                   | string     |                                | 化学
| sub_basic_earth_science         | string     |                                | 地学基礎
| sub_earth_science               | string     |                                | 地学
| sub_basic_biology               | string     |                                | 生物基礎
| sub_biology                     | string     |                                | 生物
| sub_science                     | string     |                                | 理科
| sub_wld_history_a               | string     |                                | 世界史A
| sub_wld_history_b               | string     |                                | 世界史B
| sub_dms_history_a               | string     |                                | 日本史A
| sub_dms_history_b               | string     |                                | 日本史B
| sub_geography_a                 | string     |                                | 地理A
| sub_geography_b                 | string     |                                | 地理B
| sub_ctp_society                 | string     |                                | 現代社会
| sub_ethics                      | string     |                                | 倫理
| sub_politics_n_economy          | string     |                                | 政治・経済
| sub_ethics_n_politics_n_economy | string     |                                | 倫理・政治・経済
| sub_society                     | string     |                                | 社会
| sub_listening                   | string     |                                | リスニング
| sub_reading                     | string     |                                | リーディング
| sub_english                     | string     |                                | 英語
| sub_language                    | string     |                                | 外国語
| score                           | references | null: false, foreign_key: true |

### Association

-belongs_to :score



## tasks テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| task_title         | string     | null: false                    |
| memo               | string     |                                |
| limited_date       | date       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

-belongs_to :user

https://ya-score.herokuapp.com/
