USE myemployees;

CREATE TABLE job_grades(
grade_level VARCHAR(3),
lowest_sal  INT,
highest_sal INT);

INSERT INTO JOB_GRADES
VALUES ('A', 1000, 2999);

INSERT INTO JOB_GRADES
VALUES ('B', 3000, 5999);

INSERT INTO JOB_GRADES
VALUES ('C', 6000, 9999);

INSERT INTO JOB_GRADES
VALUES ('D', 10000, 14999);

INSERT INTO JOB_GRADES
VALUES ('E', 15000, 24999);

INSERT INTO JOB_GRADES
VALUES ('F', 25000, 40000);
