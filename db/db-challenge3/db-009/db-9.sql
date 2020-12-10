SELECT
    r.room_name,
    COUNT(p.id) AS '投稿数'
FROM
    posts AS p
    JOIN members AS m ON p.post_member_id = m.id
    JOIN chat_rooms AS r ON p.chat_room_id = r.id
WHERE
    m.is_deleted = 0
    AND p.is_deleted = 0
GROUP BY
    p.chat_room_id
ORDER BY
    投稿数 DESC;