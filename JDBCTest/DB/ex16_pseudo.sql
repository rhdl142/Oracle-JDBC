-- ex16_pseudo.sql
/*
의사 컬럼. Pseudo Column

rownum
- 진짜 컬럼이 아닌데 컬럼처럼 행동하는 요소
- 행번호 의사컬럼(현재 행의 순서를 반환하는 의사 컬럼)
- 오라클 전용
- 서브쿼리를 잘하면 사용하기 쉬움

*/
select * from tblInsa;

select name, buseo, jikwi, basicpay, rownum from tblInsa;

select name, buseo, jikwi, basicpay, rownum from tblInsa where rownum = 1;
select name, buseo, jikwi, basicpay, rownum from tblInsa where rownum <= 5;


select name, buseo, jikwi, basicpay, rownum --2.
    from tblInsa --1.
        order by basicpay desc; --3.


--**** rownum은 항상 from 절이 실행될 때 새로(*****) 만들어진다. *************
select name, buseo, jikwi, basicpay, rownum, rnum from 
--select * from 
    (select name, buseo, jikwi, basicpay, rownum as rnum
        from tblInsa
            order by basicpay desc); 



select name, buseo, jikwi, basicpay, rownum
        from tblInsa
                --where rownum = 1; --O
                --where rownum <= 5; --O
                ------------------------- rownum의 결과가 1이 포함되는 조건은 실행 가능
                --where rownum = 3; --X
                --where rownum >= 10 and rownum <= 20;--X
                --where rownum >= 5;--X
                --where rownum = 2;--X
                --where rownum = 3;--X
                --where rownum >= 1 and rownum <= 5;
                --------- rownum을 조건에 사용하려면 반드시 1부터 시작해서 연속적으로 값을 사용할 때만 조건으로 가능하다.
                --where rownum = 1 or rownum = 2 or rownum = 3;--O
                --where rownum = 1 or rownum = 3 or rownum = 5;--X
                --where rownum = 1 or rownum = 2 or rownum = 4;--X


select name, buseo, jikwi, basicpay, rownum
        from tblInsa
                where rownum = 1 or rownum = 2 or rownum = 4;



-- 웹 : 페이징(paging)
-- 직원 60명

select name, basicpay, rownum 
        from tblInsa; --원본

select name, basicpay, rownum 
        from tblInsa
                order by basicpay desc; --원하는 정렬 + 행번호(유효X)

select name, basicpay, rownum
        from (select name, basicpay
                              from tblInsa
                                      order by basicpay desc); --원하는 정렬 > 다시 행번호 할당(from절)


select name, basicpay, rownum
        from (select name, basicpay
                              from tblInsa                                        
                                        order by basicpay desc)
                                                where rownum between 3 and 7; --원하는 정렬 + 행번호 조건 > 실패
                                                
select name, basicpay, rownum as 방금만든행번호, rnum as 아까만든행번호                                                 
    from (select name, basicpay, rownum as rnum
            from (select name, basicpay
                                  from tblInsa                                        
                                            order by basicpay desc))
                                                        --where rownum = 3;
                                                        where rnum between 21 and 40;

-- [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

create view vwSubSet
as
select name, basicpay, rownum as rnum
        from (select name, basicpay
                              from tblInsa                                        
                                        order by basicpay desc);

select name, basicpay, rownum from vwSubSet where rnum = 10;


--인구수가 가장 적은 나라 순서대로 3개 가져오기
select * from
    (select a.*, rownum as rnum from
        (select * from tblCountry
            where population is not null
                   order by population asc) a)
                        where rnum between 1 and 3;


-- tblInsa. 부서별 인원수 > Top 3 부서 정보
select 
    b.*,
    (select round(avg(basicpay)) from tblInsa where buseo = b.buseo) as 해당부서평균급여
        from
            (select a.*, rownum as rnum from
                    (select buseo, count(*) as cnt from tblInsa
                            group by buseo
                                        order by count(*) desc) a) b
                                                where rnum <= 3;
     


-- 세대별 그룹
select * from
        (select 세대, 명, rownum as rnum from
                (select floor(age / 10) * 10 as 세대, count(*) as 명 from tblAddressBook
                        group by floor(age / 10) order by count(*) desc))
                                where rnum = 2 or rnum = 4;









































































--\Z