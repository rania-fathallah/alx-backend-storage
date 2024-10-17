-- Creates a trigger that resets the attribute valid_email
-- only when the email has been changed.
CREATE TRIGGER reset_email AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has changed
    IF OLD.email != NEW.email THEN
        -- Reset valid_email to its default value
        SET NEW.valid_email = DEFAULT;
    END IF;
END;
