# input
userInput = input("Değer Giriniz: ")
print(f"Girilen değer: {userInput}")

#Type Conversion
numberStr = "10"
print(type(numberStr))
number = int(numberStr)
print(number + 10)
print(type(number))

userInput = input("Ders Notunu Giriniz: ")
lessonNote = int(userInput)
print(f"Ders notu = {lessonNote}")

# Şart blokları
if lessonNote>50:
    print("Geçtiniz")
elif lessonNote == 50:
    print("Sinirda Geçtiniz")
elif lessonNote == 49:
    print("Sinirda Kaldiniz")
else:
    print("Kaldiniz")

# infinite loop
# while True:
    print("I am infinite")

i=0
while i<10:
    print(i)
    i+=1
# workshop1
lessonCount = int(input("Ders Sayinizi Giriniz"))

passExam=0
failedExam=0
passedList = []
failedList = []
for i in range(lessonCount):
    midterm = float(input(f"{i+1}. Dersinizin Midterm Notunu Giriniz:"))
    final = float(input(f"{i+1}. Dersinizin Final Notunu Giriniz:"))
    ortalama = (midterm*0.4) + (final*0.6)
    if ortalama<=50:
        print(f"{i+1}. Dersten Kaldiniz")
        failedExam +=1
        failedList.append(i)
    elif 50<ortalama<=100:
        print(f"{i+1}. Dersten Gectiniz")
        passExam +=1
        passedList.append(i)
    else:
        print("Gecersiz Not Girdiniz")
print(f"{passExam} adet dersten gectiniz ve dersleriniz: {passedList}")
print(f"{failedExam} adet dersten kaldiniz ve dersleriniz: {failedList}")
