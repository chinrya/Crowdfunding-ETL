-- Creating tables for crowdfunding_db named category based on crowdfunding_db ERD
CREATE TABLE category (
	category_id varchar(10) PRIMARY KEY,
	category varchar(50) NOT NULL
);
-- Creating tables for crowdfunding_db named subcategory
CREATE TABLE subcategory (
	subcategory_id varchar(10) PRIMARY KEY,
	subcategory varchar(50) NOT NULL
);
-- Creating tables for crowdfunding_db named contacts
CREATE TABLE contacts (
	contact_id int PRIMARY KEY,
	last_name varchar(50) NOT NULL,
	first_name varchar(50) NOT NULL,
	email varchar(100) NOT NULL
);
-- Creating tables for crowdfunding_db named campaign
CREATE TABLE campaign (
	cf_id int PRIMARY KEY,
	contact_id int NOT NULL,
	company_name varchar(100) NOT NULL,
	description text NOT NULL,
	goal numeric(10,2) NOT NULL,
	pledged numeric(10,2) NOT NULL,
	outcome varchar(50) NOT NULL,
	backers_count int NOT NULL,
	country varchar(10) NOT NULL,
	currency varchar(10) NOT NULL,
	launched_date date NOT NULL,
	end_date date NOT NULL,
	category_id varchar(10) NOT NULL,
	subcategory_id varchar(10) NOT NULL,
	CONSTRAINT fk_campaign_contact_id FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
	CONSTRAINT fk_campaign_category_id FOREIGN KEY (category_id) REFERENCES category (category_id),
	CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id)
);
-- Creating tables for crowdfunding_db named backers
CREATE TABLE backers (
	backer_id varchar(10) NOT NULL,
	cf_id int NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	CONSTRAINT pk_backers PRIMARY KEY (backer_id)
);
ALTER TABLE backers ADD CONSTRAINT fk_backers_cf_id FOREIGN KEY (cf_id)
REFERENCES campaign (cf_id);

SELECT * FROM backers;
