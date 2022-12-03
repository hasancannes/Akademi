--1: Kargo şirketlerine toplam kaç para ödendiğini hesaplayınız.
	--not:Cargo_companies tablosuna shipment_fee adında kolon eklendi.
	select sum(shipment_fee) from cargo_companies
	
--2: Halihazırda indirimli ve isminde 'p' geçen tüm ürünleri listeleyiniz.
	--not: discount ve discount_type tabloları eklenip one to many ilişki kuruldu.Ardından order details tablosu
	--ile discount bağlandı.
	select * from products as p
	inner join order_details as od on p.id = od.product_id
	inner join discounts as d on od.discount_id = d.id
	where p.name like '%p%'
	
--3: 3. harfi c olan tüm ürünleri listeleyiniz.
	select * from products
	where name like '__c%'
	
--4: Bir kişinin sipariş oluştururken kullanacağı insert komutlarını yazınız
--(alt tablolar dahil ve siparişte en az 3 ürün olacak şekilde)
	select * from order_details
	insert into order_details(order_number,quantity,product_id,order_id,order_total_price) values(2,5,9,5,100)
	insert into order_details(order_number,quantity,product_id,order_id,order_total_price) values(3,6,10,2,200)
	insert into order_details(order_number,quantity,product_id,order_id,order_total_price) values(4,4,8,4,300)
	
--5: Sipariş oluşturduktan sonra sepeti boşaltacak update komutlarını oluşturunuz.
	--Exists cümleciği ile () içindeki yani altsorgudaki değerlerin varlığı sorgulanır ve buna göre
	--delete ile veri silme işlemi gerçekleşir.
	delete from baskets 
	where exists
	(select * from baskets as b
	inner join products as pr on b.product_id = pr.id
	inner join order_details as od on od.product_id = pr.id
	where od.id is not null)
	
--6: İndirim halindeki ürünlerin indirim uygulanmış fiyatlarıyla listelenmesini sağlayınız.
	select p.name, (order_total_price-discount_price) as "İndirimli Sipariş Tutarı" from products as p
	inner join order_details as od on p.id = od.product_id
	inner join discounts as d on od.discount_id = d.id
	
--7: Kullanıcı bir ürünü review ettiğinde (puanladığında) oluşacak insert komutunu geliştiriniz.
	--not: product tablosuna product_rating kolonu eklendi.
	insert into products(name,unit_price,stock,category_id,product_rating) values('ayakkabi',100,400,2,4)
	
--8: Kullanıcı bir ürün iade etmek istediğinde oluşacak insert komutunu geliştiriniz.
	insert into order_returns(total_price,order_detail_id,number_of_returns,return_detail)
	values(120,4,1,'iade girişi yapıldı')
	
--9: İade durumları değiştiğinde oluşacak update komutunu geliştiriniz.
	--not: return_detail kolonu eklendi
	update order_returns set return_detail = 'iade onaylandı'
	where return_detail = 'iade red edildi'
	
--10: Satıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz.
	update products set name = 'bot'
	where name = 'ayakkabi'
	
--11: Sipariş durumu (kargoda,taşımada vs) değiştiğinde tabloda değişikliği yapacak update komutunu geliştiriniz.
	update cargo_companies set cargo_details = 'Teslim Edildi'
	where cargo_details = 'Sipariş yolda'
	
--12: Kullanıcı sepete ürün eklediğinde oluşacak insert komutunu geliştiriniz.
	insert into baskets(total_price,product_id,customer_id) values (1000,6,4)
	
--13: Kullanıcı sepetteki ürün adetini artırdığında oluşacak komutu geliştiriniz.
	insert into baskets(total_price,product_id,customer_id)
	values(100,10,3)
	
--14: En az bir sipariş vermiş ancak hiç "MNG Kargo" kullanmamış müşterileri listeleyiniz
	select c.name, cc.cargo_details,cc.name from products as p
	inner join order_details as od on p.id = od.product_id
	inner join orders as o on od.order_id = o.id
	inner join cargo_companies as cc on o.cargo_company_id = cc.id
	inner join customers as c on o.customer_id = c.id
	where not cc.name = 'mng'
	
--15: En az bir adet aynı üründen 10+ sipariş vermiş kullanıcıları ve ürünü listeleyiniz.
	select c.name,p.name from customers as c
	inner join orders as o on c.id = o.customer_id
	inner join order_details as od on o.id = od.order_id
	inner join products as p on od.product_id = p.id
	where od.quantity >=10
	
--16: Onaylanmamış ödemeleri listeleyiniz.
	select * from payments
	where payment_description = 'onaylanmadı'
	
--17: En az 2 farklı ülkede adresi olan kullanıcıları listeleyiniz.
	select count(c.id) as "Adreslere Göre Ülke Sayısı", cus.name from countries as c
	inner join addresses as ad on c.id = ad.country_id
	inner join customers as cus on ad.customer_id = cus.id
	group by cus.name
	having count(c.id)>=2
	
--18: En az 2 farklı şehirde adresi olan ve bu adreslere en az 1 adet sipariş vermiş kullanıcıları listeleyiniz.
	select  cus.name,count(distinct(c.id)) "En az 1 Siparişli Şehir Sayısı" from cities as c
	inner join countries as co on c.country_id = co.id
	inner join addresses as ad on co.id = ad.country_id
	inner join customers as cus on ad.customer_id = cus.id
	inner join orders as o on cus.id = o.customer_id
	inner join order_details as od on o.id = od.order_id
	group by cus.name
	having count(distinct(c.id))>=2
	
--19: Eklenmiş ancak hiç bir siparişte kullanılmamış adresleri listeleyiniz.
	select * from addresses as ad 
	left join customers as cus on ad.customer_id = cus.id
	left join orders as o on cus.id = o.customer_id
	left join order_details as od on o.id = od.order_id
	where od.id is null
	