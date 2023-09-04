DROP TABLE IF EXISTS video_likes;
CREATE TABLE IF NOT EXISTS video_likes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    video_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);
