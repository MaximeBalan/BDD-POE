-- Table: public.poe

-- DROP TABLE IF EXISTS public.poe;

CREATE TABLE IF NOT EXISTS poes
(
    id serial,
    title character varying(150) NOT NULL,
    begin_date date NOT NULL,
    end_date date NOT NULL,
    poe_type character varying(10) NOT NULL,
    survey_one_month_date date,
    survey_six_month_date date, 
    survey_twelve_month_date date,  
    CONSTRAINT pk_poes PRIMARY KEY (id)
);

CREATE TABLE trainees (
    id serial,
    lastname varchar(50) NOT NULL,
    firstname varchar(50) NOT NULL,
    gender char(1),
    birthdate date NOT NULL,
    email varchar(100) NOT NULL,
    phone_number varchar(15),
    poe_id integer,
	CONSTRAINT pk_trainees PRIMARY KEY(id)
);

ALTER TABLE poes 
    ADD CONSTRAINT chk_poes_dates
    CHECK (begin_date < end_date);

ALTER TABLE trainees
    ADD CONSTRAINT uniq_trainees_email 
	UNIQUE (email);

ALTER TABLE trainees
    ADD CONSTRAINT fk_trainees_poe
    FOREIGN KEY (poe_id)
    REFERENCES poes(id);
