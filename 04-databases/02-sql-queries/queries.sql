---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
-- TODO: SELECT ...
select * from sites
-- Get all sites sorted by name
-- TODO: SELECT ...
select * from sites order by name
-- Get all activity names sorted by name
-- TODO: SELECT ...
select * from activities order by name
-- Get all "Sport" activities
-- TODO: SELECT ...
-- Expected result: 8 rows
select * from activities where category = 'Sport'
-- Get all Escape Games in Nantes
-- TODO: SELECT ...
-- Expected result: 3 rows
select * from activities where name like '%Escape Game%'

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
-- TODO: SELECT ...
-- Expected result: 44
select count(*) from activities
-- Count all "Adventure" activities
-- TODO: SELECT ...
-- Expected result: 13
select count(*) from activities where category = 'Adventure'
-- Count the number of activities per category
-- TODO: SELECT ...
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Cultural    6
-- Food        6
-- Sport       8
-- Visits      5
-- Workshops   6
select category, count(*) as total  from activities group by category
-- Get the 3 category names with the biggest number of activities
-- TODO: SELECT ...
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Sport       8
-- Cultural    6
select category, count(*) as total  from activities group by category order by total desc limit 3
---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working FROM site "Ile de Nantes", sorted by first name
-- TODO: SELECT ...
-- Expected result: 53 rows
select first_name, last_name from employees
join sites on sites.id = employees.site_id
where sites.name = 'Ile de Nantes'
order by first_name
-- Get all the activity names where you have been to, sorted by name
-- TODO: SELECT ...
-- Expected result: well, it depends on who you are :)
select name from activities
join team_building_sessions on team_building_sessions.activity_id = activities.id
join participations on participations.team_building_session_id = team_building_sessions.id
join employees on employees.id = participations.employee_id
where employees.first_name = 'Cassandre'
order by name
-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
-- TODO: SELECT ...
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

-- Get the team names and total number of team building sessions done, sorted by top teams
-- TODO: SELECT ...
-- Expected result:
-- name        total_sessions
-- ----------  --------------
-- R&D         7
-- Marketing   4
-- Business D  3
-- Product Ow  3
-- Finance &   2
-- UI / UX     2
-- Customer S  1

-- Get all the employee names, team names and site names that have never attended a team building session
-- TODO: SELECT ...
-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to leASt expensive
-- TODO: SELECT ...
-- Expected result:
-- name          total_price
-- ------------  -----------
-- Finance & RH  1620
-- Business Dev  1446
-- R&D           1140
-- Marketing     445
-- Customer Suc  360
-- Product Owne  267
-- UI / UX       240

-- Get the site names and total number of team building sessions done, sorted by top sites
-- TODO: SELECT ...
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Ile de Nantes  12
-- Paris 13ème    10
