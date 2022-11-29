--1
	select * from size
	inner join size_products on size.id = size_products.size_id
	inner join products on size_products.product_id = products.id
	
--2
	select name,type from categories 
	left join sub_categories on categories.id = sub_categories.category_id
	
--3
	select * from street as st
	inner join district as dt on st.id = dt.street_id
	inner join city as ct on dt.id = ct.district_id
	inner join country as co on ct.id = co.city_id
	inner join adresses as ad on co.id = ad.country_id
	inner join customers as cus on ad.customer_id=cus.id 
--4
	select * from colors as cs
	inner join color_products as cp on cs.id = cp.colors_id
	right join products as p on cp.product_id = p.id
	
--5
	select cc.bank_name, cu.name, cu.surname, cc.number, cc.expiration_date from creditcard as cc
	right join customers as cu on cc.customer_id = cu.id
--6
	select * from creditcard as cc
	right join customers as cu on cc.customer_id = cu.id
	where cc.expiration_date is null
--7
	select * from sellers as sl
	inner join product_sellers as ps on sl.id = ps.seller_id
	inner join products as pr on ps.product_id = pr.id
--8
	select * from sellers as sl
	full join product_sellers as ps on sl.id = ps.seller_id
	full join products as pr on ps.product_id = pr.id
	where sl.follower_count < 2000 and unit_price between money(60) and money(100)
--9
	select * from street as st
	inner join district as dt on st.id = dt.street_id
	inner join city as ct on dt.id = ct.district_id
	inner join country as co on ct.id = co.city_id
	inner join adresses as ad on co.id = ad.country_id
	inner join customers as cus on ad.customer_id=cus.id 
	where cus.name = 'emir'
--10
	select p.name,c.type from categories as c
	left join sub_categories as sc on c.id = sc.category_id
	inner join products as p on c.id = p.category_id
--11
	select count(*),c.name from categories as c
	left join sub_categories as sc on c.id = sc.category_id
	inner join products as p on c.id = p.category_id
	group by c.name
--12
	select min(pr.unit_price) ,pr.name from sellers as sl
	full join product_sellers as ps on sl.id = ps.seller_id
	full join products as pr on ps.product_id = pr.id
	group by pr.name
	having  min(pr.unit_price) <= money(20)
	order by 2
--13
	select * from customers as c
	inner join adresses as ad on c.id = ad.customer_id
	inner join title as t on ad.title_id = t.id
	where c.name LIKE 'c%'
--14
	select count(*)as urun_adedi,count(cs.id)as renk_adedi,p.name from colors as cs
	inner join color_products as cp on cs.id = cp.colors_id
	right join products as p on cp.product_id = p.id
	group by p.name
--15
	select cus.name,cus.email from street as st
	inner join district as dt on st.id = dt.street_id
	inner join city as ct on dt.id = ct.district_id
	inner join country as co on ct.id = co.city_id
	inner join adresses as ad on co.id = ad.country_id
	full join customers as cus on ad.customer_id=cus.id
	full join creditcard as cc on cus.id = cc.customer_id
	where not right(cus.email,11) = 'hotmail.com'
	 
	
	
	
	
	
