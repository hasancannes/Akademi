--1: Ürünlerin ortalama fiyatı nedir?
	select name, round(avg(unit_price*stock),2) as "ortalama fiyat" from products
	group by name
	
--2: Ürünlerin toplam fiyatı nedir?
	select name, round(sum(unit_price*stock),2) as "toplam fiyat" from products
	group by name
	
--3: Sepetteki ürünlerin maximum fiyatı nedir?
	select max(total_price) as "Maximum Fiyat", p.name from baskets as b
	inner join products as p on b.product_id = p.id
	group by p.name
	order by 1 desc
	
--4: Sepetteki ürünlerin minumum fiyatı nedir?
	select min(total_price) as "Minumum Fiyat", p.name from baskets as b
	inner join products as p on b.product_id = p.id
	group by p.name
	order by 1 desc
	
--5: Kaç farklı alt kategori vardır?
	select distinct(name) from sub_categories
	
--6: Kategorilerin, alt kategori sayısı nedir?
	select count(*) as "Alt Kategori Sayısı", c.name from categories as c
	inner join sub_categories as sc on c.id = sc.category_id
	group by c.name
	
--7: 100 liranın üzerinde toplam fiyatı olan ürünleri sorgula.
	select p.name,order_number,sum(order_total_price) as "Toplam Fiyat Toplamı" from products as p
	inner join order_details as od on p.id = od.product_id
	inner join orders as o on od.order_id = o.id
	group by p.name,order_number
	Having sum(order_total_price) > 100
	
--8: Ortalama takipçi sayısı 30000'in altında olan satıcıları sorgula.
	select avg(follower_count) as "Ortalama Takipçi Sayısı" , s.name from products as p
	inner join product_sellers as ps on p.id = ps.product_id
	inner join sellers as s on ps.seller_id = s.id
	group by s.name
	Having avg(follower_count) <= 30000
	
--9: Ücreti ödenmemiş siparişi tarihi ile birlikte sorgula.
	select count(*) as "Ödememiş Sipariş Sayısı", payment_date, payment_description from orders as o 
	inner join payments as p on p.order_id = o.id
	left join payment_types as pt on p.id = pt.payment_id
	where payment_description = 'ödenmedi' 
	group by payment_date, payment_description
	
--10: Kaç farklı ülkeden sipariş verildi.
	select count(distinct(c.name)) from countries as c
	inner join addresses as ad on c.id = ad.country_id
	inner join customers as cus on ad.customer_id = cus.id
	inner join orders as o on cus.id = o.customer_id
	
--11: Bir ürünün kaç farklı beden seçeneği vardır?
	select p.name, count(s.id) as "Beden Sayısı" from products as p
	inner join product_size as ps on p.id = ps.product_id
	inner join size as s on ps.size_id = s.id
	group by p.name
	
--12: Renklere ve ürüne göre grupla ve ortalama unit price değeri 300'den fazla olan değerleri sorgula.
	select p.name,c.name, avg(unit_price) from products as p
	inner join product_color as pc on p.id = pc.product_id
	inner join colors as c on pc.color_id = c.id
	group by p.name,c.name
	having avg(unit_price)>300
	
--13: En pahalı ürünü satan satıcı kimdir?
	select max(unit_price), b.name from products as p
	inner join product_brand as pb on p.id = pb.product_id
	inner join brands as b on pb.brand_id = b.id
	group by b.name
	order by max(unit_price) desc
	Limit 1;
	
--14: Email adresi etiya.com olan kaç kişi vardır?
	select count(*) from customers
	where email like '%etiya.com'
	
--15: Ortalama birim fiyat değeri 300 ün üstünde olan ve stok değeri 40 üstünde olan ürünlerin sayısı nedir?
	select count(*) from products
	where stock > 40
	having avg(unit_price) >300