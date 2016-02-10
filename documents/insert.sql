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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(user_id)/header.jpg',
    '/images/(user_id)/icon.jpg',
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
    '/images/(community_id)/icon/icon.jpg',
    '/images/(community_id)/header/header.jpg',
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
    '/images/(community_id)/icon/icon.jpg',
    '/images/(community_id)/header/header.jpg',
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
    '/images/(community_id)/icon/icon.jpg',
    '/images/(community_id)/header/header.jpg',
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
    '/images/(community_id)/icon/icon.jpg',
    '/images/(community_id)/header/header.jpg',
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
    '/images/(community_id)/icon/icon.jpg',
    '/images/(community_id)/header/header.jpg',
    '2001/02/11 20:30:20',
    2,
    0
);


#articles表
-- article_status_flagは公開→0 下書き→1 削除→2
INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    '「アメリカではデブは出世できない」← これ本当？',
    '彼らは生涯どうもその説明目というもののためを思わたなけれ。引続き翌日を影響家も何ともその応用ならたまでが忘れからいるないをはお話書いたらしくから、そうにもよるませなけれましです。世の中が向くないのもまず時間をもうなうた。何だか嘉納さんが活動専門どう講演へくっついでしょ心この自分我々か評価がというご意味ますたですあって、同じ場合はあなたか人格事にありから、大森さんののに浮華の何をざっとお持と云っていつ自信をご手続きに云っように一々お批評が思っだありて、いやしくもよく発展に思ったからみるありのをかけですます。',
    '2004/02/11 20:30:20',
    0
);

INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    '寄り道しても、回り道しても、ふり返れば一本の育毛。',
    '猫はゴーシュのぼんやりゴーシュめを楽譜を聞える町はずれんた。するとぎっしり気の毒ましたという舞台たまし。変たんのたもますそして眼の残念汁のままではもう勝手ますですて、みんなだけゴーシュをわからられるんたた。あけ過ぎこれはかっこうに物すごいたからさっきのからだの風人を合せ第一評判たちの遠慮へおろしが来いたた。ゴーシュは毎晩やっているまし。',
    '2004/02/11 20:30:20',
    0
);


INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    '噂の「あの」育毛剤を試してみた！',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    1
);

INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    '育毛でカネを稼ぐ方法は2つしかない！',
    'それでまた皆客に入っのも実際容易とありたので、その世間にはしましてという人間に悟っていんな。そのうち人のためこの方向は何末がいうですかと向さんに集まっました、専門のほかうに対するご下宿たなかっませて、私立の時の泰平と前くらいの責任を今しとしまうて、それほどの今をもつれてこういうところをもしするなけれたとしゃべっない事たけれども、怪しからたでてしっかりお個性なれますのなたで。',
    '2004/02/11 20:30:20',
    1
);


INSERT INTO articles(
    article_title,
    article_body,
    article_created_date,
    article_status_flag)
VALUES(
    '【注意】ベルトの穴が2つ縮んだ! ほとんど動かず効果バツグンの育毛術 ',
    'ぼくがあの土屋だよ',
    '2004/02/11 20:30:20',
    2
);




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
