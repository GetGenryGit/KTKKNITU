create table teachers(
	id serial primary key,
	title varchar(256) UNIQUE NOT NULL,
	status bool DEFAULT true
);

create table subjects(
	id serial primary key,
	title varchar(256) UNIQUE NOT NULL,
	status bool DEFAULT true
);

create table collectives(
	id serial primary key,
	title varchar(256) UNIQUE NOT NULL,
	status bool DEFAULT true
);

create table classrooms(
	id serial primary key,
	title varchar(256) UNIQUE NOT NULL,
	status bool DEFAULT true
);

create table schedules(
	id serial primary key,
	study_date date UNIQUE NOT NULL,
	date_of_publication timestamp NOT NULL DEFAULT now()
);

create table schedules_times(
	schedule_id int NOT NULL,
	start_at time NOT NULL,
	end_at time NOT NULL,
	FOREIGN KEY (schedule_id) REFERENCES schedules(id)
);

create table schedules_details(
	schedule_id int NOT NULL,
	class_index int NOT NULL,
	teacher_id int NOT NULL,
	subject_id int NOT NULL,
	collective_id int NOT NULL,
	classroom_id int NOT NULL,
	sub_group int NOT NULL,
	FOREIGN KEY (schedule_id) REFERENCES schedules(id),
	FOREIGN KEY (teacher_id) REFERENCES teachers(id),
	FOREIGN KEY (subject_id) REFERENCES subjects(id),
	FOREIGN KEY (collective_id) REFERENCES collectives(id),
	FOREIGN KEY (classroom_id) REFERENCES classrooms(id)
);

create table roles(
	id serial primary key,
	title varchar(64) NOT NULL
);

create table users(
	id serial primary key,
	login varchar(64)UNIQUE NOT NULL,
	pass varchar(512) NOT NULL,
	role_id int NOT NULL,
	FOREIGN KEY (role_id) REFERENCES roles(id)
);

create table logs(
	id serial primary key,
	event_describe TEXT NOT NULL,
	date_created timestamp NOT NULL DEFAULT now(),
	role_id int NOT NULL,
	FOREIGN KEY (role_id) REFERENCES roles(id) 
);

INSERT INTO roles(title)
VALUES('А.П.'),('О.Р.');

INSERT INTO classrooms(title)
VALUES('-', false);