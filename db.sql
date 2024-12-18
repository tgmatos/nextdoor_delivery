CREATE TABLE ACCOUNT
(
	ID UUID PRIMARY KEY,
	EMAIL VARCHAR(256) UNIQUE NOT NULL,
	PASSWORD VARCHAR(256) NOT NULL,
	USERNAME VARCHAR(256) NOT NULL
);

CREATE TABLE STORE
(
	ID UUID PRIMARY KEY,
	NAME VARCHAR(256) UNIQUE NOT NULL,
	DESCRIPTION VARCHAR(256),
	OWNER_ID UUID REFERENCES account(ID)
);

CREATE TABLE INVENTORY
(
    ID UUID PRIMARY KEY,
    NAME VARCHAR(256) NOT NULL,
	STORE_ID UUID,
	FOREIGN KEY (STORE_ID) REFERENCES STORE(ID)
);

CREATE TABLE PRODUCT
(
	ID UUID PRIMARY KEY,
	NAME VARCHAR(256) NOT NULL,
	QUANTITY NUMERIC NOT NULL DEFAULT 0,
	DESCRIPTION VARCHAR(256) NOT NULL,
    INVENTORY_ID UUID REFERENCES INVENTORY(ID)
);
