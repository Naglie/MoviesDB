create database dbMovies

create table tFilm (
	FilmID int identity not null primary key,
	Title nvarchar(30) not null,
	Year int not null,
	Description nvarchar(max) not null,
	Runtime int null,
	Poster nvarchar(2083) null
);

create table tLanguage (
	LanguageID int identity not null primary key,
	LanguageName nvarchar(25) not null
);

create table tGenre (
	GenreID int identity not null primary key,
	GenreName nvarchar(35) not null
);

create table tPerson (
	PersonID int identity not null primary key,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null
);

create table tFilmLanguage (
	ID_Film_language int not null,
	ID_Language int not null
);

create table tFilmGenre (
	ID_Genre int not null,
	ID_Film_genre int not null
);

create table tFilmPerson (
	FilmID int not null,
	PersonID int not null,
	Type nvarchar(50) not null
);


alter table tFilmLanguage
add constraint unique_FilmLanguage unique ([ID_Film_language],[ID_Language])

alter table tFilmLanguage
add constraint fk_LanguageOfFilm
	foreign key ([ID_Language]) references tLanguage ([LanguageID])

alter table tFilmGenre
add constraint fk_GenreOfFilm
	foreign key ([ID_Genre]) references tGenre ([GenreID])

alter table tFilmGenre
add constraint unique_FilmGenre unique ([ID_Genre],[ID_Film_genre])

alter table tFilmPerson
add constraint fk_PersonOfFilm
	foreign key ([FilmID]) references tFilm ([FilmID])

alter table tFilmPerson
add constraint fk_ParticularPerson
	foreign key ([PersonID]) references tPerson ([PersonID])


backup database dbMovies
TO DISK = 'D:\JPTV20\SQL\filmDB.bak'
WITH DIFFERENTIAL;