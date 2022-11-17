dolarDun = 18.01
dolarBugun = 19.10

if dolarDun == dolarBugun:
    print("Dolar kuru sabit")
elif dolarDun < dolarBugun:
    print("Dolar kurunda artiş var")
else:
    print("Dolar kurunda azaliş var")


# Bölüm ödevi 1
sayi1 = float(input("Birinci sayiyi giriniz: "))
sayi2 = float(input("İkinci sayiyi giriniz: "))

if sayi1>sayi2:
    print(f"{sayi1} değeri {sayi2} değerinden büyüktür.")
elif sayi1<sayi2:
    print(f"{sayi2} değeri {sayi1} değerinden büyüktür.")
else:
    print(f"{sayi1} ve {sayi2} eşittir.")

# Bölüm ödevi 2
# 1.yöntem
sayi1 = float(input("Birinci sayiyi giriniz: "))
sayi2 = float(input("İkinci sayiyi giriniz: "))
sayi3 = float(input("Üçüncü sayiyi giriniz: "))

liste = [sayi1,sayi2,sayi3]
print("Liste methodu ile: ")
print(f"En büyük sayi = {max(liste)}")
print(f"En küçük sayi = {min(liste)}")

# 2.yöntem
print("If else bloklari ile: ")
if sayi1>=(sayi2 and sayi3):
    print(f"En büyük sayi = {sayi1}")
elif sayi2>=(sayi1 and sayi3):
    print(f"En büyük sayi = {sayi2}")
else:
    print(f"En büyük sayi = {sayi3}")
if sayi1<=(sayi2 and sayi3):
    print(f"En kücük sayi = {sayi1}")
elif sayi2<=(sayi1 and sayi3):
    print(f"En kücük sayi = {sayi2}")
else:
    print(f"En kücük sayi = {sayi3}")

# Bölüm ödevi3

### Bütün altın ve para değerlerinin değişme durumları, if-else bloklarına örnektir.