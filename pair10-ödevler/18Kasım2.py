# ödev 2
# Şirket çalışanları verilerini tutan dosya açılacak(txt)
# Kullanıcıdan çalışan sayısı alınacak
# Çalışan sayısı kadar isim soy isim maaş bilgisi alınacak
# Dosyadaki her satıra "ad soyad - maaş" kalıbında bilgiler eklenecek
# Programın sonunda bu dosyadan bilgileri satır satır okuyup listeleyecek kod yazılacak.
# Eklenen çalışanlar silinmeyecek üzerine yazılacak.

employeesCount = int(input("Şirketinizin Çalişan Sayisini Giriniz: "))
try:
    for i in range(1,employeesCount+1):
        try:
            name = str(input(f"{i}. Çalisaninizin Adini Giriniz: "))
            surname = str(input(f"{i}. Çalisaninizin SoyAdini Giriniz: "))
            salary = float(input(f"{i}. Çalisaninizin Maas Bilgisini Giriniz: "))
        except:
            print("Lütfen Sayi Giriniz")
        file = open("employees.txt","a+")
        try:
            file.writelines(f"{name} {surname} - {salary}\n")
        except:
            print("Hatali giriş tespit edildi.")
    file = open("employees.txt","r")
    line = file.readlines()
    valueList = []
    for i in line:
        clearValues = i.rstrip("\n")
        valueList.append(clearValues)
    print(valueList)
    file.close()
except:
    print("En az bir calisaniniz olmasi gerekmektedir.")
