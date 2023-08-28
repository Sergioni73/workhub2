
-- create
CREATE TABLE Analysis (an_id int, an_name varchar(20), an_cost int, an_price int, an_group int, PRIMARY KEY (an_id));
CREATE TABLE Groups (gr_id int, gr_name varchar(20), gr_temp int, PRIMARY KEY (gr_id));
CREATE TABLE Orders (ord_id int, ord_datetime datetime, ord_an int, PRIMARY KEY (ord_id));

-- insert
INSERT INTO Analysis(an_id, an_name, an_cost, an_price, an_group) VALUES (0031, 'Blood1', 300, 500, 021);
INSERT INTO Analysis(an_id, an_name, an_cost, an_price, an_group) VALUES (0032, 'Blood2', 500, 700, 022);
INSERT INTO Analysis(an_id, an_name, an_cost, an_price, an_group) VALUES (0033, 'Urine1', 200, 500, 023);

INSERT INTO Groups(gr_id, gr_name, gr_temp) VALUES (021, 'General', 10);
INSERT INTO Groups(gr_id, gr_name, gr_temp) VALUES (022, 'Leukocytes', -5);
INSERT INTO Groups(gr_id, gr_name, gr_temp) VALUES (023, 'Leukocytes', -10);

INSERT INTO Orders(ord_id, ord_datetime, ord_an) VALUES (1032573, '2020-03-21 09:10:23', 0031);
INSERT INTO Orders(ord_id, ord_datetime, ord_an) VALUES (1032572, '2020-05-01 09:53:03', 0032);
INSERT INTO Orders(ord_id, ord_datetime, ord_an) VALUES (1032575, '2020-07-17 13:23:00', 0033);
INSERT INTO Orders(ord_id, ord_datetime, ord_an) VALUES (1032577, '2020-02-05 11:21:00', 0033);
INSERT INTO Orders(ord_id, ord_datetime, ord_an) VALUES (1032570, '2020-02-07 10:03:30', 0031);
INSERT INTO Orders(ord_id, ord_datetime, ord_an) VALUES (1032537, '2020-02-09 17:14:20', 0032);
INSERT INTO Orders(ord_id, ord_datetime, ord_an) VALUES (1032557, '2020-02-10 14:34:53', 0032);

ALTER TABLE Analysis ADD FOREIGN KEY (an_group) REFERENCES Groups (gr_id);
ALTER TABLE Orders ADD FOREIGN KEY (ord_an) REFERENCES Analysis (an_id);

-- fetch 
SELECT an_name, ord.ord_datetime FROM Analysis an
JOIN Groups gr ON an.an_group = gr.gr_id
JOIN Orders ord ON ord.ord_an = an.an_id
WHERE ord_datetime BETWEEN ('2020-02-05') AND DATEADD (week, 1, '2020-02-05')
