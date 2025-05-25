create database conservation_db;

create table rangers
(
    ranger_id serial primary key,
    name      varchar(200) not null,
    region    varchar(500) not null
);

create type conservation_status_enum as enum ('Endangered', 'Vulnerable', 'Least Concern', 'Extinct');

create table species
(
    species_id          serial primary key,
    common_name         varchar(200)             not null,
    scientific_name     varchar(200)             not null,
    discovery_date      date,
    conservation_status conservation_status_enum not null
);


create table sightings
(
    sighting_id   serial primary key,
    ranger_id     int references rangers (ranger_id),
    species_id    int references species (species_id),
    sighting_time timestamp    not null,
    location      varchar(500) not null,
    notes         text
);

insert into rangers (name, region)
values ('Alice Green', 'Northern Hills'),
       ('Bob White', 'River Delta'),
       ('Carol King', 'Mountain Range');


insert into species (common_name, scientific_name, discovery_date, conservation_status)
values ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
       ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
       ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
       ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


insert into sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes)
values (1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
       (2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
       (3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
       (4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

--Problem 1
insert into rangers(name, region)
VALUES ('Derek Fox', 'Coastal Plains');

--Problem 2
select count(distinct species_id) as unique_species
from sightings;

--Problem 3
select *
from sightings
where location like '%Pass%';

--Problem 4
select name
from rangers
where ranger_id in (select ranger_id from sightings);

--Problem 5
select common_name
from species
where species_id not in (select species_id from sightings);


--Problem 6
select common_name, sighting_time, name
from sightings
         join species on sightings.species_id = species.species_id
         join rangers on sightings.ranger_id = rangers.ranger_id
order by sighting_id desc
limit 2;


--Problem 7
ALTER TYPE conservation_status_enum ADD VALUE 'Historic';

update species
set conservation_status = 'Historic'
where discovery_date < '1800-01-01';

--Problem 8
select sighting_id,
       case
           when extract(hour from sighting_time) between 0 and 11 then 'Morning'
           when extract(hour from sighting_time) between 12 and 17 then 'Afternoon'
           else 'Evening'
           end as time_of_day
from sightings;


--Problem 9

delete
from rangers
where ranger_id not in (select ranger_id from sightings);



