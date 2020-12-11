SELECT
    m.nickname,
    r.room_name,
    DATE(j.joined_at)
FROM
    chat_rooms_joined_list AS j
    JOIN chat_rooms AS r ON j.chat_room_id = r.id
    JOIN members AS m ON j.member_id = m.id
WHERE
    m.is_deleted = 0
    AND r.is_deleted = 0
ORDER BY
    j.joined_at ASC;
