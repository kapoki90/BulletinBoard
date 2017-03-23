delete from kboard;
delete from kboard_comment;

drop sequence kboard_idx_seq;
create sequence kboard_idx_seq;

drop table kboard;
create table kboard (
    idx NUMBER(5,0) not null primary key,
    ref NUMBER(5,0) ,
    lev NUMBER(5,0) ,
    seq NUMBER(5,0) ,
    name varchar(50) not null,
    password varchar(30) not null,
    title varchar(80) not null,
    content varchar(500) not null,
    wdate TIMESTAMP (6) DEFAULT sysdate,
    hit NUMBER(5,0) ,
    ip varchar(20) not null
);

drop sequence kboard_comment_idx_seq;
create sequence kboard_comment_idx_seq;

drop table kboard_comment;
create table kboard_comment (
    idx int not null primary key,
    ref int not null,
    name varchar(50) not null,
    password varchar(30) not null,
    content varchar(500) not null,
    writedate TIMESTAMP (6) DEFAULT sysdate,
    ip varchar(20) not null
);

insert into kboard(idx, ref,lev,seq,name, password,title, content,hit,ip)
	values (Kboard_idx_seq.nextval,Kboard_idx_seq.currval,'0','0','홍길동', '1111','홍길동입니다.','<marquee>1등</marquee>','0','192.168.0.1');
insert into kboard(idx, ref,lev,seq,name, password,title, content,hit,ip)
	values (Kboard_idx_seq.nextval,Kboard_idx_seq.currval,'0','0','장길산', '1111','장길산입니다.','<marquee>2등</marquee>','0','192.168.0.1');
insert into kboard(idx, ref,lev,seq,name, password,title, content,hit,ip)
	values (Kboard_idx_seq.nextval,Kboard_idx_seq.currval,'0','0','이몽룡', '1111','이몽룡입니다.','<marquee>3등</marquee>','0','192.168.0.1');
	
	commit;