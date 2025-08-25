

create table Locations (
	id          serial primary key,
	state       varchar(50),  -- not every country has states
	country     varchar(50) not null,
    constraint  unique_state_country unique nulls not distinct (state, country)
);

create table Tasters (
	id          serial primary key,
	family      varchar(30) not null,
	given       varchar(30) not null,
	lives_in    integer not null references Locations(id)
);

create table Brewers (
	id          serial primary key,
	name        varchar(50) not null,
	located_in  integer not null references Locations(id)
);

create table Beer_Styles (
	id          serial primary key,
	name        varchar(30) not null
);

create table Beers (
	id          serial primary key,
	name        varchar(50) not null,
	style       integer not null references Beer_Styles(id),
	brewer      integer not null references Brewers(id)
);

create table Ratings (
	taster      integer not null references Tasters(id),
	beer        integer not null references Beers(id),
	score       integer not null constraint valid_rating check (score >= 1 and score <= 5),
    primary key (taster, beer)
);
