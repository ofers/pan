/* --Adding As_company table */
DROP TABLE IF EXISTS `As_company`;
CREATE TABLE `As_company` (
    `id` mediumint(9) NOT NULL,
    `Name` varchar(255) NOT NULL,
    PRIMARY KEY(`id`)
);

/* --Adding As_account table
--Needs to add check if Company_id exists on As_company */

DROP TABLE IF EXISTS `As_account`;
CREATE TABLE `As_account` (
    `id` mediumint(9) NOT NULL,
    `Name` varchar(255) NOT NULL,
    `Company_id` mediumint(9) NOT NULL,
    PRIMARY KEY(`id`)
);

/* --Adding As_project table
--Needs to add check if Account_id exists on As_account
--Needs to add check that Status is between 0 and 2*/
DROP TABLE IF EXISTS `As_project`;
CREATE TABLE `As_project` (
    `id` mediumint(9) NOT NULL,
    `Name` varchar(255) NOT NULL,
    `Account_id` mediumint(9) NOT NULL,
    `Status` INT NOT NULL,
    PRIMARY KEY(`id`)
);



/* --Adding recodes for examples
*/
INSERT INTO `As_company`(id,Name) VALUES (11, 'Simpsons' );
INSERT INTO `As_company`(id,Name) VALUES (22, 'Flintstones' );


INSERT INTO `As_account`(id,Name,Company_id) VALUES (1, 'Bart', 11 );
INSERT INTO `As_account`(id,Name,Company_id) VALUES (2, 'Lisa', 11 );
INSERT INTO `As_account`(id,Name,Company_id) VALUES (3, 'maggie', 11 );

INSERT INTO `As_account`(id,Name,Company_id) VALUES (4, 'Fred', 22 );
INSERT INTO `As_account`(id,Name,Company_id) VALUES (5, 'Wilma', 22 );




INSERT INTO `As_project`(id,Name,Account_id,Status) VALUES (111, 'Skate', 11, 0 );
INSERT INTO `As_project`(id,Name,Account_id,Status) VALUES (222, 'Play on saxophone', 11, 1 );
INSERT INTO `As_project`(id,Name,Account_id,Status) VALUES (333, 'Eat', 11, 2 );
INSERT INTO `As_project`(id,Name,Account_id,Status) VALUES (444, 'Gatherer', 22, 0 );
INSERT INTO `As_project`(id,Name,Account_id,Status) VALUES (555, 'Hunt', 22, 1 );

