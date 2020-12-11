SELECT
    id,
    mail_address,
    nickname,
    profile,
    business_phone_num,
    mobile_phone_num,
    login_password,
    is_deleted,
    joined_at,
    updated_at
FROM
    members
ORDER BY
    id asc;