CREATE TABLE members(
    user_id integer(10) PRIMARY KEY AUTO_INCREMENT,
    mail_address varchar(100) NOT NULL,
    nickname varchar(100) NOT NULL,
    profile varchar(1000),
    business_phone_num varchar(13),
    mobile_phone_num varchar(13),
    login_password varchar(100) NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    joined_at datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at datetime DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE chatrooms(
    room_id integer(10) PRIMARY KEY AUTO_INCREMENT,
    room_name varchar(100) NOT NULL,
    room_description varchar(1000),
    file_transmission tinyint(1) DEFAULT 1 NOT NULL,
    chat_type tinyint(1) DEFAULT 0 NOT NULL,
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    create_member_id integer(10) NOT NULL REFERENCES members(user_id),
    update_member_id integer(10) NOT NULL REFERENCES members(user_id),
    created_at datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at datetime DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE chatroom_joined_list(
    member_id integer(10) NOT NULL REFERENCES members(user_id),
    chatroom_id integer(10) NOT NULL REFERENCES members(user_id),
    joined_at datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(member_id, chatroom_id)
);
CREATE TABLE posts(
    post_id integer(10) PRIMARY KEY,
    chatroom_id integer(10) NOT NULL REFERENCES chatrooms(room_id),
    post_text varchar(1000) NOT NULL,
    post_filename varchar(10),
    is_deleted tinyint(1) DEFAULT 0 NOT NULL,
    post_member_id integer(10) NOT NULL REFERENCES members(user_id),
    update_member_id integer(10) NOT NULL REFERENCES members(user_id),
    created_at datetime DEFAULT current_timestamp NOT NULL,
    updated_at datetime DEFAULT current_timestamp NOT NULL ON update current_timestamp
)