SELECT
    id,
    room_name,
    CASE
        is_file_transmitable
        WHEN 1 then '許可'
        ELSE '禁止'
    END AS is_file_transmitable,
    is_one_on_one,
    room_description,
    is_deleted,
    create_member_id,
    update_member_id,
    created_at,
    updated_at
FROM
    chat_rooms
WHERE
    is_deleted = 0
    AND room_description like '%ダイレクトチャット'
ORDER BY
    id asc;