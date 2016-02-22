#users表
use tera_db;
INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test1',
    'つば九朗',
    'つばくろう',
    'm',
    0,
    '1995/02/11 20:20:20',
    'tt14@mail.com',
    'tuba',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つばくろブログ',
    '/images/default/header.jpg',
    0,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    '酒が好きです',
    0
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag
    )
VALUES(
    'test2',
    '手須太郎',
    'てすたろう',
    'f',
    1,
    '1995/02/11 20:20:20',
    'tt15@mail.com',
    'tes',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'てすブログ',
    '/images/default/header.jpg',
    0,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'てｓとが好きです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test3',
    '小山次郎',
    'こやまじろう',
    'f',
    1,
    '1995/02/11 20:20:20',
    'tt16@mail.com',
    'koyazi',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
        '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'こやブログ',
    '/images/default/header.jpg',
    0,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    2,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    '小山学園が好きです',
    1
);


INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test4',
    'Cave johnson',
    'ケイブジョンソン',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt17@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    0,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    3,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'Aperture Sciencが好きです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test5',
    '土屋智也',
    'つちやともや',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt18@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    1,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'Aperture Sciencが好きです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test6',
    '情報処理科',
    'じょうほうしょりか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt19@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    7,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'Aperture Sciencが好きです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test7',
    '建築監督科',
    'けんちくかんとくか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt20@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    '建築監督科ブログ',
    '/images/default/header.jpg',
    2,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    '建築監督科のブログです',
    '建築監督科です',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test8',
    '建築科',
    'けんちくか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt21@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    '建築科ブログ',
    '/images/default/header.jpg',
    3,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    '建築科のブログです',
    '建築科の公式アカウントです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test9',
    '建築夜間',
    'けんちくやかん',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt22@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    '建築夜間ブログ',
    '/images/default/header.jpg',
    4,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    '建築夜間のブログです',
    '建築夜間公式アカウントです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test10',
    'インテリア科',
    'いんてりあか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt23@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'インテリア科ブログ',
    '/images/default/header.jpg',
    5,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'インテリア科のブログです',
    'インテリア科の公式アカウントです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test11',
    'ゲーム科',
    'げーむか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt24@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    6,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'Aperture Sciencが好きです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test12',
    'Webデザイナー科',
    'うぇぶでざいなーか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt25@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    8,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'Aperture Sciencが好きです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test13',
    '環境テクノロジー科',
    'かんきょうてくのろじーか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt26@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    9,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'Aperture Sciencが好きです',
    1
);

INSERT INTO users(
    login_id,
    user_name,
    user_name_kana,
    sex,
    sex_visible_flag,
    birth_date,
    mail_address,
    password,
    secret_answer,
    user_header_path,
    user_icon_path,
    blog_title,
    blog_header_path,
    admin_flag,
    last_login_date,
    admin_last_login_date,
    user_status_flag,
    user_lock_start_date,
    user_lock_end_date,
    blog_explanation,
    user_profile,
    blog_status_flag)
VALUES(
    'test14',
    'バイオテクノロジー科',
    'ばいおてくのろじーか',
    'm',
    1,
    '1995/02/11 20:20:20',
    'tt28@mail.com',
    'potal',
    '呉石先生',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '/TeraNavi/imgPath/default/default_user_icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    10,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    0,
    '2020/02/11 20:20:20',
    '2020/02/11 20:30:20',
    'このブログは楽しい',
    'Aperture Sciencが好きです',
    1
);

#secret_questions表
INSERT INTO secret_questions(secret_question_body)
VALUES('あなたの先生は？');

#communities表
-- community_delete_flagは通常→0　削除→1
INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    fk_user_id,
    community_delete_flag)
VALUES(
    'ブラックバスを釣ろうの会',
    'ブラックバスを釣るための知識を共有します',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '2001/02/11 20:30:20',
    1,
    0
);

INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    fk_user_id,
    community_delete_flag
)VALUES(
    'つちやを釣ろうの会',
    'つちやを釣るための知識を共有します',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '2001/02/11 20:30:20',
    2,
    0
);

INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    fk_user_id,
    community_delete_flag
)VALUES(
    'テラカフェ公式コミュ',
    'テラカフェの公式コミュニティです！',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '2001/02/11 20:30:20',
    2,
    0
);

INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    fk_user_id,
    community_delete_flag
)VALUES(
    'くらもちを讃える会',
    'くらもちお嬢を讃える会です。',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '2001/02/11 20:30:20',
    1,
    1
);

INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    fk_user_id,
    community_delete_flag
)VALUES(
    '土屋について語りあう会',
    '土屋による土屋のためのコミュニティです。',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '2001/02/11 20:30:20',
    2,
    1
);


INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    fk_user_id,
    community_delete_flag
)VALUES(
    '南條愛乃について語りあう会',
    '土屋による南條愛乃さんへの愛を語っていくコミュニティです。',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    'http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png',
    '2001/02/11 20:30:20',
    2,
    0
);

-- community_member_list
INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    6,
    3,
    1,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    7,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    8,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    9,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    10,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    11,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    12,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    13,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    14,
    3,
    0,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    1,
    1,
    1,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    3,
    2,
    1,
    0
);

INSERT INTO community_members_list(
    fk_user_id,
    fk_community_id,
    -- 一般ユーザは0, 管理者は1
    community_admin_flag,
    -- 退会フラグ。通常は0、退会は1
    community_withdrawal_flag
)VALUES(
    5,
    6,
    0,
    0
);

#articles表
-- article_status_flagは公開→0 下書き→1 削除→2
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    1,
    '「アメリカでは土屋は出世できない」← これ本当？',
    '彼らは生涯どうもその説明目というもののためを思わたなけれ。引続き翌日を影響家も何ともその応用ならたまでが忘れからいるないをはお話書いたらしくから、そうにもよるませなけれましです。世の中が向くないのもまず時間をもうなうた。何だか嘉納さんが活動専門どう講演へくっついでしょ心この自分我々か評価がというご意味ますたですあって、同じ場合はあなたか人格事にありから、大森さんののに浮華の何をざっとお持と云っていつ自信をご手続きに云っように一々お批評が思っだありて、いやしくもよく発展に思ったからみるありのをかけですます。',
    '2004/02/11 20:30:20',
    0
);

INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    12,
    '寄り道しても、回り道しても、ふり返れば一本の育毛。',
    '猫はゴーシュのぼんやりゴーシュめを楽譜を聞える町はずれんた。するとぎっしり気の毒ましたという舞台たまし。変たんのたもますそして眼の残念汁のままではもう勝手ますですて、みんなだけゴーシュをわからられるんたた。あけ過ぎこれはかっこうに物すごいたからさっきのからだの風人を合せ第一評判たちの遠慮へおろしが来いたた。ゴーシュは毎晩やっているまし。',
    '2004/02/11 20:30:20',
    0
);


INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    2,
    '土屋について語るときに僕の語ること',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    1
);

INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    4,
    '貧困と土屋 - 格差社会を考えるヒント　',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    1
);


INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    2,
    'ゼロから始めるテクニカルカレッジ活用術',
    'パンは間の練習うち屋から糸に歩き勢たない。それからまっすぐ気の毒ないますという鼻でた。いいかげんですでんましはましでは舞台の気の毒汁の所をはどうか生意気たでしと、こればかり助けから過ぎがっことでしだ。
ひるますぎこれは小麦に情ないないながらはじめの椅子のふしぎ会が云っ第十うそ弾の病気をしょっながら直しだで。けちも前弾けて来た。弓も一叫びセロのようとなりて出した。',
    '2004/02/11 20:30:20',
    2
);

INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    13,
    'テストでーた',
    'パンは間の練習うち屋から糸に歩き勢たない。それからまっすぐ気の毒ないますという鼻でた。いいかげんですでんましはましでは舞台の気の毒汁の所をはどうか生意気たでしと、こればかり助けから過ぎがっことでしだ。
    ひるますぎこれは小麦に情ないないながらはじめの椅子のふしぎ会が云っ第十うそ弾の病気をしょっながら直しだで。けちも前弾けて来た。弓も一叫びセロのようとなりて出した。',
    '2004/02/11 20:30:20',
    2
);

