-- ex16_pseudo.sql
/*
�ǻ� �÷�. Pseudo Column

rownum
- ��¥ �÷��� �ƴѵ� �÷�ó�� �ൿ�ϴ� ���
- ���ȣ �ǻ��÷�(���� ���� ������ ��ȯ�ϴ� �ǻ� �÷�)
- ����Ŭ ����
- ���������� ���ϸ� ����ϱ� ����

*/
select * from tblInsa;

select name, buseo, jikwi, basicpay, rownum from tblInsa;

select name, buseo, jikwi, basicpay, rownum from tblInsa where rownum = 1;
select name, buseo, jikwi, basicpay, rownum from tblInsa where rownum <= 5;


select name, buseo, jikwi, basicpay, rownum --2.
    from tblInsa --1.
        order by basicpay desc; --3.


--**** rownum�� �׻� from ���� ����� �� ����(*****) ���������. *************
select name, buseo, jikwi, basicpay, rownum, rnum from 
--select * from 
    (select name, buseo, jikwi, basicpay, rownum as rnum
        from tblInsa
            order by basicpay desc); 



select name, buseo, jikwi, basicpay, rownum
        from tblInsa
                --where rownum = 1; --O
                --where rownum <= 5; --O
                ------------------------- rownum�� ����� 1�� ���ԵǴ� ������ ���� ����
                --where rownum = 3; --X
                --where rownum >= 10 and rownum <= 20;--X
                --where rownum >= 5;--X
                --where rownum = 2;--X
                --where rownum = 3;--X
                --where rownum >= 1 and rownum <= 5;
                --------- rownum�� ���ǿ� ����Ϸ��� �ݵ�� 1���� �����ؼ� ���������� ���� ����� ���� �������� �����ϴ�.
                --where rownum = 1 or rownum = 2 or rownum = 3;--O
                --where rownum = 1 or rownum = 3 or rownum = 5;--X
                --where rownum = 1 or rownum = 2 or rownum = 4;--X


select name, buseo, jikwi, basicpay, rownum
        from tblInsa
                where rownum = 1 or rownum = 2 or rownum = 4;



-- �� : ����¡(paging)
-- ���� 60��

select name, basicpay, rownum 
        from tblInsa; --����

select name, basicpay, rownum 
        from tblInsa
                order by basicpay desc; --���ϴ� ���� + ���ȣ(��ȿX)

select name, basicpay, rownum
        from (select name, basicpay
                              from tblInsa
                                      order by basicpay desc); --���ϴ� ���� > �ٽ� ���ȣ �Ҵ�(from��)


select name, basicpay, rownum
        from (select name, basicpay
                              from tblInsa                                        
                                        order by basicpay desc)
                                                where rownum between 3 and 7; --���ϴ� ���� + ���ȣ ���� > ����
                                                
select name, basicpay, rownum as ��ݸ������ȣ, rnum as �Ʊ�����ȣ                                                 
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


--�α����� ���� ���� ���� ������� 3�� ��������
select * from
    (select a.*, rownum as rnum from
        (select * from tblCountry
            where population is not null
                   order by population asc) a)
                        where rnum between 1 and 3;


-- tblInsa. �μ��� �ο��� > Top 3 �μ� ����
select 
    b.*,
    (select round(avg(basicpay)) from tblInsa where buseo = b.buseo) as �ش�μ���ձ޿�
        from
            (select a.*, rownum as rnum from
                    (select buseo, count(*) as cnt from tblInsa
                            group by buseo
                                        order by count(*) desc) a) b
                                                where rnum <= 3;
     


-- ���뺰 �׷�
select * from
        (select ����, ��, rownum as rnum from
                (select floor(age / 10) * 10 as ����, count(*) as �� from tblAddressBook
                        group by floor(age / 10) order by count(*) desc))
                                where rnum = 2 or rnum = 4;









































































--\Z