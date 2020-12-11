BEGIN;

SET
    TRANSACTION ISOLATION LEVEL READ COMITTED;

UPDATE
    tasks
SET
    is_done = 1,
    update_member_id = 1
WHERE
    created_at BETWEEN '2020-04-26 09:00'
    AND '2020-04-26 11:30'
    AND is_deleted = 0
    AND is_done <> 1;

COMMIT;
