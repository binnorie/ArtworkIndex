/* Samantha Levin - Final Project
Art Registrar*/


CREATE DATABASE art_registrar;
USE art_registrar; 

CREATE TABLE agent (
  agent_id INT PRIMARY KEY AUTO_INCREMENT,
  agent_lname  VARCHAR(20),
  agent_fname  VARCHAR(20),
  agent_altname VARCHAR(200),
  agent_url TEXT,  
  agent_email VARCHAR(100),
  agent_phone VARCHAR(20),
  agent_city VARCHAR(20),
  agent_state VARCHAR(2),
  agent_street1 VARCHAR(50),
  agent_street2 VARCHAR(50),
  agent_postalcode VARCHAR(20),
  agent_country VARCHAR(20),
  agent_addedinfo VARCHAR(400)  
);

CREATE TABLE colltype (
  colltype_id INT PRIMARY KEY AUTO_INCREMENT,
  colltype_name VARCHAR(100) NOT NULL
);

CREATE TABLE worktype (
  wt_id INT PRIMARY KEY AUTO_INCREMENT,
  wt_name VARCHAR(300) NOT NULL
);

CREATE TABLE license (
  lic_id INT PRIMARY KEY AUTO_INCREMENT,
  lic_code VARCHAR(50),
  lic_addedinfo VARCHAR(2000),
  lic_path TEXT 
  --  This should be a URL of some kind, ideally a Persistent URL (PURL). I'm currently entering URLs archived by various web archive tools, such as the Wayback Machine. Advice from here: http://stackoverflow.com/questions/219569/best-database-field-type-for-a-url suggested use of TEXT instead of VARCHAR. I've used TEXT throughout the database for URL fields, but need to do more research. 
);

CREATE TABLE rights_set (
  rights_id INT PRIMARY KEY AUTO_INCREMENT,
  lic_id INT DEFAULT 7,
  reg_no VARCHAR(50) UNIQUE, 
  reg_year YEAR,
  rights_addedinfo VARCHAR(2000),
  FOREIGN KEY (lic_id)
  	REFERENCES license(lic_id)
  	ON UPDATE CASCADE
);

CREATE TABLE work (
  work_id INT PRIMARY KEY AUTO_INCREMENT,
  creation_year YEAR,
  work_title VARCHAR(200) NOT NULL,
  description VARCHAR(2000),
  work_measurements VARCHAR(100),
  work_material VARCHAR(400),
  rights_id INT UNIQUE NOT NULL,
  FOREIGN KEY (rights_id)
  	REFERENCES rights_set(rights_id)
  	ON UPDATE CASCADE
);

CREATE TABLE image_rep (
   img_id INT PRIMARY KEY AUTO_INCREMENT,
   img_path TEXT,
   img_year YEAR,
   img_addedinfo VARCHAR(400),
   rights_id INT UNIQUE NOT NULL,
   FOREIGN KEY (rights_id)
      REFERENCES rights_set(rights_id)
      ON UPDATE CASCADE
);

CREATE TABLE collection (
  coll_id INT PRIMARY KEY AUTO_INCREMENT,
  coll_title VARCHAR(200),
  coll_year YEAR,
  coll_path TEXT,
  rights_id INT UNIQUE NOT NULL,
  FOREIGN KEY (rights_id)
  	REFERENCES rights_set(rights_id)
  	ON UPDATE CASCADE  
);

