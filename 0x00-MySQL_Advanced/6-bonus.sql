-- Creates a stored procedure that adds a new correction for a student
CREATE PROCEDURE AddBonus (
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score FLOAT
)
BEGIN
    DECLARE project_id INT;

    -- Check if the project already exists
    SELECT id INTO project_id FROM projects WHERE name = project_name;

    -- If the project does not exist, create it
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        -- Get the newly created project's ID
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Add the correction record
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_name, score);
END;
