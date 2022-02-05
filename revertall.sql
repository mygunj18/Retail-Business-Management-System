set serveroutput on
drop trigger customer_update_trigger;
drop trigger customer_insert_trigger;
drop trigger customer_updt_lvd_trigger;
drop trigger customer_updt_vm_trigger;
drop trigger purchases_insert_trigger;
drop trigger products_update_trigger;

drop function show_employees ;
drop function show_customers ;
drop function show_products ;
drop function show_purchases ;
drop function no_of_customers;

drop procedure purchases_made;
drop procedure add_customer;
drop procedure add_purchase;

drop table purchases;
drop table employees;
drop table customers;
drop table products;
drop table logs;

drop sequence seqpur#;
drop sequence seqlog#;

create table logs
(log# number(4) primary key,
user_name varchar2(12) not null,
operation varchar2(6) not null,
op_time date not null,
table_name varchar2(20) not null,
tuple_pkey varchar2(6));

create table employees
(eid char(3) primary key,
name varchar2(15) not null,
telephone# char(12),
email varchar2(20) unique);

create table customers
(cid char(4) primary key,
name varchar2(15),
telephone# char(12),
visits_made number(4) check (visits_made >= 1),
last_visit_date date);

create table products
(pid char(4) primary key,
name varchar2(15),
qoh number(4),
qoh_threshold number(4),
regular_price number(6,2),
discnt_rate number(3,2) check (discnt_rate in (0.0, 0.05, 0.1, 0.15, 0.2, 0.25)));

create table purchases
(pur# number(6) primary key,
eid char(3) references employees(eid),
pid char(4) references products(pid),
cid char(4) references customers(cid),
pur_date date,
qty number(5),
unit_price number(6,2),
total number(7,2),
saving number(6,2),
unique(eid, pid, cid, pur_date));

insert into employees values ('e01', 'David', '666-555-1234', 'david@rb.com');
insert into employees values ('e02', 'Peter', '777-555-2341', 'peter@rb.com');
insert into employees values ('e03', 'Susan', '888-555-3412', 'susan@rb.com');
insert into employees values ('e04', 'Anne', '666-555-4123', 'anne@rb.com');
insert into employees values ('e05', 'Mike', '444-555-4231', 'mike@rb.com');

insert into customers values ('c001', 'Kathy', '666-555-4567', 3, '30-MAR-21');
insert into customers values ('c002', 'John', '888-555-7456', 1, '08-OCT-20');
insert into customers values ('c003', 'Chris', '666-555-6745', 3, '18-FEB-21');
insert into customers values ('c004', 'Mike', '999-555-5674', 1, '15-JAN-21');
insert into customers values ('c005', 'Mike', '777-555-4657', 2, '30-AUG-20');
insert into customers values ('c006', 'Connie', '777-555-7654', 2, '16-MAR-21');
insert into customers values ('c007', 'Katie', '888-555-6574', 1, '12-DEC-20');
insert into customers values ('c008', 'Joe', '666-555-5746', 1, '14-NOV-20');

insert into products values ('p001', 'stapler', 60, 20, 9.99, 0.1);
insert into products values ('p002', 'TV', 6, 5, 249, 0.15);
insert into products values ('p003', 'camera', 15, 3, 148, 0.2);
insert into products values ('p004', 'pencil', 100, 10, 0.99, 0.0);
insert into products values ('p005', 'chair', 10, 8, 49.98, 0.2);
insert into products values ('p006', 'lamp', 10, 6, 19.95, 0.1);
insert into products values ('p007', 'tablet', 50, 10, 199, 0.1);
insert into products values ('p008', 'computer', 5, 3, 499, 0.25);
insert into products values ('p009', 'facemask', 25, 20, 18.50, 0.1);
insert into products values ('p010', 'powerbank', 20, 5, 30, 0.1);

--------------------------------
--pro2que1
create sequence seqpur#
start with 100001
increment by 1;

create sequence seqlog#
start with 1001
increment by 1;