CREATE TABLE work_to_coll (
  work_id INT NOT NULL,
  coll_id INT NOT NULL,
  PRIMARY KEY (work_id, coll_id),
  FOREIGN KEY (coll_id)
    REFERENCES collection(coll_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (work_id)
    REFERENCES work(work_id)
    ON UPDATE CASCADE
);

CREATE TABLE work_to_agent (
  work_id INT NOT NULL,
  agent_id INT NOT NULL,
  PRIMARY KEY (work_id, agent_id),
  FOREIGN KEY (work_id)
    REFERENCES work(work_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (agent_id)
    REFERENCES agent(agent_id)
    ON UPDATE CASCADE
);

CREATE TABLE work_to_imagerep (
  work_id INT NOT NULL,
  img_id INT NOT NULL,
  PRIMARY KEY (work_id, img_id),
  FOREIGN KEY (work_id)
    REFERENCES work(work_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (img_id)  
    REFERENCES image_rep(img_id)
    ON UPDATE CASCADE
);

CREATE TABLE coll_to_imagerep (
  coll_id INT NOT NULL,
  img_id INT NOT NULL,
  PRIMARY KEY (coll_id, img_id),
  FOREIGN KEY (coll_id)
    REFERENCES collection(coll_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (img_id)
    REFERENCES image_rep(img_id)
    ON UPDATE CASCADE
);

CREATE TABLE coll_to_agent (
  coll_id INT NOT NULL,
  agent_id INT NOT NULL,
  role VARCHAR(50) ,
  PRIMARY KEY (coll_id, agent_id),
  FOREIGN KEY (coll_id)
    REFERENCES collection(coll_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (agent_id)
    REFERENCES agent(agent_id)
    ON UPDATE CASCADE
);

CREATE TABLE colltype_to_coll (
  coll_id INT NOT NULL,
  colltype_id INT NOT NULL,
  PRIMARY KEY (coll_id, colltype_id),
  FOREIGN KEY (coll_id)
    REFERENCES collection(coll_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (colltype_id)
    REFERENCES colltype(colltype_id)
    ON UPDATE CASCADE
);

CREATE TABLE img_to_agent (
  img_id INT NOT NULL,
  agent_id INT NOT NULL,
  PRIMARY KEY(img_id, agent_id),
  FOREIGN KEY (agent_id)
    REFERENCES agent(agent_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (img_id)  
    REFERENCES image_rep(img_id)
    ON UPDATE CASCADE
);

CREATE TABLE work_to_worktype (
  work_id INT NOT NULL,
  wt_id INT NOT NULL,
  PRIMARY KEY (work_id, wt_id),
  FOREIGN KEY (work_id)
    REFERENCES work(work_id)
    ON UPDATE CASCADE,
  FOREIGN KEY (wt_id)
    REFERENCES worktype(wt_id)
    ON UPDATE CASCADE
);

-- QUERIES:

-- 1. The following query adds an agent's known-as or nom-de-plum as an attribute to the Agent entity. Not a trigger or view, but something I changed after I created the database: 

ALTER TABLE agent 
ADD COLUMN agent_knownas VARCHAR(200) GENERATED ALWAYS AS 
  (CASE 
    WHEN agent_altname=""
    THEN CONCAT(agent_lname,", ",agent_fname)
    ELSE 
    CASE
      WHEN agent_lname="" 
      THEN agent_altname
    ELSE CONCAT(agent_lname,", ",agent_fname," ", "(AKA, ", agent_altname,")")
      END
  END);

-- 2. Which Agents are missing City and State information? This query is meant for me as the designer of this incomplete database! 

SELECT agent_knownas, agent_city, agent_state FROM agent 
WHERE agent_state=''
ORDER BY agent_knownas;

-- Adding city/state info for all those agents who live in Brooklyn, NY. 
UPDATE agent
SET agent_city="Brooklyn", agent_state="NY"
WHERE agent_lname="Leonov" OR agent_lname="Clark" OR agent_lname="Maykut"OR agent_lname="Myaing"OR agent_lname="Rex Van Minnen"OR agent_lname= "Wittfooth" OR agent_lname= "Woodruff";

-- 3. What's the database percentage of all artists living in each state within the database? Include how many artists don't have state location included. Order so that top state is on top.

CREATE VIEW artist_state_perc
AS
SELECT 
CASE 
WHEN agent_state=' '
THEN CONCAT(ROUND(((COUNT(agent_state)/(SELECT COUNT(*) FROM agent))*100)),'%', ', or ',COUNT(agent_state),' ', 'of all ',(SELECT COUNT(*) FROM agent), ' artists in database, are missing their state location')   
ELSE CONCAT(ROUND(((COUNT(agent_state)/(SELECT COUNT(*) FROM agent))*100)),'%', ', or ',COUNT(agent_state),' ', 'of all ',(SELECT COUNT(*) FROM agent), ' artists in database, are from ', agent_state) 
END AS 'Artist State %'
FROM agent 
GROUP BY agent_state
ORDER BY (((COUNT(agent_state)/(SELECT COUNT(*) FROM agent))*100)) DESC;

/*
+----------------------------------------------------------------------------+
| Artist State %                                                             |
+----------------------------------------------------------------------------+
| 38%, or 25 of all 65 artists in database, are missing their state location |
| 34%, or 22 of all 65 artists in database, are from NY                      |
| 6%, or 4 of all 65 artists in database, are from CA                        |
| 6%, or 4 of all 65 artists in database, are from NJ                        |
| 6%, or 4 of all 65 artists in database, are from PA                        |
| 2%, or 1 of all 65 artists in database, are from CT                        |
| 2%, or 1 of all 65 artists in database, are from FL                        |
| 2%, or 1 of all 65 artists in database, are from MA                        |
| 2%, or 1 of all 65 artists in database, are from NC                        |
| 2%, or 1 of all 65 artists in database, are from MN                        |
| 2%, or 1 of all 65 artists in database, are from IL                        |
+----------------------------------------------------------------------------+*/


-- 4. Create a view that shows all artists with their works and the associated licenses.

CREATE VIEW work_license
AS
SELECT a.agent_knownas AS `Artist`, c.work_title AS `Work Title`, d.lic_code AS `Public License`
FROM agent a
LEFT JOIN work_to_agent b
ON a.agent_id=b.agent_id
LEFT JOIN work c
ON c.work_id=b.work_id
LEFT JOIN rights_set e
ON e.rights_id=c.rights_id
LEFT JOIN license d
ON e.lic_id=d.lic_id;

/*
+---------------------------------+----------------------------------------------------------------------------------+---------------------+
| Artist                          | Work Title                                                                       | Public License      |
+---------------------------------+----------------------------------------------------------------------------------+---------------------+
| Baade, Carrie                   | Death and the Maiden                                                             | CC BY-NC-ND         |
| Baade, Carrie                   | The Devil is in the Details, part IV: Suicide of the Alligator Queen             | CC BY-NC-ND         |
| Baade, Carrie                   | The Devil is in the Details, part II                                             | CC BY-NC-ND         |
| Ballen, Roger                   | Retreat                                                                          | All rights reserved |
| Brodka, Michel                  | Ex Libris                                                                        | All rights reserved |
| Cleff, Steve                    | Different Losses                                                                 | All rights reserved |
| Conte, Christopher              | Cog'nition                                                                       | All rights reserved |
| DeLeon, Cam                     | Dream 03                                                                         | All rights reserved |
| Devon, Zelda                    | NULL                                                                             | NULL                |
| Drexl, Caryn                    | I Know the Pieces Fit                                                            | All rights reserved |
| Euclide, Gregory                | From This Distance: Sound Pearls                                                 | All rights reserved |
| Faerber, Jeff                   | In The Realms of the Unreal, innocence lives in the constant shadow of danger…   | All rights reserved |
| Foisy, Katelan                  | Blengin                                                                          | All rights reserved |
| Gargon, Heather                 | Stole                                                                            | All rights reserved |
| Graf, Christina                 | Little Henry's Heart                                                             | All rights reserved |
| Hackett, Caitlin                | In Memory                                                                        | All rights reserved |
| Hackett, Caitlin                | Undergrowth                                                                      | All rights reserved |
| Huggins, Kurt                   | Untitled Portrait of Henry Darger                                                | All rights reserved |
| Hunt, Seldon                    | Blengin Exhumed                                                                  | All rights reserved |
| Hush, Jeremy                    | Front line of the Glandeco- Angelinian War Storm                                 | All rights reserved |
| Hush, Jeremy                    | Untitled (New Years Greeting Card)                                               | CC BY-NC-SA         |
| Kahan, Max                      | And Being Was Enough                                                             | All rights reserved |
| Karolczak, Caitlin              | The Vivian Girl Daisy                                                            | All rights reserved |
| Karolczak, Caitlin              | Avenging Annie                                                                   | All rights reserved |
| Kraiza, Robert                  | The First Color of the Rainbow                                                   | All rights reserved |
| Leonov, Yuri                    | The Unreality                                                                    | All rights reserved |
| Louie, Travis                   | Untitled                                                                         | All rights reserved |
| Maykut, Amber                   | Vivian Girl: Citrus Swallowtails & Western Emperor Swallowtail                   | All rights reserved |
| McCormack, Caitlin              | Bandolier (The Protector)                                                        | All rights reserved |
| Menna, Juliana                  | Rainbow of the free                                                              | All rights reserved |
| Motorcycle, Michael             | Good is Prior to Evil                                                            | All rights reserved |
| Myaing, Tun                     | Overture                                                                         | All rights reserved |
| Nestor, Buddy                   | Samantha Levin                                                                   | All rights reserved |
| Nix Turner, Nicomi              | And The World Swallows Her                                                       | All rights reserved |
| Ouellette, Dan                  | Sex Mask for Religious People                                                    | All rights reserved |
| Pontius, Anthony                | Pandagram Sam                                                                    | All rights reserved |
| Romano, Paul                    | Ghosts of War                                                                    | All rights reserved |
| Rota, Matt                      | Fire at Black Lake                                                               | All rights reserved |
| Sommers, Allison                | Righteous Vindication                                                            | All rights reserved |
| Wandelmaier, Kurt               | Luminous Guardian                                                                | All rights reserved |
| Williams, Zoe                   | Little Lamb                                                                      | All rights reserved |
| Teetering Bulb                  | Fragments                                                                        | All rights reserved |
| Levesque, Jason (AKA, Stuntkid) | Untitled                                                                         | All rights reserved |
| Hochbaum, David                 | Untitled                                                                         | All rights reserved |
| Levin, Samantha (AKA, Binnorie) | NULL                                                                             | NULL                |
| Ezzo, Danielle                  | NULL                                                                             | NULL                |
| Zar, Chet                       | C&C Dummy Work1                                                                  | All rights reserved |
| Mars, Chris                     | C&C Dummy Work2                                                                  | All rights reserved |
| Rex Van Minnen, Christian       | C&C Dummy Work3                                                                  | All rights reserved |
| McGrath, Elizabeth              | C&C Dummy Work4                                                                  | All rights reserved |
| Simkins, Greg                   | C&C Dummy Work5                                                                  | All rights reserved |
| Taillefer, Heidi                | C&C Dummy Work6                                                                  | All rights reserved |
| Joslin, Jessica                 | C&C Dummy Work7                                                                  | All rights reserved |
| Schaechter, Judith              | C&C Dummy Work8                                                                  | All rights reserved |
| Clark, Kate                     | C&C Dummy Work9                                                                  | All rights reserved |
| Olivas, Kathie                  | C&C Dummy Work10                                                                 | All rights reserved |
| Boehmer, Kelly                  | C&C Dummy Work11                                                                 | All rights reserved |
| Kuksi, Kris                     | C&C Dummy Work12                                                                 | All rights reserved |
| Hogin, Laurie                   | C&C Dummy Work13                                                                 | All rights reserved |
| Lipton, Laurie                  | C&C Dummy Work14                                                                 | All rights reserved |
| Field, Lori                     | C&C Dummy Work15                                                                 | All rights reserved |
| Peck, Marion                    | C&C Dummy Work16                                                                 | All rights reserved |
| Hosford, Mark                   | C&C Dummy Work17                                                                 | All rights reserved |
| Wittfooth, Martin               | C&C Dummy Work18                                                                 | All rights reserved |
| Caesar, Ray                     | C&C Dummy Work19                                                                 | All rights reserved |
| A. Kirk, Richard                | C&C Dummy Work20                                                                 | All rights reserved |
| C. Brooks, Scott                | C&C Dummy Work21                                                                 | All rights reserved |
| Woodruff, Thomas                | C&C Dummy Work22                                                                 | All rights reserved |
| Cummings, Timothy               | C&C Dummy Work23                                                                 | All rights reserved |
+---------------------------------+----------------------------------------------------------------------------------+---------------------+*/


-- 5. Works can be formatted by multiple mediums or Worktypes. All data entered in the database in the Worktype entity set consists of Worktypes found in the Getty Art and Architecture name authority thesaurus. The following view lists works with their various worktypes. 

Create View Worktype_list
AS
SELECT a.agent_knownas AS `Artist`, c.work_title AS `Work Title`, wt_name AS `AAT Worktype`
FROM agent a
LEFT JOIN work_to_agent b
ON a.agent_id=b.agent_id
LEFT JOIN work c
ON c.work_id=b.work_id
LEFT JOIN work_to_worktype g
ON g.work_id=c.work_id
LEFT JOIN worktype d
ON d.wt_id=g.wt_id;


-- 6. Who are the artists who exhibited in the "Realms of the Unreal" exhibition? List them along with their works that showed, the year of the exhibition and the website showing images of the works, in order of artists' knownas names. Collection (e.g. Exhibition) info repeats

Create view Realms
AS
SELECT  a.agent_knownas AS `Artist`, e.work_title AS `Work Title`, c.coll_title AS `Exhibition`, c.coll_year AS `Year`, c.coll_path AS `Website`
FROM work e
LEFT JOIN work_to_coll b
ON b.work_id=e.work_id
LEFT JOIN COLLECTION c
ON c.coll_id=b.coll_id
LEFT JOIN work_to_agent f
ON f.work_id=e.work_id
LEFT JOIN agent a
ON a.agent_id=f.agent_id
WHERE c.coll_title="Realms of the Unreal"
ORDER BY a.agent_knownas;

-- 7. I'm looking for an artwork that has an odd depiction of a panda in it.  Who created it, what's it called, what year was it created, and how can I see it?

Create view panda
AS
SELECT a.agent_knownas AS `Artist`, c.work_title AS `Work Title`, c.description AS `Art Description`, c.creation_year AS `Year Created`, e.img_path AS `Image Location`
FROM agent a
LEFT JOIN work_to_agent b
ON a.agent_id=b.agent_id
LEFT JOIN work c
ON c.work_id=b.work_id
LEFT JOIN work_to_imagerep d
ON d.work_id=c.work_id
LEFT JOIN image_rep e
ON d.img_id=e.img_id
WHERE c.description LIKE '%panda%';

-- 8. Transaction to enter a set of new data across the entire database: agent_id=44 (artist Mark Ryden) was published in a book called The Upset. The agent, collection, rights info and image rep needs to be added to their respective entity sets. 

      SET autocommit=0;
      START TRANSACTION;

      -- AGENT

      UPDATE agent
      SET 
      agent_url="http://www.markryden.com/",
      agent_email="news@markryden.com",
      agent_city="Los Angeles",
      agent_country="USA"
      WHERE agent_id=65;

      INSERT INTO agent (agent_id,agent_lname,agent_fname)
      VALUES
      (NULL,"Klanten","Robert");

      -- RIGHTS_SET - Work - "Apology"

      INSERT INTO rights_set (rights_id, lic_id,reg_no,reg_year,rights_addedinfo)
      VALUES 
      (NULL,7,NULL,NULL,NULL);

      -- WORK - "apology"

      INSERT INTO work (work_id,creation_year,work_title,description,work_measurements,work_material,rights_id)
      VALUES
      (NULL,2006,"Apology","A girl wearing a yellow dress gestures in apology to a tree stump with an eye in its center", "24x31","oil on canvas",LAST_INSERT_ID());

      -- WORK_TO_AGENT - "Apology"

      INSERT INTO work_to_agent (work_id,agent_id)
      VALUES
      (LAST_INSERT_ID(),65);

      -- Rights_SET - "Creatrix"

      INSERT INTO rights_set (rights_id, lic_id,reg_no,reg_year,rights_addedinfo)
      VALUES 
      (NULL,7,NULL,NULL,NULL);

      -- WORK - "The Creatrix"

      INSERT INTO work (work_id,creation_year,work_title,description,work_measurements,work_material,rights_id)
      VALUES
      (NULL,2005,"The Creatrix","A woman wearing a long gown and crown, stands in a field filled with creatures, carrying an infant and and twig.","91x60","oil on canvas",LAST_INSERT_ID());

      -- WORK_TO_AGENT - "The Creatrix"

      INSERT INTO work_to_agent (work_id,agent_id)
      VALUES
      (LAST_INSERT_ID(),65);

      -- RIGHTS_SET - IMAGE_REP - "Apology"

      INSERT INTO rights_set (rights_id, lic_id,reg_no,reg_year,rights_addedinfo)
      VALUES 
      (NULL,7,NULL,NULL,NULL);

      -- IMAGE_REP apology

      INSERT INTO image_rep (img_id,img_path,img_year,img_addedinfo,rights_id)
      VALUES
      (NULL,"https://web.archive.org/web/20160320224546/http://markryden.com/paintings/treeshow/images/paintings/large/apology.jpg",2006,"",LAST_INSERT_ID());

      -- Work_to_image - "Apology"

      INSERT INTO work_to_imagerep (work_id,img_id)
      VALUES
      ((SELECT work_id FROM work WHERE work_title="Apology"),LAST_INSERT_ID());

      -- RIGHTS_SET - IMAGE_REP - "Creatrix"

      INSERT INTO rights_set (rights_id, lic_id,reg_no,reg_year,rights_addedinfo)
      VALUES 
      (NULL,7,NULL,NULL,NULL);

      -- image_rep AND img_to_agent - "Creatrix"

      INSERT INTO image_rep (img_id,img_path,img_year,img_addedinfo,rights_id)
      VALUES
      (NULL,"https://web.archive.org/web/20161020073706/http://www.wondertoonel.com/",2005,"",LAST_INSERT_ID());

      INSERT INTO img_to_agent (img_id,agent_id)
      VALUES
      (LAST_INSERT_ID(),65);

      INSERT INTO image_rep (img_id,img_path,img_year,img_addedinfo,rights_id)
      VALUES
      (NULL,"https://web.archive.org/web/20160207133313/http://www.markryden.com/paintings/one/images/large/the_creatrix.jpg",2005,"",LAST_INSERT_ID());

      INSERT INTO img_to_agent (img_id,agent_id)
      VALUES
      (LAST_INSERT_ID(),65);

      INSERT INTO image_rep (img_id,img_path,img_year,img_addedinfo,rights_id)
      VALUES
      (NULL,"https://web.archive.org/web/20151003040046/http://www.porterhouseart.com/v/arch/editions/creatrix.html",2005,"",LAST_INSERT_ID());

      INSERT INTO img_to_agent (img_id,agent_id)
      VALUES
      (LAST_INSERT_ID(),65);

      -- getting this all to be in the right order is absolutely torturous...

      -- WORK_TO_IMAGEREP - "Creatrix"

      INSERT INTO work_to_imagerep (work_id,img_id)
      VALUES
      ((SELECT work_id FROM work WHERE work_title="The Creatrix"),LAST_INSERT_ID());

      -- RIGHTS_SET - COLLECTION - The Upset book

      INSERT INTO rights_set (rights_id, lic_id,reg_no,reg_year,rights_addedinfo)
      VALUES 
      (NULL,7,NULL,NULL,NULL); 

      -- IMG_REP for collection

      INSERT INTO image_rep (img_id,img_path,img_year,img_addedinfo,rights_id)
      VALUES
      (NULL, "http://coverart.oclc.org/ImageWebSvc/oclc/+-+171308377_140.jpg?SearchOrder=+-+OT,OS,TN,GO,FA", 2008, "Digital image is very small",LAST_INSERT_ID());

      -- COLLECTION - The Upset book

      INSERT INTO collection (coll_id, coll_title, coll_year, coll_path, rights_id)
      VALUES (NULL, "The Upset",2008,"http://www.worldcat.org/title/upset-young-contemporary-art/oclc/228358626&referer=brief_results",LAST_INSERT_ID()) ;

      -- COLL_TO_IMAGEREP
      INSERT INTO coll_to_imagerep (coll_id,img_id)
      VALUES
      (LAST_INSERT_ID(), (SELECT img_id FROM image_rep WHERE img_addedinfo="Digital image is very small")) ;

      -- COLLTYPE_TO_COLL

      INSERT INTO colltype_to_coll (colltype_id,coll_id)
      VALUES ((SELECT colltype_id FROM colltype WHERE colltype_name LIKE ("publication")), LAST_INSERT_ID());

      -- WORK_TO_COLL

      INSERT INTO work_to_coll (work_id, coll_id)
      VALUES 
      ((SELECT work_id FROM work WHERE work_title="The Creatrix"),LAST_INSERT_ID()),
      ((SELECT work_id FROM work WHERE work_title="Apology"),LAST_INSERT_ID());

      -- WORK_TO_WORKTYPE

      INSERT INTO work_to_worktype (work_id, wt_id)
      VALUES
      ((SELECT work_id FROM work WHERE work_title="The Creatrix"),(SELECT wt_id FROM worktype WHERE wt_name="oil paintings")),
      ((SELECT work_id FROM work WHERE work_title="Apology"),(SELECT wt_id FROM worktype WHERE wt_name="oil paintings"));

      -- COLL_TO_AGENT

      INSERT INTO coll_to_agent (coll_id,agent_id,role)
      VALUES
      ((SELECT coll_id FROM collection WHERE coll_title="The Upset"),(SELECT agent_id FROM agent WHERE agent_lname="Klanten"),"author");

      -- SHOW DATA FROM THESE QUERIES

      SELECT  a.agent_knownas AS `Artist`, e.work_title AS `Artwork Title`, e.creation_year AS `Year Art Was Created`, k.wt_name AS `Medium`, i.img_path AS `Image of Artwork`, d.lic_code AS `Public License`, c.coll_title AS `Publication`, c.coll_year AS `Publication Year`, c.coll_path AS `Website`
        FROM work e
        LEFT JOIN work_to_coll b
        ON b.work_id=e.work_id
        LEFT JOIN COLLECTION c
        ON c.coll_id=b.coll_id
        LEFT JOIN work_to_agent f
        ON f.work_id=e.work_id
        LEFT JOIN agent a
        ON a.agent_id=f.agent_id
        LEFT JOIN rights_set g
        ON g.rights_id=e.rights_id
        LEFT JOIN license d
        ON g.lic_id=d.lic_id
        LEFT JOIN work_to_imagerep h
        ON h.work_id=e.work_id
        LEFT JOIN image_rep i
        ON i.img_id=h.img_id
        LEFT JOIN work_to_worktype j
        ON j.work_id=e.work_id
        LEFT JOIN worktype k
        ON k.wt_id=j.wt_id
        WHERE c.coll_title="The Upset"
        ORDER BY e.work_title;

      COMMIT;


-- 9. Trigger to clean up newly entered data

CREATE TRIGGER URL_trim 
BEFORE INSERT ON image_rep
FOR EACH ROW SET NEW.img_path = TRIM(LEADING "http" FROM NEW.img_path);

-- Test the trigger:

INSERT INTO image_rep (img_id, img_path, img_addedinfo, rights_id)
VALUES
(NULL,"http://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_trim", "This is just a way to test the new Trigger Function, which should trimthe http off the URL in the img_path field.",8);

SELECT * FROM art_registrar.image_rep WHERE img_addedinfo LIKE "%test%"; -- this works in Workbench, but doesn't provide any results in Terminal

-- Results after entering new data and running the select query from Workbench: '54','://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_trim',NULL,'This is just a way to test the new Trigger Function, which should trimthe http off the URL in the img_path field.','8'



