### 1- Veri Modelleme Nedir, Neden İhtiyaç Duyulur?
# Veri modelleme, verileri ve nasıl aktığını temsil etmek için metin ve semboller kullanarak bir yazılım 
# sisteminin ve içerdiği veri öğelerinin basitleştirilmiş bir diyagramını oluşturma işlemidir. Veri modelleri, 
# yeni bir veritabanı tasarlamak veya eski bir uygulamayı yeniden yapılandırmak için bir plan sağlar. Veri modelleme,
# verilerin nasıl depolandığını yapılandırmak ve veriler içindeki ilişkileri modellemek için kullanılan süreçtir. 
# Amaç, önemli veri ilişkilerini vurgularken veri yapısını, verilerin sistem boyunca nasıl akacağını doğru bir şekilde 
# tanımlayan görsel bir veri haritası oluşturmaktır. 

### 2- Primary Key, Foreign Key, Veri Modellemede ilişkiler(One to one, many to many etc)
# - Veri modelleme işlemlerinde başlıca dikkat edilmesi gereken işlemler vardır. Bunlardan iki tanesinden bahsetmek 
# gerekirse: - Relation (İlişki): Modellenecek veri tabanında birden çok tablo olduğu durumlarda, tablolar arası ilişkiler
# kurarak, veri manipule etme işlemlerini gerçekleştirebiliriz. Veri farklı tablolara bölerek karmaşıklığı önlemiş ve düzeni sağlamış oluruz. Relation işlemleri kısıtlayıcılar ile gerçekleştirilir.
# - Constraint (Kısıtlayıcı): Veri modelleme işlemlerinde bir çok kısıtlayıcı bulunmaktadır. Temel olarak burada 
# bahsedeceğimiz kısıtlayıcılar *primary key* ve *foreign key*.
# - Primary key: Birincil anahtar olarak adlandırılan primary key'ler, tablodaki verilerin birbirinden ayrılmasını 
# ve her birinin birer eşsiz değere sahip olmasını sağlar. Buna örnek olarak TC kimlik numaraları verilebilir.
#  Her tabloda sadece bir adet primary key bulunabilir ve bu şekilde ayrım sağlanır.
# - Foreign key: İkincil anahtarlar ise, veri tabanı içindeki tabloların birbiri ile ilişkilendirilmesini sağlayan
#  kısıtlayıcılardır. Örneğin müşteri ve ürün adında iki tablomuz olduğunu düşünelim. Müşteri ve müşterilerin satın
#  aldığı ürünler iki farklı tabloda tutuluyor ve onları ilişkilendirebilmek için, veri modelleme sürecinde foreign
#  key'lere ihtiyaç duyarız.
#- One to one: Tablolar arasında kurulan bağlantıda sonuçlar 1-1 dönüyorsa, one to one diyebiliriz. Örnek olarak 
# kişi ve tc kimlik numarasının tutulduğu iki tablo örnek verirsek. Her 1 kişinin, 1 adet TC kimlik numarası 
# olacaktır.
# - One to many: Tablolar arasında, 1 değere karşılık bir çok değerin gelmesidir. Örneğin, sınıf ve sınıftaki 
# öğrencileri tutan iki tablo düşünelim. Burada, A sınıfına karşılık 30 öğrenci gelecektir. Bu da one to many 
# durumuna örnektir.
# - Many to many: Bu ilişki aslında birden çok One-To-Many ilişkinin bir araya gelmesinden oluşur. Bu ilişkileri 
# bir araya getirecek olan ve  Many-To-Many ilişkiyi sağlayacak olan bir ara bağlantı tablosudur. Bu tablo sadece 
# ilişkide gerekli olan alanları tutar. Bir film birden fazla kategoriye sahip olabilir.(dram, psikolojik gerilim…)
# bir kategoride de birden fazla film olabilir. Bu durumda karşılıklı olarak film ve kategori tabloları birbirine 
# many to may olarak ilişkilidir.

### 3- ER Diagram Nedir?
# - Veri modelleme sürecinin teknik kısmı ile birlikte en önemli aşamalarından birisi veri modelini 
# görselleştirmektir. Görselleştirme işlemi bir çok farklı method ile yapılabilir. Örnek olarak, ER diagramları 
# sıklıkla kullanılan methodlardan birisidir. Sql üzerinde ER diagramları ile tablolar arasındaki ilişkileri 
# belirtebilir ve görsel düzenlemelerimizi yapabiliriz. Aşağıdaki görsel ER diagrama örnektir.