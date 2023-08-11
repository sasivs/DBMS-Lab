create table Frequents(
drinker varchar(30),
bar varchar(30));

insert into Frequents 
values
('Peter Parker', 'Nexus'),
('Stephen Strange', 'Sanctum'),
('Steve Rogers', 'Knowhere'),
('Tony Stark', 'Vormir');
insert into Frequents values
('Wanda Maximoff', 'Sokovia');

insert into Frequents values
('Maria Rambo', 'Nexus'),
('Vision', 'Nexus'),
('Wong', 'Sanctum'),
('Supreme Strange', 'Sanctum');

insert into Frequents values
('America Chavez', 'Sanctum'),
('Green Goblin', 'Sanctum');

select * from Frequents;

create table Serves(
bar varchar(30),
beer varchar(30));

insert into Serves 
values
('Nexus', 'heineken'),
('Nexus', 'bud'),
('Sanctum', 'heineken'),
('Sanctum', 'bud'),
('Knowhere', 'Kingfisher'),
('Vormir', 'Kingfisher'),
('Vormir', 'Tuborg'),
('Vormir', 'be1'),
('Nexus', 'be1'),
('Sokovia', 'be1'),
('Sokovia', 'Carlsberg'),
('West view', 'Fosters'),
('Wakanda', 'Hoegaarden'),
('Wakanda', 'Haywards 5000');

select * from Serves;

select distinct s.bar from Serves s where s.bar not in (select f.bar from Frequents f);

select f.drinker from Frequents f where f.bar in (select s.bar from Serves s where s.beer='be1');

select f.bar, count(f.drinker) from Frequents f join
(Serves s1 join Serves s2 on s1.bar=s2.bar and
(s1.beer='heineken' and s2.beer='bud')) on f.bar=s1.bar 
group by f.bar; 