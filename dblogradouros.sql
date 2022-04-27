
CREATE DATABASE	 dblogradouros;

USE dblogradouros;

CREATE TABLE tblestados(
	estid				int					not null,
	estnome				varchar(25)			not null,
	estsigla			varchar(3)			not null,
	estnumhabitantes	decimal(5,1),
	estnumcidades		int,
	estregiao			varchar(25),
	estobservacoes		varchar(500),
	PRIMARY KEY(estid),
);
CREATE TABLE tblcidades(
	cidid				int					not null,
	cidnome				varchar(50)			not null,
	cidapelido			varchar(50),
	cidnumhabitantes	decimal(3,1),
	cidnumbairros		int,
	cidregiao			varchar(25),
	cidobservacoes		varchar(500),
	estid				int					not null,
	PRIMARY KEY(cidid),
	FOREIGN KEY(estid) REFERENCES tblestados (estid)
);
CREATE TABLE tblbairros(
	baiid				int					not null,
	bainome				varchar(50)			not null,
	bairnumhabitante	int,
	bairegiao			varchar(25),
	baiobservacoes		varchar(500),
	cidid				int					not null,
	PRIMARY KEY(baiid),
	FOREIGN KEY(cidid) REFERENCES tblcidades (cidid),
);
CREATE TABLE tblCeps(
	cepid				int					not null,
	cepnumero			decimal(8),
	ceplogradouro		varchar(100)		not null,
	cepnumeroinicial	int					not null,
	cepnumerofinal		int					not null,
	cepobservacoes		varchar(500),
	estid				int					not null,
	cidid				int					not null,
	baiid				int					not null,
	PRIMARY KEY(cepid),
	FOREIGN KEY(estid) REFERENCES tblestados(estid),
	FOREIGN KEY(cidid) REFERENCES tblcidades(cidid),
	FOREIGN KEY(baiid) REFERENCES tblbairros(baiid),
);

insert into tblestados values( 4, 'MINAS GERAIS','MG',23.000,157,'CERTRO OESTE','O ESTADO QUE MAIS RECEBE TURISTAS');

 
select * from tblestados;

update tblestados set estnome = 'Minas Gerais', estsigla = 'mG'
		where estid = 4;

update tblestados set estnome = 'MINAS',
					  estsigla = 'MG',
					  estnumhabitantes = 4.2,
                      estnumcidades = 157,
                      estregiao = 'SULDESTE',
                      estobservacoes = 'ESTADO DO QUEIJO'
                  where estid = 4;

select estid, estnome, estsigla, estnumhabitantes, estnumcidades,estregiao ,estobservacoes from tblestados 
		WHERE estid = 4;
		
delete  tblestados
		WHERE estid = 4;
		


delete tblestados;