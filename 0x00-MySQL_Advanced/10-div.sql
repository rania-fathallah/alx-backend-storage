-- Creates a function SafeDiv that performs division safely
-- Returns 0 if the divisor (b) is 0, otherwise returns the result of a / b

DROP FUNCTION IF EXISTS SafeDiv;
DELIMITER $$

CREATE FUNCTION SafeDiv (a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    -- Return 0 if b is 0 to avoid division by zero, otherwise return a / b
    RETURN IF(b = 0, 0, a / b);
END $$

DELIMITER ;
