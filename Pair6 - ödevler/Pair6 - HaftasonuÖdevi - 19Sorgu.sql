--1: Kargo şirketlerine toplam kaç para ödendiğini hesaplayınız.
	select sum(shipping_fee) as ÖDENECEK_TUTAR from cargo_companies;

--2: Halihazırda indirimli ve isminde 'b' geçen tüm ürünleri listeleyiniz.
  --products tablosunun içersine (at_a_discount) adında boolean değer alan kolon eklenmiştir.
  --at_a_discount = TRUE ise ürün indirimdedir.
	select * from products as p
	where  (p.at_a_discount is TRUE) AND  (LOWER(p.name) LIKE '%b%')
   
   
--3: 3.harfi c olan tüm ürünleri getiriniz.
-- küçük harf c ve büyük harf C dikkate alınmalıdır.
	select * from products as pro
	where pro.name LIKE '__C%' or pro.name LIKE '__c%'
  

--4: Bir kişinin sipariş oluştururken kullanacağı insert komutlarını yazınız 
--(alt tablolar dahil ve siparişte en az 3 ürün olacak şekilde)
	insert into 
	order_details (order_number,quantity,product_id,order_id,order_total_price)
	values
	(91,5,(select products.id from products where products.name='etek'),5,100),
	(87,10,(select products.id from products where products.unit_price=150.00),1,1500),
	(33,10,(select products.id from products where products.stock<=25),2,2000);
	
--5) Sipariş oluşturduktan sonra sepeti boşaltacak update komutlarını oluşturunuz.
--5.1:
	insert into order_details(order_number,quantity,product_id,order_id,order_total_price,discount_id)
	values(2,50,7,3,500,2);
	update baskets set total_price = NULL where is_go_order = TRUE;
	update baskets set product_id = NULL where is_go_order = TRUE;
	update baskets set customer_id = NULL where is_go_order = TRUE;
	delete from baskets;
	where total_price = null and product_id = null and customer_id = NULL;
--5.2:
	delete from baskets 
	where exists
	(select * from baskets as b
	inner join products as pr on b.product_id = pr.id
	inner join order_details as od on od.product_id = pr.id
	where od.id is not null)
                               
--6)İndirim halindeki ürünlerin indirim uygulanmış fiyatlarıyla listelenmesini sağlayınız.
	select p.name as ürün_ismi ,d.type as indirim_miktarı,od.order_total_price as ürün_fiyatı,
	(od.order_total_price-d.type) as indirimli_fiyat from discount d
	inner join order_details od
	on d.id=od.discount_id
	inner join products p 
	on od.product_id=p.id
	group by p.name,d.type,od.order_total_price

--7)Kullanıcı bir ürünü review ettiğinde (puanladığında) oluşacak insert komutunu geliştiriniz. 
	insert into products(name,unit_price,stock,category_id,rating)
	values ('etek','600',60,1,'6');
	select AVG(rating) from products
	where name='etek'

--8)Kullanıcı bir ürün iade etmek istediğinde oluşacak insert komutunu geliştiriniz.
	insert into order_returns (total_price,order_detail_id,number_of_returns) 

--9: İade durumları değiştiğinde oluşacak update komutunu geliştiriniz.
	--not: return_detail kolonu eklendi
	update order_returns set return_detail = 'iade onaylandı'
	where return_detail = 'iade red edildi'

--10: Satıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz.
	update products set name = 'bilgisayar',stock = '140'
	where name = 'elektronik'


--11: Sipariş durumu (kargoda,taşımada vs) değiştiğinde tabloda değişikliği yapacak update komutunu geliştiriniz.
	update cargo_companies set cargo_details = 'dağıtım kargo şirketinde'
	where cargo_details = 'siparişiniz yolda'

--12: Kullanıcı sepete ürün eklediğinde oluşacak insert komutunu geliştiriniz.
    insert into baskets(total_price,product_id,customer_id) values (700,6,2)
	
--13: Kullanıcı sepetteki ürün adetini artırdığında oluşacak komutu geliştiriniz.
	update baskets set quantity = 7
	where quantity = 5
	
--14: En az bir sipariş vermiş ancak hiç "MNG Kargo" kullanmamış müşterileri listeleyiniz
	select c.name, cc.cargo_details,cc.name from products as p
	inner join order_details as od on p.id = od.product_id
	inner join orders as o on od.order_id = o.id
	inner join cargo_companies as cc on o.cargo_company_id = cc.id
	inner join customers as c on o.customer_id = c.id
	where not lower(cc.name) like '%mng%'
	
--15: En az bir adet aynı üründen 10+ sipariş vermiş kullanıcıları ve ürünü listeleyiniz.
	select c.name,p.name from customers as c
	inner join orders as o on c.id = o.customer_id
	inner join order_details as od on o.id = od.order_id
	inner join products as p on od.product_id = p.id
	where od.quantity >=10
	
--16: Onaylanmamış ödemeleri listeleyiniz.
	select od.id "Sipariş Numarası" from order_details od
	left join orders o on od.order_id = o.id
	where od.order_id is null

--17: En az 2 farklı ülkede adresi olan kullanıcıları listeleyiniz.
	select cu.name "Ad", cu.surname "Soyad" from customers cu
	inner join addresses ad on cu.id = ad.customer_id
	inner join streets st on ad.street_id = st.id
	inner join districts di on st.district_id = di.id
	inner join cities ci on di.city_id = ci.id
	inner join countries co on ci.country_id = co.id
	group by cu.name, cu.surname 
	having count(cu.name) >= 2;

--18: EN az 2 farklı şehirde adresi olan ve bu adreslere en az 1 adet sipariş vermiş kullanıcıları 
--listeleyiniz.
	select cu.name "Ad", cu.surname "Soyad", count (cu.name) "Farklı şehirlerden sipariş verme sayısı" from order_details od
	inner join orders o on od.order_id = o.id
	inner join customers cu on o.id = cu.id
	inner join addresses ad on cu.id = ad.customer_id
	inner join streets st on ad.street_id = st.id
	inner join districts di on st.district_id = di.id
	inner join cities ci on di.city_id = ci.id
	group by cu.name, cu.surname
	having count(ci.name) >= 2

--19: Eklenmiş ancak hiç bir siparişte kullanılmamış adresleri listeleyiniz.
	select ad.title "Adres İsmi", st.name "Cadde", d.name"Mahalle", ci.name"Şehir", co.name"Ülke" from order_details od
	left join orders o on od.order_id = o.id
	left join customers cu on o.id = cu.id
	left join addresses ad on cu.id = ad.customer_id
	left join streets st on ad.street_id = st.id
	left join districts d on st.district_id = d.id
	left join cities ci on d.city_id = ci.id
	left join countries co on ci.country_id = co.id
	where od.order_id is null