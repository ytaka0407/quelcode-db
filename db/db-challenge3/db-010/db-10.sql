SELECT
    m.nickname,
    p.created_at,
    r.room_name
FROM
    posts AS p
    JOIN members AS m ON p.post_member_id = m.id
    JOIN chat_rooms AS r ON p.chat_room_id = r.id
    JOIN (
        SELECT
            /*服問い合わせにて部屋別の最新投稿時刻を取得*/
            p.chat_room_id,
            MAX(p.created_at) AS created_at
        FROM
            posts AS p
            JOIN members AS m ON p.post_member_id = m.id
        where
            /*投稿もしくはユーザーが削除済みを除く*/
            p.is_deleted = 0
            AND m.is_deleted = 0
        GROUP BY
            p.chat_room_id
    ) AS newestpost ON p.created_at = newestpost.created_at
ORDER BY
    p.chat_room_id ASC;