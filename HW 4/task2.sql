-- Insert initial data into petPet table
INSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ('Puffball', 'Diane', 'hamster', 'F', '1999-03-30', NULL);

-- Insert initial data into petEvent table
INSERT INTO petEvent VALUES
    ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ("Slim", "1997-08-03", "vet", "broken rib"),
    ("Slim", "1997-10-04", "vet", "broken tooth"),
    ("Bowser", "1991-10-12", "kennel", NULL),
    ("Fang", "1991-10-12", "kennel", NULL),
    ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ("Claws", "1998-03-17", "birthday", "Gave him a new flea collar"),
    ("Whistler", "1998-12-09", "birthday", "First birthday");

-- Insert new event for Fluffy
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- Ensure Hammy exists in petPet, then add event
INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- Update Fluffy's record to reflect the 5 kittens (2 male)
UPDATE petPet SET owner = CONCAT(owner, ', had 5 kittens, 2 male') WHERE petname = 'Fluffy';

-- Add event for Claws’ injury
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

-- Update Puffball’s death date
UPDATE petPet SET death = '2020-09-01' WHERE petname = 'Puffball';

-- Delete Harold's dog (if it's Buffy, for example)
DELETE FROM petPet WHERE owner = 'Harold' AND petname = 'Buffy';