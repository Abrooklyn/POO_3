mysql> SELECT lastname, firstname, age FROM Person;
+---------------+-------------+-----+
| lastname      | firstname   | age |
+---------------+-------------+-----+
| Pendragon     | Arthur      |  35 |
| NULL          | Guenièvre   |  30 |
| NULL          | Merlin      | 850 |
| NULL          | Perceval    |  36 |
| NULL          | Caradoc     |  32 |
| NULL          | Calogrenant |  44 |
| NULL          | Leodagan    |  47 |
| Du Lac        | Lancelot    |  33 |
| De Kelliwich  | Elias       |  52 |
|               | Mevanwi     |  28 |
|               | Yvain       |  23 |
+---------------+-------------+-----+

mysql> SELECT name, lastname, firstname FROM person INNER JOIN kingdom ON person.kingdom_id=kingdom.id;
+-----------+-----------+-------------+
| name      | lastname  | firstname   |
+-----------+-----------+-------------+
| Logre     | Pendragon | Arthur      |
| Caledonie | NULL      | Calogrenant |
| Carmelide | NULL      | Guenièvre   |
| Carmelide | NULL      | Leodagan    |
| Carmelide |           | Yvain       |
| Vannes    | NULL      | Caradoc     |
| Vannes    |           | Mevanwi     |
| Galles    | NULL      | Perceval    |
+-----------+-----------+-------------+

mysql> SELECT name, lastname, firstname FROM person LEFT JOIN kingdom ON person.kingdom_id=kingdom.id;
+-----------+---------------+-------------+
| name      | lastname      | firstname   |
+-----------+---------------+-------------+
| Logre     | Pendragon     | Arthur      |
| Carmelide | NULL          | Guenièvre   |
| NULL      | NULL          | Merlin      |
| Galles    | NULL          | Perceval    |
| Vannes    | NULL          | Caradoc     |
| Caledonie | NULL          | Calogrenant |
| Carmelide | NULL          | Leodagan    |
| NULL      | Du Lac        | Lancelot    |
| NULL      | De Kelliwich  | Elias       |
| Vannes    |               | Mevanwi     |
| Carmelide |               | Yvain       |
+-----------+---------------+-------------+

SELECT AVG(age) as average FROM person;
+----------+
| average  |
+----------+
| 110.0000 |
+----------+

mysql> SELECT name, count(*) AS nb FROM person INNER JOIN kingdom ON person.kingdom_id=kingdom.id GROUP BY name ORDER BY nb DESC;
+-----------+----+
| name      | nb |
+-----------+----+
| Carmelide |  3 |
| Vannes    |  2 |
| Logre     |  1 |
| Caledonie |  1 |
| Galles    |  1 |
+-----------+----+

mysql> SELECT AVG(age) as average, name FROM person INNER JOIN kingdom ON person.kingdom_id=kingdom.id GROUP BY name;
+---------+-----------+
| average | name      |
+---------+-----------+
| 35.0000 | Logre     |
| 44.0000 | Caledonie |
| 33.3333 | Carmelide |
| 30.0000 | Vannes    |
| 36.0000 | Galles    |
+---------+-----------+

mysql> SELECT AVG(age) as average FROM person INNER JOIN role ON person.role_id=role.id WHERE role NOT IN ('magicien');
+---------+
| average |
+---------+
| 35.7143 |
+---------+

mysql> SELECT * FROM person INNER JOIN role ON person.role_id=role.id INNER JOIN kingdom ON person.kingdom_id=kingdom.id;
+----+-------------+-----------+-----+---------+------------+----+-----------+----+-----------+
| id | firstname   | lastname  | age | role_id | kingdom_id | id | role      | id | name      |
+----+-------------+-----------+-----+---------+------------+----+-----------+----+-----------+
|  1 | Arthur      | Pendragon |  35 |       1 |          1 |  1 | roi       |  1 | Logre     |
|  6 | Calogrenant | NULL      |  44 |       1 |          2 |  1 | roi       |  2 | Caledonie |
|  7 | Leodagan    | NULL      |  47 |       1 |          3 |  1 | roi       |  3 | Carmelide |
|  4 | Perceval    | NULL      |  36 |       2 |          5 |  2 | chevalier |  5 | Galles    |
|  5 | Caradoc     | NULL      |  32 |       2 |          4 |  2 | chevalier |  4 | Vannes    |
| 11 | Yvain       |           |  23 |       2 |          3 |  2 | chevalier |  3 | Carmelide |
+----+-------------+-----------+-----+---------+------------+----+-----------+----+-----------+