insert into purchases values (seqpur#.nextval, 'e01', 'p002', 'c001', to_date('12-AUG-2020', 'DD-MON-YYYY'), 1, 211.65, 211.65, 37.35);
insert into purchases values (seqpur#.nextval, 'e01', 'p003', 'c001', to_date('20-DEC-2020', 'DD-MON-YYYY'), 1, 118.40, 118.40, 29.60);
insert into purchases values (seqpur#.nextval, 'e02', 'p004', 'c002', to_date('08-OCT-2020', 'DD-MON-YYYY'), 5, 0.99, 4.95, 0);
insert into purchases values (seqpur#.nextval, 'e01', 'p005', 'c003', to_date('23-NOV-2020', 'DD-MON-YYYY'), 2, 39.98, 79.96, 20);
insert into purchases values (seqpur#.nextval, 'e04', 'p007', 'c004', to_date('15-JAN-2021', 'DD-MON-YYYY'), 1, 179.10, 179.10, 19.90);
insert into purchases values (seqpur#.nextval, 'e03', 'p009', 'c001', to_date('30-MAR-2021', 'DD-MON-YYYY'), 2, 16.65, 33.30, 3.70);
insert into purchases values (seqpur#.nextval, 'e03', 'p009', 'c003', to_date('10-JAN-2021', 'DD-MON-YYYY'), 3, 16.65, 49.95, 5.55);
insert into purchases values (seqpur#.nextval, 'e03', 'p006', 'c005', to_date('16-AUG-2020', 'DD-MON-YYYY'), 1, 17.96, 17.96, 1.99);
insert into purchases values (seqpur#.nextval, 'e03', 'p001', 'c007', to_date('12-DEC-2020', 'DD-MON-YYYY'), 1, 8.99, 8.99, 1.0);
insert into purchases values (seqpur#.nextval, 'e04', 'p002', 'c006', to_date('19-OCT-2020', 'DD-MON-YYYY'), 1, 211.65, 211.65, 37.35);
insert into purchases values (seqpur#.nextval, 'e02', 'p004', 'c006', to_date('16-MAR-2021', 'DD-MON-YYYY'), 10, 0.99, 9.90, 0);
insert into purchases values (seqpur#.nextval, 'e02', 'p008', 'c003', to_date('18-FEB-2021', 'DD-MON-YYYY'), 2, 374.25, 748.50, 249.50);
insert into purchases values (seqpur#.nextval, 'e04', 'p009', 'c005', to_date('30-AUG-2020', 'DD-MON-YYYY'), 2, 16.65, 33.30, 3.70);
insert into purchases values (seqpur#.nextval, 'e03', 'p010', 'c008', to_date('14-NOV-2020', 'DD-MON-YYYY'), 3, 27, 81, 9);
--------------------------------
--pro2que6triggers
create or replace trigger customer_update_trigger
after
insert on purchases
for each row
declare
        new_cid customers.cid%type;
        new_pur_qty purchases.qty%type;
        new_pid products.pid%type;
        new_pur_date purchases.pur_date%type;
        date_temp customers.last_visit_date%type;
        qoh_temp products.qoh%type;
        qoh_threshold_temp products.qoh_threshold%type;
begin
        new_cid := :new.cid;
        new_pur_qty := :new.qty;
        new_pid := :new.pid;
        new_pur_date := :new.pur_date;

        select last_visit_date into date_temp from customers where new_cid = customers.cid;

        if trunc(date_temp) < trunc(new_pur_date) then
        update customers set customers.visits_made = visits_made + 1, customers.last_visit_date = sysdate where customers.cid = new_cid;
        end if;


        update products set products.qoh = qoh - new_pur_qty where products.pid = new_pid;

        select qoh into qoh_temp from products where products.pid = new_pid;
        select qoh_threshold into qoh_threshold_temp from products where products.pid = new_pid;

        if qoh_temp < qoh_threshold_temp then
                dbms_output.put_line('The current qoh of the product is below the required threshold and new supply is required.');
                update products set qoh = qoh_threshold + 10 where products.pid = new_pid;
                select qoh into qoh_temp from products where products.pid = new_pid;
                dbms_output.put_line('The new value of the qoh of the product after new supply is: '||qoh_temp);
        end if;
end;
/
show errors
-------------------------------------
--pro2que7triggers
--1
create or replace trigger customer_insert_trigger
after insert on customers
for each row
declare
        u_cid customers.cid%type;
begin
        u_cid := :new.cid;
        insert into logs(log#,user_name,operation,op_time, table_name, tuple_pkey) values
                (seqlog#.nextval, USER, 'INSERT', sysdate, 'customers', u_cid );
end;
/
show errors

--2

create or replace trigger customer_updt_lvd_trigger
after update on customers
for each row
when (new.last_visit_date > old.last_visit_date)
declare
        v_cid customers.cid%type;
begin
        v_cid := :new.cid;
        insert into logs(log#,user_name,operation,op_time, table_name, tuple_pkey) values
                (seqlog#.nextval, USER, 'UPDATE', sysdate, 'customers', v_cid );
end;
/
show errors

--3

create or replace trigger customer_updt_vm_trigger
after update on customers
for each row
when (new.visits_made > old.visits_made)
declare
        w_cid customers.cid%type;
begin
        w_cid := :new.cid;
        insert into logs(log#,user_name,operation,op_time, table_name, tuple_pkey) values
                (seqlog#.nextval, USER, 'UPDATE', sysdate, 'customers', w_cid );
end;
/
show errors

--4

create or replace trigger purchases_insert_trigger
after insert on purchases
for each row
when(new.pur# > old.pur#)
declare
        x_pur# purchases.pur#%type;
begin
        x_pur# := :new.pur#;
        insert into logs(log#,user_name,operation,op_time, table_name, tuple_pkey) values
                (seqlog#.nextval, USER, 'INSERT', sysdate, 'purchases', x_pur#);
end;
/
show errors

--5

create or replace trigger products_update_trigger
after update on products
for each row
when(new.qoh > old.qoh)
declare
        y_qoh products.qoh%type;
begin
        y_qoh := :new.qoh;
        insert into logs(log#,user_name,operation,op_time, table_name, tuple_pkey) values
                (seqlog#.nextval, USER, 'UPDATE', sysdate, 'products', y_qoh);
end;
/
show errors