-- 各科ごとの記事
-- 情報6
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    6,
    '情報処理ブログ移行しました！',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- 建築監督
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    7,
    '建築監督、初投稿',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- 建築
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    8,
    'ロマネスク様式',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- 建築夜間
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    9,
    '夜の学校で学ぶ建築',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- インテリア
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    10,
    'センスはロジックだ',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- ゲーム
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    11,
    'サイン、コサイン、タンジェント？',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- web
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    12,
    'フォトショップ入門',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- 環境
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    13,
    '就活スタート！～企業研究会開催～',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);

-- バイオ
INSERT INTO articles(
    fk_user_id,
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    14,
    'バイオカフェのご案内',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    0
);



#tags表
INSERT INTO tags(tag_name) VALUES('テラカフェ');
INSERT INTO tags(tag_name) VALUES('情報処理科');
INSERT INTO tags(tag_name) VALUES('オープンキャンパス');
INSERT INTO tags(tag_name) VALUES('とうやま');
INSERT INTO tags(tag_name) VALUES('土屋智也');
INSERT INTO tags(tag_name) VALUES('お嬢');
INSERT INTO tags(tag_name) VALUES('デザイン');
INSERT INTO tags(tag_name) VALUES('伊藤園');



#comments表
INSERT INTO comments(
    comment_date,
    comment_body,
    comment_delete_flag)VALUES(
    '2004/02/11 20:30:20',
    '楽しいですね',
    1
);

INSERT INTO comments(
    comment_date,
    comment_body,
    comment_delete_flag)VALUES(
    '2004/02/11 20:30:20',
    '楽しいですね',
    2
);


#dm表
    INSERT INTO direct_messages(
    message_body,
    message_date)VALUES(
    '遊んでー',
    '2004/02/11 20:30:20'
);


#contacts表
INSERT INTO contacts(
    contact_user_name,
    contact_title,
    contact_body,
    contact_date,
    contact_address,
    contact_category
)VALUES(
    '土屋智也',
    'お問い合わせです',
    'お問い合わせしました',
    '2004/02/22 20:30:20',
    'tsuchiya@mail.com',
    'その他'
);


#cautions表
INSERT INTO cautions(
    fk_user_id,
    fk_caution_user_id,
    caution_date,
    caution_title,
    caution_body,
    report_page_url
)VALUES(
    1,2,
    '2004/02/14 20:30:20',
    '警告です',
    '警告文です',
    'http://www.keikoku.com'
);


#topic表
INSERT INTO topics(
    fk_community_id,
    fk_create_user_id,
    topic_name,
    topic_updatetime_date,
    topic_created_date
)VALUES(
    1,
    5,
    '伊藤園1',
    '2004/02/14 20:30:20',
    '2004/02/13 20:30:20'
);

INSERT INTO topics(
    fk_community_id,
    fk_create_user_id,
    topic_name,
    topic_updatetime_date,
    topic_created_date
)VALUES(
    2,
    5,
    '伊藤園2',

    '2004/02/14 20:30:20',
    '2004/02/13 20:30:20'
);

INSERT INTO topics(
    fk_community_id,
    fk_create_user_id,
    topic_name,
    topic_updatetime_date,
    topic_created_date
)VALUES(
    3,
    5,
    '伊藤園3',
    '2004/02/14 20:30:20',
    '2004/02/13 20:30:20'
);

INSERT INTO topics(
    fk_community_id,
    fk_create_user_id,
    topic_name,
    topic_updatetime_date,
    topic_created_date
)VALUES(
    4,
    5,
    '伊藤園',
    '2004/02/14 20:30:20',
    '2004/02/13 20:30:20'
);

INSERT INTO topics(
    fk_community_id,
    fk_create_user_id,
    topic_name,
    topic_updatetime_date,
    topic_created_date
)VALUES(
    5,
    5,
    '伊藤園',
    '2004/02/14 20:30:20',
    '2004/02/13 20:30:20'
);


#chat表
INSERT INTO chat(
    fk_user_id,
    fk_topic_id,
    chat_body,
    chat_date,
    chat_delete_flag
)VALUES(
    5,
    1,
    'おーいお茶が美味しい',
    '2002/02/14 20:30:20',
    0
);

INSERT INTO chat(
    fk_user_id,
    fk_topic_id,
    chat_body,
    chat_date,
    chat_delete_flag
)VALUES(
    4,
    2,
    'おーいお茶が美味しい',
    '2002/02/14 20:30:20',
    1
);

