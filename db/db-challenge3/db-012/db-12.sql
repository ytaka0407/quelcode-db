BEGIN;

SET
    TRANSACTION ISOLATION LEVEL READ COMITTED;

UPDATE
    chat_rooms
SET
    is_file_transmitable = 0,
    update_member_id = 1
WHERE
    is_deleted = 0
    AND is_file_transmitable <> 0
    AND is_deleted = 0
    AND id NOT in
    /*副問い合わせでmember_id=1の紐づいたチャットルームid一覧を取得し除外対象とする*/
    (
        SELECT
            chat_room_id
        FROM
            chat_rooms_joined_list
        WHERE
            member_id = 1
    );

COMMIT;
