/*membersテーブルの作成*/
CREATE TABLE members(
    user_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    mail_address VARCHAR(100) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    profile VARCHAR(1000),
    business_phone_num VARCHAR(13),
    mobile_phone_num VARCHAR(13),
    login_password VARCHAR(100) NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    joined_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP
);
/*chatroomsテーブルの作成*/
CREATE TABLE chatrooms(
    room_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(100) NOT NULL,
    room_description VARCHAR(1000),
    file_transmission TINYINT(1) DEFAULT 0 NOT NULL,
    chat_type TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    create_member_id INTEGER(10) NOT NULL REFERENCES members(user_id),
    update_member_id INTEGER(10) NOT NULL REFERENCES members(user_id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP
);
/*chatroom_joined_listテーブルの作成*/
CREATE TABLE chatroom_joined_list(
    member_id INTEGER(10) NOT NULL REFERENCES members(user_id),
    chatroom_id INTEGER(10) NOT NULL REFERENCES members(user_id),
    joined_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(member_id, chatroom_id)
);
/*postsテーブルの作成*/
CREATE TABLE posts(
    post_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    chatroom_id INTEGER(10) NOT NULL REFERENCES chatrooms(room_id),
    post_text VARCHAR(1000) NOT NULL,
    post_filename VARCHAR(10),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    post_member_id INTEGER(10) NOT NULL REFERENCES members(user_id),
    update_member_id INTEGER(10) NOT NULL REFERENCES members(user_id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON update CURRENT_TIMESTAMP
);
/*tasksテーブルの作成*/
CREATE TABLE tasks(
    task_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
    task_description VARCHAR(1000) NOT NULL,
    assigned_member_id INTEGER(10) NOT NULL REFERENCES members(user_id),
    status TINYINT(1) DEFAULT 0 NOT NULL,
    due_date DATETIME,
    rerated_chatroom_id INTEGER(10) NOT NULL REFERENCES chatrooms(room_id),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    create_member_id INTEGER(10) REFERENCES members(user_id),
    update_member_id INTEGER(10) REFERENCES members(user_id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
)