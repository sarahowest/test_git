CREATE TABLE trainings (
	training_id VARCHAR (16),	
	subject VARCHAR (255),
	duration INT(6),
	PRIMARY KEY (training_id)
);
CREATE TABLE members (
	member_id INT (16),	
	name VARCHAR (20),
	lastname VARCHAR (20),
	birth_date DATE,
	PRIMARY KEY (member_id)
);
CREATE TABLE trainings_of_members (
	id INT(16),
	member_id INT (16),
	training_id VARCHAR (16),
	PRIMARY KEY (id),
	FOREIGN KEY (member_id)
	REFERENCES members (member_id),
	FOREIGN KEY (training_id)
	REFERENCES trainings (training_id)
);
CREATE TABLE equipment (
	eq_id INT(10),	
	name VARCHAR(60),
	manufacturer VARCHAR(60),
	purchase_date DATE,
	PRIMARY KEY (eq_id)
);
CREATE TABLE experiments (
	name VARCHAR(20),
	exp_id INT(10),
	performed_by INT(16),
	equipment_used INT(10),
	exp_date DATE,
	PRIMARY KEY (exp_id),
	FOREIGN KEY (performed_by)
	REFERENCES members (member_id),
	FOREIGN KEY (equipment_used)
	REFERENCES equipment (eq_id)
);
CREATE TABLE results (
	directory VARCHAR (60),
	experiment INT(10),
	status VARCHAR(60),
	PRIMARY KEY (directory),
	FOREIGN KEY (experiment)
	REFERENCES experiments (exp_id)
);
