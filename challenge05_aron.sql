-- challenge05_aron.sql (chapter 6)
-- Use public.people_heights to sort each person by their height.
/* Find out how much taller each person is than the person below.*/
CREATE TABLE public.people_heights (
    person_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    height_inches NUMERIC(5, 2) CHECK (height_inches > 0)
);
-- Insert one row with all columns
INSERT INTO public.people_heights (person_id, name, height_inches)
VALUES (1, 'Alice', 64.5);
-- Insert multiple rows with all columns
INSERT INTO public.people_heights (person_id, name, height_inches)
VALUES (2, 'Bob', 70.2),
    (3, 'Charlie', 67.8),
    (4, 'Diana', 62.4);
-- Insert one row with specific columns
INSERT INTO public.people_heights (person_id, name)
VALUES (5, 'Eve');
CREATE OR REPLACE VIEW people_heights_comparison AS
SELECT person_id,
    name,
    height_inches,
    LAG(name, 1) over (
        order by height_inches
    ) as "taller_than",
    height_inches - LAG(height_inches, 1) over (
        order by height_inches
    ) as "difference"
FROM public.people_heights;
SELECT *
FROM people_heights_comparison
ORDER BY height_inches;
/*
 "person_id" "name"	"height_inches"	"taller_than" "difference"
          4  'Diana'         62.40
          1	 'Alice'	     64.50	 'Diana'       2.10
          3	 'Charlie'       67.80	 'Alice'       3.30
          2	 'Bob'           70.20	 'Charlie'     2.40
          5	 'Eve'                   'Bob'
 */