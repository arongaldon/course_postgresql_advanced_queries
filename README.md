# course_postgresql_advanced_queries

My own docker compose environment in order to follow this training: [postgresql-advanced-queries course on LinkedIn Learning](https://www.linkedin.com/learning/postgresql-advanced-queries).

```Shell
docker compose up -d --build
```

## What was new to me

### c1

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