INSERT INTO chat(
    fk_user_id,
    fk_topic_id,
    chat_body,
    chat_date,
    chat_delete_flag
)VALUES(
    5,
    2,
    'おーいお茶が美味しい',
    '2002/02/14 20:30:20',
    1
);


#sign_up_keys表
INSERT INTO sign_up_keys(key_status)VALUES(0);


#policy表
INSERT INTO policy(
    policy_date,
    policy_body
)VALUES(
    '2002/02/14 20:30:20',
    'プライバシーポリシーです'
);


#rules表
INSERT INTO rules(
    rule_date,
    rule_body
)VALUES(
    '2002/02/14 20:30:20',
    '<h1 style="text-align:center;">利用規約</h1>

    <p>本利用規約（以下「本規約」と言います。）には、本サービスの提供条件及び当校と登録ユーザの皆様との間の権利義務関係が定められています。</p>
    <p>本サービスの利用に際しては、本規約の全文をお読みいただいたうえで、本規約に同意していただく必要があります。</p>

    <h3 style="text-align:center;">第1条（適用）</h3>
    <p>本規約は、本サービスの提供条件及び本サービスの利用に関する当校と登録ユーザとの間の権利義務関係を定めることを目的とし、</p>
    <p>登録ユーザと当校との間の本サービスの利用に関わる一切の関係に適用されます。</p>
    <p>当校が当校ウェブサイト上で掲載する本サービス利用に関するルール（https://…）は、本規約の一部を構成するものとします。</p>
    <p>本規約の内容と、前項のルールその他の本規約外における本サービスの説明等が異なる場合は、本規約の規定が優先して適用されるものとします。</p>

    <h3 style="text-align:center;">第2条（定義）</h3>
    <p>本規約において使用する以下の用語は、各々以下に定める意味を有するものとします。</p>
    <ol>
        <li>「本サービス規約」とは、本規約及び当校と登録ユーザの間で締結する、本サービスの利用規約を意味します。</li>
        <li>「知的財産権」とは、著作権、特許権、実用新案権、意匠権、商標権その他の知的財産権（それらの権利を取得し、又はそれらの権利につき登録等を出願する権利を含みます。）を意味します。</li>
        <li>「当校」とは、学校法人小山学園専門学校東京テクニカルカレッジを意味します。</li>
        <li>「当校ウェブサイト」とは、そのドメインが「〇〇」である、当校が運営するウェブサイト（理由の如何を問わず、当社のウェブサイトのドメイン又は内容が変更された場合は、当該変更後のウェブサイトを含みます。）を意味します。</li>
        <li>「登録ユーザ」とは、第３条（登録）に基いて本サービスの利用者としての登録がなされた個人又は法人を意味します。</li>
        <li>「本サービス」とは、当校が提供する〇〇という名称のサービス（理由の如何を問わずサービスの名称又は内容が変更された場合は、当該変更後のサービスを含みます。）を意味します。</li>
    </ol>

    <h3 style="text-align:center;">第3条（登録）</h3>
    <ol>
        <li>本サービスの利用を希望する者（以下「登録希望者」といいます。）は、本規約を遵守することに同意し、かつ当校の定める一定の情報（以下「登録事項」といいます。）を当校の定める方法で当校に提供することにより、当校に対し、本サービスの利用の登録を申請することができます。</li>
        <li>当校は、当校の基準に従って、第1項に基いて登録申請を行った登録希望者（以下「登録申請者」といいます。）の登録の可否を判断し、当校が登録を認める場合にはその旨を登録申請者に通知します。登録申請者の登録ユーザとしての登録は、当校が本項の通知を行ったことをもって完了したものとします。</li>
        <li>前項に定める登録完了時に、サービス利用規約が登録ユーザと当校の間に成立し、登録ユーザは本サービスを本規約に従い利用することができるようになります。</li>
        <li>当校は、登録申請者が、以下の各号のいずれかの事由に該当する場合は、登録及び再登録を拒否することがあり、またその理由について一切開示義務を負いません。</li>
        <ol>
            <li>当校に提供した登録事項の全部又は一部につき虚偽、誤記又は記載漏れがあった場合</li>
            <li>未成年者、成年被後見人、被保佐人又は被補助人のいずれかであり、法定代理人、後見人、保佐人又は補助人の同意等を得ていなかった場合</li>
            <li>反社会的勢力等（暴力団、暴力団員、右翼団体、反社会的勢力、その他これに準ずる者を意味します。以下同じ。）である、又は資金提供その他を通じて反社会的勢力等の維持、運営若しくは経営に協力若しくは関与する等反社会的勢力等と何らかの交流若しくは関与を行っていると当校が判断した場合</li>
            <li>登録希望者が過去当校との契約に違反した者またはその関係者であると当校が判断した場合</li>
            <li>第10条に定める措置を受けたことがある場合</li>
            <li>その他、当校が登録を適当でないと判断した場合</li>
        </ol>
    </ol>

    <h3 style="text-align:center;">第4条（登録事項の変更）</h3>
    <p>登録ユーザは、登録事項に変更があった場合、当校の定める方法により当該変更事項を遅滞なく当校に通知するものとします。</p>

    <h3 style="text-align:center;">第5条（パスワード及びユーザIDの管理）</h3>
    <ol>
        <li>登録ユーザは、自己の責任において、本サービスに関するパスワード及びユーザIDを適切に管理及び保管するものとし、これを第三者に利用させ、または貸与、譲渡、名義変更、売買等をしてはならないものとします。</li>
        <li>パスワード又はユーザIDの管理不十分、使用上の過誤、第三者の使用等によって生じた損害に関する責任は登録ユーザが負うものとし、当校は一切の責任を負いません。</li>
    </ol>

    <h3 style="text-align:center;">第6条（禁止事項）</h3>
    <p>登録ユーザは、本サービスの利用にあたり、以下の各号のいずれかに該当する行為又は該当すると当校が判断する行為をしてはなりません。</p>
    <ol>
        <li>法令に違反する行為又は犯罪行為に関連する行為</li>
        <li>当校、本サービスの他の利用者又はその他の第三者に対する詐欺又は脅迫行為</li>
        <li>公序良俗に反する行為</li>
        <li>当校、本サービスの他の利用者又はその他の第三者の知的財産権、肖像権、プライバシーの権利、名誉、その他の権利又は利益を侵害する行為</li>
        <li>本サービスを通じ、以下に該当し、または該当すると当校が判断する情報を当校又は本サービスの他の利用者に送信すること</li>
        <ul>
            <li>過度に暴力的又は残虐な表現を含む情報</li>
            <li>コンピューター・ウィルスその他の有害なコンピューター・プログラムを含む情報</li>
            <li>当校、本サービスの他の利用者又はその他の第三者の名誉又は信用を毀損する表現を含む情報</li>
            <li>過度にわいせつな表現を含む情報</li>
            <li>差別を助長する表現を含む情報</li>
            <li>自殺、自傷行為を助長する表現を含む情報</li>
            <li>薬物の不適切な利用を助長する表現を含む情報</li>
            <li>反社会的な表現を含む情報</li>
            <li>チェーンメール等の第三者への情報拡散を求める情報</li>
            <li>他人に不快感を与える表現を含む情報</li>
            <li>面識のない異性との出会いを目的とした情報</li>
        </ul>
        <li>本サービスのネットワークまたはシステム等に過度な負荷をかける行為</li>
        <li>本サービスの運営を妨害するおそれのある行為</li>
        <li>当校のネットワークまたはシステム等に不正にアクセスし、または不正なアクセスを試みる行為</li>
        <li>第三者に成りすます行為</li>
        <li>本サービスの他の利用者のIDまたはパスワードを利用する行為</li>
        <li>当校が事前に許諾しない本サービス上での宣伝、広告、勧誘、または営業行為</li>
        <li>本サービスの他の利用者の情報の収集</li>
        <li>当校、本サービスの他の利用者又はその他の第三者に不利益、損害、不快感を与える行為</li>
        <li>当校ウェブサイト上で掲載する本サービス利用に関するルール（https://…）に抵触する行為</li>
        <li>反社会的勢力等への利益供与</li>
        <li>面識のない異性との出会いを目的とした行為</li>
        <li>前各号の行為を直接又は間接に惹起し、または容易にする行為</li>
        <li>その他、当校が不適切と判断する行為</li>
    </ol>

    <h3 style="text-align:center;">第7条（本サービスの停止等）</h3>
    <ol>
        <li>当校は、以下のいずれかに該当する場合には、登録ユーザに事前に通知することなく、本サービスの全部又は一部の提供を停止又は中断することができるものとします。</li>
        <ol>
            <li>本サービスに係るコンピューター・システムの点検又は保守作業を緊急に行う場合</li>
            <li>コンピューター、通信回線等が事故により停止した場合</li>
            <li>地震、落雷、火災、風水害、停電、天災地変などの不可抗力により本サービスの運営ができなくなった場合</li>
            <li>その他、当校が停止又は中断を必要と判断した場合</li>
        </ol>
        <li>当校は、本条に基づき当校が行った措置に基づき登録ユーザに生じた損害について一切の責任を負いません。</li>
    </ol>

    <h3 style="text-align:center;">第8条（権利帰属）</h3>
    <ol>
        <li>当校ウェブサイト及び本サービスに関する知的財産権は全て当校又は当校にライセンスを許諾している者の知的財産権の使用許諾を意味するものではありません。</li>
        <li>登録ユーザは、投稿データについて、自らが投稿その他送信することについての適法な権利を有していること、および投稿データが第三者の権利を侵害していないことについて、投稿に対して表明し、保証するものとします。</li>
        <li>登録ユーザは、投稿データについて、当校に対し、世界的、非独占的、無償、サブライセンス可能かつ譲渡可能な使用、複製、配布、派生著作物の作成、表示及び実行に関するライセンスを付与します。また、他の登録ユーザに対しても、本サービスを利用してユーザが投稿その他送信した投稿データの使用、複製、配布、派生著作物を作成、表示及び実行することについての非独占的なライセンスを付与します。</li>
        <li>登録ユーザは、当校及び当校から権利を継承しまたは許諾された者に対して著作人格権を行使しないことに同意するものとします。</li>
    </ol>

    <h3 style="text-align:center;">第9条（登録抹消等）</h3>
    <ol>
        <li>当校は、登録ユーザが、以下の各号のいずれかの事由に該当する場合は、事前に通知又は催告することなく、投稿データを削除しもしくは当該登録ユーザとしての登録を抹消、もしくはサービス利用契約を解除することができます。</li>
        <ol>
            <li>本規約のいずれかの条項に違反した場合</li>
            <li>登録事項に虚偽の事実があることが判明した場合</li>
            <li>〇〇ヶ月以上本サービスの利用がない場合</li>
            <li>当校からの問い合わせその他の回答を求める連絡に対して〇〇間以上応答がない場合</li>
            <li>第3条第4項各号に該当する場合</li>
            <li>その他、当校が本サービスの利用、登録ユーザとしての登録、又はサービス利用契約の継続を適当でないと判断した場合</li>
        </ol>
        <li>当校は、本条に基づき当校が行った行為により登録ユーザに生じた損害について一切の責任を負いません。</li>
    </ol>

    <h3 style="text-align:center;">第10条（退会）</h3>
    <ol>
        <li>登録ユーザは、当校所定の方法で当校に通知することにより、本サービスから退会し、自己の登録ユーザとしての登録を抹消することができます。</li>
        <li>退会後の利用者情報の取り扱いについては、第15条の規定に従うものとします。</li>
    </ol>

    <h3 style="text-align:center;">第11条（本サービスの内容の変更、終了）</h3>
    <ol>
        <li>当校は、当校の都合により、本サービスの内容を変更し、または提供を終了することができます。当校が本サービスの提供を終了する場合、当校は登録ユーザに事前に通知するものとします。</li>
        <li>当校は、本条にもとづき当校が行った措置に基づき登録ユーザに生じた損害について一切の責任を負いません。</li>
    </ol>

    <h3 style="text-align:center;">第12条（保障の否認及び免責）</h3>
    <ol>
        <li>当校は、本サービスが登録ユーザの特定の目的に適合すること、期待する機能・商品的価値・正確性・有用性を有すること、登録ユーザによる本サービスの利用が登録ユーザに適用のある法令又は業界団体の内部規則等に適合すること、および不具合が生じないことについて、なんら保証するものではありません。</li>
        <li>当校は、当校による本サービスの提供の中断、停止、終了、利用不能又は変更、登録ユーザの登録の抹消、本サービスの利用による登録データの消失又は機器の故障もしくは損傷、その他本サービスに関して登録ユーザが被った被害（以下「ユーザ損害」といいます。）につき、賠償する責任を一切負わないものとします。</li>
        <li>何らかの理由により当校が責任を負う場合であっても、当校は、ユーザ損害につき、〇〇円の金額を超えて賠償する責任を負わないものとし、また、付随的損害、間接損害、特別損害、将来の損害及び逸失利益にかかる損害については、賠償する責任を負わないものとします。</li>
        <li>本サービス又は当校ウェブサイトに関連して登録ユーザと他の登録ユーザ又は第三者との間において生じた取引、連絡、紛争等については、当校は一切責任を負いません。</li>
    </ol>

    <h3 style="text-align:center;">第13条（秘密保持）</h3>
    <p>登録ユーザは、本サービスに関連して当校が登録ユーザに対して秘密に取り扱うことを求めて開示した非公知の情報について、当校の事前の書面による承諾がある場合を除き、秘密に取り扱うものとします。</p>

    <h3 style="text-align:center;">第14条（利用者情報の取扱い）</h3>
    <ol>
        <li>当校による登録ユーザの利用者情報の取扱いについては、別途当校プライバシーポリシー（https://…）の定めによるものとし、登録ユーザはこのプライバシーポリシーに従って当校がユーザの利用者情報を取扱うことについて同意するものとします。</li>
        <li>当校は、登録ユーザが当校に提供した情報、データ等を、個人を特定できない形での統計的な情報として、当校の裁量で、利用及び公開することができるものとし、ユーザはこれに異議を唱えないものとします。</li>
    </ol>

    <h3 style="text-align:center;">第15条（本規約等の変更）</h3>
    <p>当校は、本規約を変更できるものとします。当校は、本規約を変更した場合には、登録ユーザに当該変更内容を通知するものとし、当該変更内容の通知後、登録ユーザが本サービスを利用した場合又は当校の定める期間内に登録抹消の手続をとらなかった場合には、登録ユーザは、本規約の変更に同意したものとみなします。</p>


    <h3 style="text-align:center;">第16条（連絡／通知）</h3>
    <p>本サービスに関する問い合わせその他登録ユーザから当校に対する連絡又は通知、及び本規約の変更に関する通知その他当校から登録ユーザに対する連絡又は通知は、当校の定める方法で行うものとします。</p>

    <h3 style="text-align:center;">第17条（利用契約上の地位の譲渡等）</h3>
    <ol>
        <li>登録ユーザは、当校の書面による事前の承諾なく、利用契約上の地位又は本規約に基づく権利もしくは義務につき、第三者に対し、譲渡、移転、担保設定、その他の処分をすることはできません。</li>
        <li>当校は本サービスにかかる事業を他社に譲渡した場合には、当該事業譲渡に伴い利用契約上の地位、本規約に基づく権利及び義務並びに登録ユーザの登録事項その他の顧客情報を当該事業譲渡の譲受人に譲渡することができるものとし、登録ユーザは、かかる譲渡につき本項において予め同意したものとします。なお、本項に定める事業譲渡には、通常の事業譲渡のみならず、会社分割その他事業が移転するあらゆる場合を含むものとします。
        </li>
    </ol>


    <h3 style="text-align:center;">第18条（分離可能性）</h3>
    <p>本規約のいずれかの条項又はその一部が、消費者契約法その他の法令等により無効又は執行不能と判断された場合であっても、本規約の残りの規定及び一部が無効又は執行不能と判断された規定の残りの部分は、継続して完全に効力を有するものとします。</p>

    <h3 style="text-align:center;">第19条（準拠法及び管轄裁判所）</h3>
    <ol>
        <li>本規約及びサービス利用契約の準拠法は日本法とします。</li>
        <li>本規約またはサービス利用契約に起因し、または関連する一切の紛争については、東京地方裁判所を第一審の専属的合意管轄裁判所とします。</li>
    </ol>

    <p style="text-align:right;">平成27年11月23日制定</p>
'
);
