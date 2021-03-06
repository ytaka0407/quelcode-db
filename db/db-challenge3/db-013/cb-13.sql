BEGIN;

SET
    SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE
    members
SET
    is_deleted = 1
WHERE
    business_phone_num IS NULL
    AND mobile_phone_num IS NULL
    AND is_deleted <> 1;

COMMIT;
