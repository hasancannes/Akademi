# Kullanicidan vize ve final notları
# Vize %40 final %60 etkili
# vize ve final notları 50.5 gibi ondalıklı olabilir
# Uygulama ortalamayı hesaplayacak ve ortalamaya göre
# 0-49 FF
# 50-60 DD
# 60-70 CC
# 70-80 BB
# 80-100 AA
# Not ortalamasını ve not harfini kullanıcıya göster.

# Ödev1
midtermGrade = float(input("Midterm Notunuzu Giriniz: "))
finalGrade = float(input("Final Notunuzu Giriniz: "))
meanGrade = (0.40 * midtermGrade) + (0.60 * finalGrade)

if 0<=meanGrade<=49:
    print(f"Not ortalamaniz {meanGrade} ve Harf Notunuz: FF")
elif 50<=meanGrade<=60:
    print(f"Not ortalamaniz {meanGrade} ve Harf Notunuz: DD")
elif 60<meanGrade<=70:
    print(f"Not ortalamaniz {meanGrade} ve Harf Notunuz: CC")
elif 70<meanGrade<=80:
    print(f"Not ortalamaniz {meanGrade} ve Harf Notunuz: BB")
elif 80<meanGrade<=100:
    print(f"Not ortalamaniz {meanGrade} ve Harf Notunuz: AA")
else:
    print("Geçersiz Not Değerleri Girdiniz.")

# Ödev2

failed = 0
success = 0
lessonCount = int(input("Ders Sayinizi Giriniz: "))
passedList = []
failedList = []
for i in range(1,lessonCount+1):
    midtermGrade = float(input(f"{i}. Dersinizin Midterm Notunuzu Giriniz: "))
    finalGrade = float(input(f"{i}. Dersinizin Final Notunuzu Giriniz: "))
    meanGrade = (0.40 * midtermGrade) + (0.60 * finalGrade)
    if meanGrade <=50:
        print(f"{i}. Dersi Geçemediniz ve Not Ortalamaniz {meanGrade}")
        failed +=1
        failedList.append(i)
    elif 50<meanGrade<=100:
        print(f"{i}. Dersi Geçtiniz ve Not Ortalamaniz {meanGrade}")
        success +=1
        passedList.append(i)
    else:
        print("Geçersiz Not Değerleri Girdiniz")    
print(f"{success} adet dersten gectiniz ve gectiğiniz dersleriniz: {passedList}")
print(f"{failed} adet dersten kaldiniz ve kaldiğiniz dersleriniz: {failedList}")


