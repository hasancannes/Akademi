--1: Belirtilen ülkeler ve apartmant numaralarına göre adresleri sorgula.
	SELECT * FROM adresses
	WHERE country_id in(1,3) and apartment_no in (50,35)
	
--2: Müşterilerin kaç adet adresi var?
	SELECT count(*) as adres_sayısı, c.name, c.surname from adresses as ad
	inner join customers as c on ad.customer_id = c.id
	Group by c.name,c.surname
	Order by c.name DESC
	
--3: Müşterilen adreslerinin dağılımı nasıl?(ev,iş vs)
	SELECT count(*) as adres_sayısı, t.title_names, c.name, c.surname from adresses as ad
	inner join title as t on ad.title_id = t.id
	inner join customers as c on ad.customer_id = c.id
	Group by c.name,c.surname,t.title_names
	Order by c.name DESC
	
--4: Ürünlerin kaç farklı renk seçeneği var?
	select count(c.id) as renk_adedi, p.name from products as p
	inner join color_products as cp on p.id=cp.product_id
	inner join colors as c on cp.colors_id = c.id
	group by p.name
	order by 2
	
--5: Ürünlerin renk ve size seçeneklerine göre kaç farklı kombinasyon oluşturulacağını bulunuz ve
-----stok bilgilerini getiriniz.
	select count(s.id) as renk_size_toplam, p.name, p.unit_price, p.stocks from size as s
	inner join size_products as sp on sp.size_id = s.id
	inner join products as p on sp.product_id = p.id
	inner join color_products as cp on p.id = cp.product_id
	inner join colors as c on cp.colors_id = c.id
	group by p.name,p.unit_price,p.stocks
	
--6: Kategorilerin kaç farklı alt kategorisi vardır?
	select  c.name,count(sc.id) as altkategori_sayısı from categories as c
	inner join sub_categories as sc on c.id = sc.category_id
	group by c.name
	
--7: Ürünlerin ortalama fiyatlarını hesaplayınız ve virgülden sonra tek hane olacak şekilde yazdırınız.
	select round(avg(unit_price),1) as ortalama_fiyat, name from products
	group by name
	
--8: Satıcıları sahip oldukları ürün çeşidi sayısına göre büyükten küçüğe sıralayınız.
	select count(p.id) as ürün_sayısı, s.type from products as p 
	inner join product_sellers as ps on p.id = ps.product_id
	inner join sellers as s on ps.seller_id = s.id
	group by s.type
	order by 1 desc
--9: Geri iade edilen ürünlerin, toplam satılan ürünlere oranı nedir.
	select ((select count(*)::double precision from products as p
	inner join order_products as op on p.id = op.product_id
	full join product_return as pr on op.id = pr.order_product_id
	where not payment_return_date is null) /
	(select count(*)::double precision from products as p
	inner join order_products as op on p.id = op.product_id
	full join product_return as pr on op.id = pr.order_product_id))*100 as return_percentage
	 
--10: Creditcard bilgisi olmayan müşterileri sorgula.
	select * from customers as c
	full join creditcard as cc on c.id = cc.customer_id
	where cc.id is null
	
--11: İsmi cem olan ve istanbul'da yaşayan kişileri sorgula
	select * from customers as c
	inner join adresses as ad on c.id = ad.customer_id
	inner join country as co on ad.country_id = co.id
	inner join city as ci on co.city_id = ci.id
	where c.name = 'cem' and ci.city_names = 'İstanbul'
	
--12: Total price'ı 50'den büyük ve geri iade edilmeyen ürünleri sorgula
	select * from products as p
	inner join order_products as op on p.id = op.product_id
	full join product_return as pr on op.id = pr.order_product_id
	where return_entry_date is null and total_price > money(50)
	
--13: Şehirlere göre müşteri sayılarını getiriniz.
	select count(ci.id), ci.city_names from customers as c
	inner join adresses as ad on c.id = ad.customer_id
	inner join country as co on ad.country_id = co.id
	inner join city as ci on co.city_id = ci.id
	group by ci.city_names
	
--14: 2021'den sonra sipariş bilgisi olan müşterileri sorgulayınız.
	select * from customers as c
	inner join orders as o on c.id = o.customer_id
	where date_part('year',order_date) >= 2021
	
--15: İndirimli alınan ürünleri sorgulayınız.
	select * from order_products as op
	full join discounts as d on op.discount_id = d.id
	where discount_id is not null
	
--16: Müşteri tablosunda isim ve soyisim kolonlarını birleştir ve ismin ilk harfi ve soyisim büyük olsun.
	select (concat(initcap(name),' ', upper(surname))) as isim_soyisim, email, from customers
	
--17: Ürünlerin minumun fiyatlarını hesapla ve fiyatlara göre asc sırala.
	select min(unit_price), name from products
	group by name
	order by 1
	
--18: Müşteri tablosuna 5 adet satır ekle.
	insert into customers values('6','ahmet','cevdet','ahmet@gmail.com'),
	('7','mehmet','kılıc','mehmet@gmail.com'),
	('8','ali','güzel','ali@gmail.com'),
	('9','buse','gül','buse@gmail.com'),
	('10','ece','bal','ece@gmail.com');
	
--19: Müşteri tablosunda, hasan isimli kullanıcın email adresini değiştir.
	update customers set email = 'hasancan@gmail.com'
	where name = 'hasan'
	
--20: En yüksek ücretli siparişi veren müşteriyi sorgula.
	select  c.name, max(total_price) from customers as c
	inner join orders as o on c.id = o.customer_id
	inner join order_products as op on o.id = op.orders_id
	group by c.name, op.total_price
	order by 2 desc
	limit 1;
	
	
	

	
	
	
	
	