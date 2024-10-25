-- Create the petPet table with columns, data types, and constraints
CREATE TABLE petPet (
    petname VARCHAR(20) PRIMARY KEY,          -- pet name (up to 20 characters) as primary key
    owner VARCHAR(45),                        -- owner name (up to 45 characters)
    species VARCHAR(45) CHECK (species IN ('M', 'F')), -- species limited to 'M' or 'F'
    gender CHAR(1) CHECK (gender IN ('M', 'F')),       -- gender limited to 'M' or 'F'
    birth DATE,                               -- birth date
    death DATE                                -- death date (can be NULL)
);

-- Create the petEvent table with columns, data types, and constraints
CREATE TABLE petEvent (
    petname VARCHAR(20),                      -- pet name (up to 20 characters)
    eventdate DATE,                           -- date of event
    eventtype VARCHAR(15),                    -- type of event (up to 15 characters)
    remark VARCHAR(255),                      -- remark (up to 255 characters)
    FOREIGN KEY (petname) REFERENCES petPet(petname), -- foreign key linking to petPet
    PRIMARY KEY (petname, eventdate)          -- composite primary key (petname and eventdate)
);
