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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
    'てすブログ',
    '/images/default/header.jpg',
    1,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    1,
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
    'こやブログ',
    '/images/default/header.jpg',
    1,
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
    'つちやブログ',
    '/images/default/header.jpg',
    1,
    '1995/02/11 20:20:30',
    '1995/02/11 20:20:40',
    3,
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
INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    community_delete_flag)
VALUES(
    'ブラックバスを釣ろうの会',
    'ブラックバスを釣るための知識を共有します',
    '/images/(community_id)/icon/icon.jpg',
    '/images/(community_id)/header/header.jpg',
    '2001/02/11 20:30:20',
    0
);

INSERT INTO communities(
    community_name,
    community_profile,
    community_icon_path,
    community_header_path,
    community_created_date,
    community_delete_flag
)VALUES(
    'ブラックバスを釣ろうの会',
    'ブラックバスを釣るための知識を共有します',
    '/images/(community_id)/icon/icon.jpg',
    '/images/(community_id)/header/header.jpg',
    '2001/02/11 20:30:20',
    1
);


#articles表
INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    'つちやぶろぐ',
    'ぼくがあの土屋だよ',
    '2004/02/11 20:30:20',
    0
);

INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    'つちやぶろぐ',
    'ぼくがあの土屋だよ',
    '2004/02/11 20:30:20',
    1
);

INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    'つちやぶろぐ',
    'ぼくがあの土屋だよ',
    '2004/02/11 20:30:20',
    2
);


#community_members_list表
INSERT INTO community_members_list(community_admin_flag)VALUES(0);
INSERT INTO community_members_list(community_admin_flag)VALUES(1);


#tags表
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
    caution_date,
    caution_title,
    caution_body,
    report_page_url
)VALUES(
    '2004/02/14 20:30:20',
    '警告です',
    '警告文です',
    'http://www.keikoku.com'
);


#topic表
INSERT INTO topics(
    topic_name,
    topic_updatetime_date,
    topic_created_date
)VALUES(
    '伊藤園',
    '2004/02/14 20:30:20',
    '2004/02/13 20:30:20'
);


#chat表
INSERT INTO chat(
    chat_body,
    chat_date,
    chat_delete_flag
)VALUES(
    'おーいお茶が美味しい',
    '2002/02/14 20:30:20',
    0
);

INSERT INTO chat(
    chat_body,
    chat_date,
    chat_delete_flag
)VALUES(
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
    '規約です'
);
