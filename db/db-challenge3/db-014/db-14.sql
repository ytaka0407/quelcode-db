BEGIN;

SET
    SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

DELETE FROM
    chat_rooms_joined_list
WHERE
    member_id IN (
        SELECT
            id
        FROM
            members
        WHERE
            is_deleted = 1
    );

COMMIT;
