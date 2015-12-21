#データベース作成
create database tera_db character set utf8;
#ユーザー作成
create user 'TERA_NAVI'@'localhost' identified by 'tera';
#権限追加
grant all privileges on tera_db.* to 'TERA_NAVI'@'localhost';
#追加した権限を適用
FLUSH PRIVILEGES;
#秘密の質問表
create table tera_db.secret_questions(secret_question_id char(1) primary key,
									  secret_question_body varchar(80) not null,index(secret_question_id)) engine=InnoDB;
#ユーザー表
create table tera_db.users(user_id char(8) primary key,login_id varchar(30) not null unique,
						   user_name varchar(100) not null,user_name_kana varchar(100) not null,sex char(1) not null,sex_visible_flag char(1) default '0',
						   birth_date char(8) not null,mail_address varchar(40) not null unique,
						   password varchar(10) not null,fk_secret_question_id char(1),secret_answer varchar(100) not null,
						   user_header_path varchar(255) default 'WEB-INF/img/default_user_header.img',user_icon_path varchar(255) default 'WEB-INF/img/default_user_icon.img',
						   blog_title varchar(200) default 'ようこそブログへ',blog_header_path varchar(255) default 'WEB-INF/img/default_blog_header.img',
						   admin_flag char(1) not null,last_login_date char(8),admin_last_login_date char(8),user_status_flag char(1) not null,user_lock_start_date date,
						   user_lock_end_date date,blog_explanation varchar(100),user_profile varchar(2000),blog_status_flag char(1) default '0',index(fk_secret_question_id),index(user_id),index(user_name),
						   foreign key(fk_secret_question_id) references tera_db.secret_questions(secret_question_id))engine=InnoDB;
#　コミュニティ表
create table tera_db.communities(community_id char(10) primary key,community_name varchar(50),community_profile varchar(400),
								 community_icon_path varchar(255) default 'WEB-INF/img/default_community_icon.img',community_header_path varchar(255) default 'WEB-INF/img/default_community_header.img',
								 community_created_date date,fk_user_name varchar(100),community_delete_flag char(1) not null,index(community_id),
								 foreign key(fk_user_name) references tera_db.users(user_name))engine=InnoDB;
#記事表
create table tera_db.articles(article_id varchar(10) primary key,fk_user_id char(8),article_title varchar(100) default 'こんにちは',
							  article_body varchar(20000),article_created_date date,article_status_flag char(1) not null,index(article_id),
							  foreign key(fk_user_id) references tera_db.users(user_id))engine=InnoDB;
#タグ表
create table tera_db.tags(tag_id char(10) primary key,tag_name varchar(30) not null,index(tag_id))engine=InnoDB;
#記事タグ表
create table tera_db.articles_tags(fk_article_id char(10),fk_tag_id char(10),foreign key (fk_article_id)references tera_db.articles(article_id),
									foreign key(fk_tag_id) references tera_db.tags(tag_id))engine=InnoDB;
#コミュニティユーザーリスト表
create table tera_db.community_members_list(fk_user_id char(10),fk_community_id char(10),community_admin_flag char(1) not null,
											foreign key(fk_user_id) references tera_db.users(user_id),
											foreign key(fk_community_id) references tera_db.communities(community_id))engine=InnoDB;
#コメント表
create table tera_db.comments(comment_id char(10) primary key,fk_article_id char(10),comment_date date not null,fk_user_id char(10),comment_body varchar(800),
							  foreign key(fk_article_id) references tera_db.articles(article_id),foreign key (fk_user_id) references tera_db.users(user_id))engine=InnoDB;
#DM表
create table tera_db.direct_messages(message_id char(10) primary key,message_body varchar(800),message_date date not null,
									 fk_send_user_id char(8),fk_receive_user_id char(10),
									 foreign key(fk_send_user_id) references tera_db.users(user_id),
									 foreign key(fk_receive_user_id) references tera_db.users(user_id))engine=InnoDB;
#お問い合わせ表
create table tera_db.contacts(contact_id char(10) primary key,contact_user_name varchar(50) not null,contact_title varchar(160) not null,
							  contact_body varchar(10000),contact_date date not null,
							  contact_address varchar(40) not null,contact_category varchar(100));
#警告表
create table tera_db.cautions(caution_id char(10) primary key,fk_user_id char(10),fk_caution_user_id char(10),caution_date date,caution_title varchar(100) not null,
							  caution_body varchar(10000) not null,report_page_url varchar(400),foreign key(fk_user_id) references tera_db.users(user_id),
							  foreign key(fk_caution_user_id) references tera_db.users(user_id))engine=InnoDB;
#トピック表
create table tera_db.topic(topic_id char(10) primary key,fk_community_id char(10),fk_create_user_id char(10),topic_name varchar(50) not null,
						   topic_update_date date,topic_created_date date,index(topic_id),
						   foreign key(fk_community_id) references tera_db.communities(community_id),
						   foreign key(fk_create_user_id) references tera_db.users(user_id))engine=InnoDB;
#チャット表
create table tera_db.chat(chat_id int(8) primary key auto_increment,fk_user_id char(8),fk_topic_id char(10),
						  chat_body varchar(600),chat_date date,chat_delete_flag char(1) not null,
						  foreign key(fk_user_id) references tera_db.users(user_id),
						  foreign key(fk_topic_id) references tera_db.topic(topic_id))engine=InnoDB;
#登録キー表
create table tera_db.sign_up_keys(sign_up_key char(12) primary key,key_status char(1) not null);
#ポリシー表
create table tera_db.policy(policy_id char(10) primary key,policy_date date,policy_body varchar(10000) not null);
#利用規約表
create table tera_db.rules(rule_id char(10) primary key,rule_date date,rule_body varchar(10000) not null);
