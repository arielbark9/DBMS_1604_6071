
create table worker_at_garage (
       worker_ID int not null,
       garage_ID int not null,
       FOREIGN KEY (garage_ID) REFERENCES yomalka.garage(garage_id),
       FOREIGN KEY (worker_ID) REFERENCES barkalif.worker(id)
       );
       
       
select distinct buy_year,count(*) from 
(select * from barkalif.worker join barkalif.worker_at_garage on worker.id = worker_at_garage.worker_id
natural join yomalka.garage natural join yomalka.cars_stock natural join yomalka.colors
where color_name = 'White' and yomalka.cars_stock.branch_id in (select branch_id from barkalif.branch
where barkalif.branch.yearstart = 2002) and buy_year > 2017)
group by buy_year;


select distinct color_name,count(*) from 
(select * from barkalif.worker join barkalif.worker_at_garage on worker.id = worker_at_garage.worker_id
natural join yomalka.garage natural join yomalka.cars_stock natural join yomalka.colors
where buy_year between 2017 and 2020 and yomalka.cars_stock.branch_id in (select branch_id from barkalif.branch
where barkalif.branch.yearstart = 2002))
group by color_name;

select distinct garage_id , count(*) from 
(select * from barkalif.worker join barkalif.worker_at_garage on worker.id = worker_at_garage.worker_id
natural join yomalka.garage natural join yomalka.cars_stock natural join yomalka.colors
where buy_year between 2010 and 2020 and yomalka.cars_stock.branch_id in (select branch_id from barkalif.branch
where barkalif.branch.yearstart = 2002))
group by garage_id;
