failed = 0
success = 0
lessonCount = int(input("Ders Sayinizi Giriniz: "))

sonuc = []
failedDict = {"Ders ve Ortalamasi":sonuc}
sonuc1= []
passedDict = {"Ders ve Ortalamasi":sonuc1}
for i in range(1,lessonCount+1):
    midtermGrade = float(input(f"{i}. Dersinizin Midterm Notunuzu Giriniz: "))
    finalGrade = float(input(f"{i}. Dersinizin Final Notunuzu Giriniz: "))
    meanGrade = (0.40 * midtermGrade) + (0.60 * finalGrade)
    if meanGrade <=50:
        failed +=1
        sonuc.append([i,meanGrade])
    elif 50<meanGrade<=100:
        success +=1
        sonuc1.append([i,meanGrade])
    else:
        print("Geçersiz Not Değerleri Girdiniz")    

print(f"Toplamda {failed} Dersten Kaldiniz, Bilgileri: {failedDict}")
print(f"Toplamda {success} Dersten Gectiniz, Bilgileri: {passedDict}")