DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;


CREATE TABLE project(
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY(project_id) 
);
CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128),
	PRIMARY KEY(category_id)
);
CREATE TABLE material(
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT NOT NULL,
	cost DECIMAL(7, 2),
	PRIMARY KEY(material_id),
	FOREIGN KEY(project_id) REFERENCES project (project_id) ON DELETE CASCADE
);
CREATE TABLE step(
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY(step_id),
	FOREIGN KEY(project_id) REFERENCES project (project_id) ON DELETE CASCADE
);
CREATE TABLE project_category(
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY(project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY(category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

INSERT into project (project_name, estimated_hours, actual_hours, difficulty, notes) values ("Clean fire place", 5, 4, 2, "Make sure to have a heat proof container for the ash and coals from the previous fire.");
insert into material(project_id, material_name, num_required, cost) values (1, "Metal trash can", 1, 24.47);
insert into material(project_id, material_name, num_required, cost) values (1, "Metal dust pan and brush", 1, 8.50);
insert into step (project_id, step_text, step_order) values (1, "Wait at least 24 hours for coals to cool off", 1);
insert into step (project_id, step_text, step_order) values (1, "Brush left over carbon on the sides of the fire place", 2);
insert into step (project_id, step_text, step_order) values (1, "Begin sweeping up all left over ash and coals or unburnt wood from fire place", 3);
insert into step (project_id, step_text, step_order) values (1, "Dump all ash and coals into fire proof trash can", 4);
insert into step (project_id, step_text, step_order) values (1, "Close fire proof trash can and place outside away from any structure and let sit for a couple days", 5);
insert into step (project_id, step_text, step_order) values (1, "Take the coals and place into a plastic bag then throw away into trash", 6);
insert into category (category_id, category_name) values (1, 'fire place');
insert into category (category_id, category_name) values (2, 'Home maintenance');
insert into project_category (project_id, category_id) values (1, 1);
insert into project_category (project_id, category_id) values (1, 2);