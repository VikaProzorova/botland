create table accounts (
	id			 INT          NOT NULL AUTO_INCREMENT,
    email 	     VARCHAR(40)  NOT NULL,
	phone		 VARCHAR(40)  NOT NULL,
	password	 VARCHAR(100) NOT NULL,
	status	     enum("NEW", "ACTIVE", "BLOCKED", "DELETED") NOT NULL DEFAULT "NEW"
	createdAt	 DATETIME     NOT NULL,
	updatedAt    DATETIME     NOT NULL,
	createdBy	 INT 		  NOT NULL,
	updatedBy    INT 		  NOT NULL,
	

    PRIMARY KEY (id),
    FOREIGN KEY (updatedBy) REFERENCES users (id),
    FOREIGN KEY (createdBy) REFERENCES users (id)

)  DEFAULT CHARACTER SET utf8;

create table users (
	id			 INT          NOT NULL AUTO_INCREMENT,
    email 	     VARCHAR(40)  NOT NULL,
    name		 VARCHAR(256) NOT NULL,
	password	 VARCHAR(100) NOT NULL,
	createdAt	 DATETIME     NOT NULL,
	updatedAt    DATETIME     NOT NULL,

	PRIMARY KEY (id),
	UNIQUE KEY (email)
)  DEFAULT CHARACTER SET utf8;

create table tasks (
	id			 	 INT          NOT NULL AUTO_INCREMENT,
	twitterID	 	 VARCHAR(256) NOT NULL,
	type		 	 enum("LIKE", "SUBSCRIBE", "VOTE", "RETWEET") NOT NULL,
	status	     	 enum("NEW", "IN_PROGRESS", "DONE", "ERROR", "CANCELED") NOT NULL DEFAULT "NEW",
	expectedAccounts INT 		  NOT NULL,
	createdAt	 	 DATETIME     NOT NULL,
	updatedAt    	 DATETIME     NOT NULL,
	createdBy	 	 INT 		  NOT NULL,
	updatedBy    	 INT 		  NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (updatedBy) REFERENCES users (id),
    FOREIGN KEY (createdBy) REFERENCES users (id)

) DEFAULT CHARACTER SET utf8;

create table activity (
	id		     INT           NOT NULL AUTO_INCREMENT,
	taskID 	     INT           NOT NULL,
	accountID    INT           NOT NULL,
	status	     enum("DONE", "AUTHORIZATION_ERROR", "FAILED") NOT NULL DEFAULT "DONE",
	reasone      VARCHAR(1024) NOT NULL,
	createdAt    DATETIME      NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (taskID) REFERENCES tasks (id),
    FOREIGN KEY (accountID) REFERENCES accounts (id)
) DEFAULT CHARACTER SET utf8;






