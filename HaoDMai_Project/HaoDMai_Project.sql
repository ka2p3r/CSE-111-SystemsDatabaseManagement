							/*
                            	  Part No.1 final project 
								Hao D Mai
                                March 20, 2023 */

-- Social Media Database --

DROP DATABASE IF EXISTS appStore;
CREATE DATABASE appStore;
USE appStore;


-- User Table --
 
CREATE TABLE USER (
  user_id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code VARCHAR(10) NOT NULL,
  country VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL,
  user_password VARCHAR(100) NOT NULL
);

-- User's Friend Table --
 
CREATE TABLE USER_FRIEND (
  request_id INT NOT NULL PRIMARY KEY,
  sender_id INT NOT NULL,
  receiver_id INT NOT NULL,
  u_status VARCHAR(50) NOT NULL,
  action_time DATETIME NOT NULL,
  action_taken VARCHAR(50) NOT NULL,
  FOREIGN KEY (sender_id) REFERENCES USER(user_id),
  FOREIGN KEY (receiver_id) REFERENCES USER(user_id)
);

-- User Message Table -- 

CREATE TABLE USER_MESSAGE (
  message_id INT NOT NULL PRIMARY KEY,
  from_user_id INT NOT NULL,
  to_user_id INT NOT NULL,
  message_text VARCHAR(255) NOT NULL,
  date_sent DATETIME NOT NULL,
  date_read DATETIME,
  FOREIGN KEY (from_user_id) REFERENCES USER(user_id),
  FOREIGN KEY (to_user_id) REFERENCES USER(user_id)
);

-- User Post Table -- 
CREATE TABLE USER_POST (
  post_id INT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  post_content VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES USER(user_id)
);

-- Category Table -- 

CREATE TABLE CATEGORY (
  category_id INT NOT NULL PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);


-- Post Comments Table -- 

CREATE TABLE POST_COMMENTS (
  comment_id INT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  user_comment VARCHAR(255) NOT NULL,
  created_date DATETIME NOT NULL,
  post_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES USER(user_id),
  FOREIGN KEY (post_id) REFERENCES USER_POST(post_id)
);

-- Group Info table -- 

CREATE TABLE GROUP_INFO (
  group_id INT NOT NULL PRIMARY KEY,
  category_id INT NOT NULL,
  created DATETIME NOT NULL,
  created_by INT NOT NULL,
  updated_by INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  join_mode VARCHAR(50) NOT NULL,
  group_name VARCHAR(255) NOT NULL,
  visibility VARCHAR(50) NOT NULL,
  members INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id),
  FOREIGN KEY (created_by) REFERENCES USER(user_id),
  FOREIGN KEY (updated_by) REFERENCES USER(user_id)
);

-- Group Member Table -- 

CREATE TABLE GROUP_MEMBER (
  member_id INT NOT NULL PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  joined DATETIME NOT NULL,
  member_status VARCHAR(50) NOT NULL,
  group_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (group_id) REFERENCES GROUP_INFO(group_id),
  FOREIGN KEY (user_id) REFERENCES USER(user_id)
);


-- Group Post Table -- 

CREATE TABLE GROUP_POST (
    post_id INT PRIMARY KEY,
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    message VARCHAR(1000) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    FOREIGN KEY (group_id) REFERENCES GROUP_INFO(group_id),
    FOREIGN KEY (user_id) REFERENCES USER(user_id)
);

-- Group Message Table -- 

CREATE TABLE GROUP_MESSAGE (
    message_id INT PRIMARY KEY,
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    message_text VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    FOREIGN KEY (group_id) REFERENCES GROUP_INFO(group_id),
    FOREIGN KEY (user_id) REFERENCES USER(user_id)
);


-- City Table -- 

CREATE TABLE CITY (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL
);

