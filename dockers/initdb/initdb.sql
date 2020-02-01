/* --Adding As_company table */
DROP TABLE IF EXISTS `As_company`;
CREATE TABLE `As_company` (
    `Company_ID` mediumint(9) NOT NULL,
    `Company_Name` varchar(255) NOT NULL,
    PRIMARY KEY(`Company_ID`)
);

/* --Adding As_account table
--Needs to add check if Company_ID exists on As_company */

DROP TABLE IF EXISTS `As_account`;
CREATE TABLE `As_account` (
    `Account_ID` mediumint(9) NOT NULL,
    `Account_Name` varchar(255) NOT NULL,
    `Company_ID` mediumint(9) NOT NULL,
    PRIMARY KEY(`Account_ID`)
);

/* --Adding As_project table
--Needs to add check if Account_ID exists on As_account
--Needs to add check that Status is between 0 and 2*/
DROP TABLE IF EXISTS `As_project`;
CREATE TABLE `As_project` (
    `Project_ID` mediumint(9) NOT NULL,
    `Project_Name` varchar(255) NOT NULL,
    `Account_ID` mediumint(9) NOT NULL,
    `Project_Status` INT NOT NULL,
    PRIMARY KEY(`Project_ID`)
);




/* --Adding recodes for examples
*/
INSERT INTO `As_company`(Company_ID,Company_Name) VALUES (11, 'Simpsons' );
INSERT INTO `As_company`(Company_ID,Company_Name) VALUES (22, 'Flintstones' );


INSERT INTO `As_account`(Account_ID,Account_Name,Company_ID) VALUES (1, 'Bart', 11 );
INSERT INTO `As_account`(Account_ID,Account_Name,Company_ID) VALUES (2, 'Lisa', 11 );
INSERT INTO `As_account`(Account_ID,Account_Name,Company_ID) VALUES (3, 'maggie', 11 );

INSERT INTO `As_account`(Account_ID,Account_Name,Company_ID) VALUES (4, 'Fred', 22 );
INSERT INTO `As_account`(Account_ID,Account_Name,Company_ID) VALUES (5, 'Wilma', 22 );




INSERT INTO `As_project`(Project_ID,Project_Name,Account_ID,Project_Status) VALUES (111, 'Skate', 1, 0 );
INSERT INTO `As_project`(Project_ID,Project_Name,Account_ID,Project_Status) VALUES (222, 'Play on saxophone', 2, 1 );
INSERT INTO `As_project`(Project_ID,Project_Name,Account_ID,Project_Status) VALUES (333, 'Eat', 3, 2 );
INSERT INTO `As_project`(Project_ID,Project_Name,Account_ID,Project_Status) VALUES (444, 'Gatherer', 4, 0 );
INSERT INTO `As_project`(Project_ID,Project_Name,Account_ID,Project_Status) VALUES (555, 'Hunt', 5, 1 );

