# course_postgresql_advanced_queries

My own docker compose environment in order to follow this training: [postgresql-advanced-queries course on LinkedIn Learning](https://www.linkedin.com/learning/postgresql-advanced-queries).

```Shell
docker compose up -d --build
```

## What was new to me

### c1 Summary statistics by grouping

```SQL
GROUP BY CUBE (/* col, ... */)
GROUP BY ROLLUP (/* col, ... */)
bool_and(/* col */)
bool_or(/* col */)
stddev_pop(/* col */)
stddev_samp(/* col */)
var_pop(/* col */)
var_samp(/* col */)
/* aggregate function */ FILTER (WHERE /* condition */) AS /* "name" */
```

### c2 Window functions

* Window function: window frame showing the total result in every individual row instead of reducing rows to one for the whole group.

```SQL
/* aggregate function */ OVER()
```

* Partition row segmented: the result corresponding to the chosen col group is shown in every individual row.

```SQL
/* aggregate function */ OVER(PARTITION BY /* col */) AS /* "name" */
```

* Streamline partition queries with a WINDOW clause: avoid repeating PARTITION several times

```SQL
/* aggregate function */ OVER(/* col */)
FROM /* table */
WINDOW /* name */ AS (PARTITION BY /* col */)
```

* Acumulate results

```SQL
/* aggregate function */ OVER(ORDER BY /* col */) AS /* "name" */
```

* Sliding window

```SQL
/* aggregate function */ OVER(ORDER BY /* col */ ROWS BETWEEN /* begin */ PRECEDING AND /* end */ FOLLOWING) AS /* "name" */
```

* Return a value evaluated against the first row in a sorted partition of a result set.

```SQL
FIRST_VALUE(expression) OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
```

* Return a value evaluated against the last row in a sorted partition of a result set.

```SQL
LAST_VALUE(expression) OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
```

### c3 Statistics on sorted data

* Median (note that average is something different, it is just sum/n)

```SQL
PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY /* col */) AS "discrete median",
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY /* col */) AS "continuous median"
```

* First and third quartiles

```SQL
PERCENTILE_CONT(.25) WITHIN GROUP (ORDER BY /* col */) AS "1st quartile"
PERCENTILE_CONT(.50) WITHIN GROUP (ORDER BY /* col */) AS "2nd quartile"
PERCENTILE_CONT(.75) WITHIN GROUP (ORDER BY /* col */) AS "3rd quartile"
```

* Divide ordered rows in a partition into a specified number of ranked groups, which are as equal in size as possible. These ranked groups are called buckets.

```SQL
NTILE(buckets) OVER (
    [PARTITION BY partition_expression, ...]
    [ORDER BY sort_expression [ASC | DESC], ...]
)
```

### c4 Ranking

* Assign a rank to each row within a partition of the result set.

```SQL
RANK() OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
```

* Evaluate the relative standing of a value within a set of values.

```SQL
PERCENT_RANK() OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
```

* Return the relative position of a value in a set of values.

```SQL
CUME_DIST() OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
```
