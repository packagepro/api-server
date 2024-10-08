-- migrate:up
CREATE TABLE organizations
(
    name_slug    varchar(255) PRIMARY KEY,
    display_name varchar(255),
    CONSTRAINT well_formatted_name_slug CHECK (name_slug ~* '^[a-z0-9-]+$')
);

CREATE INDEX idx__organizations__display_name ON organizations (display_name);

-- migrate:down
DROP TABLE IF EXISTS organizations;
