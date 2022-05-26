create table content( -- 문서내용 DB 작성문
cid int primary key auto_increment,
dno int,
mid varchar(50),
updatetime datetime default now(),
dcontent blob,
dgood int default 0,
);

create table synonys( -- 동의 DB 작성문
sno int primary key auto_increment,
dno int,
synpage varchar(50)
);

create table link( -- 링크 DB 작성문
dno int,
frompageno int,
topageno int,
misspagetitle varchar(50),
);


