-- Creates a trigger that resets the attribute valid_email
-- only when the email has been changed.
CREATE TRIGGER reset_email BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has changed
    IF OLD.email != NEW.email THEN
        -- Reset valid_email to 0
        SET NEW.valid_email = 0;
    END IF;
END;
