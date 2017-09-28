insert into board_type(btype, name, state)
values (0, '일반게시판', 1);

insert into board_type(btype, name, state)
values (1, '한줄게시판', 1);

insert into board_type(btype, name, state)
values (2, '이미지게시판', 1);

insert into category(ccode, name, state)
values (category_seq.nextval, 'RNB 사우회', 1);

insert into category(ccode, name, state)
values (category_seq.nextval, '소식 / 인사', 1);

insert into category(ccode, name, state)
values (category_seq.nextval, '사우 게시판', 1);

insert into category(ccode, name, state)
values (category_seq.nextval, '즐겨찾기', 1);

insert into category(ccode, name, state)
values (category_seq.nextval, '운영진', 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 1, 0, '공지사항', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 1, 0, '회칙', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 1, 0, '경조사', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 1, 0, '경조금 신청', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 1, 0, 'Q&A 건의 게시판', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 2, 0, '가입 / 등업 인사', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 2, 1, '한줄 / 안부 인사', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 3, 0, 'IT 기술 동향', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 3, 0, '이벤트 게시판', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 3, 0, '자유 게시판', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 3, 0, '행사 갤러리', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 3, 0, '나눔장터', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 4, 2, '이미지 보기', 0, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 5, 2, '관리 게시판', 4, 1);

insert into board_list(bcode, ccode, btype, name, role, state)
values (board_list_seq.nextval, 5, 2, '운영자 게시판', 4, 1);

insert into member values('rnb','$2a$10$PlLqZ5o2S2x4hpCXaMQHc.rDZIlJZL7NgEiFZ9sg9JUGSetYfStN6',
   'rnb',0,'19910101','01012344575',4,sysdate,1);